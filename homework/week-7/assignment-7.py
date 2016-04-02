from __future__ import division

import numpy as np
import matplotlib.mlab as mlab
import scipy.io as sio
import pdb

# Prelude
# =============================================================================

matlab_data = sio.loadmat('data/assignment-7.mat')

# Exercise 1a
# =============================================================================

def estimate_mean(data):
    return np.matrix(data).mean(axis=1)

def estimate_covariance(data):
    return np.cov(data)

mean_a = estimate_mean(matlab_data['A'])
mean_b = estimate_mean(matlab_data['B'])

cov_a = estimate_covariance(matlab_data['A'])
cov_b = estimate_covariance(matlab_data['B'])

# Exercise 1b
# =============================================================================

def classify_3d(data, x):
    x1, x2, x3 = x

    probability_a = data['A'].shape[1] / (data['A'].shape[1] + data['B'].shape[1])
    probability_b = data['B'].shape[1] / (data['A'].shape[1] + data['B'].shape[1])

    mean_x1_a = np.mean(data['A'][0,:])
    mean_x2_a = np.mean(data['A'][1,:])
    mean_x3_a = np.mean(data['A'][2,:])

    mean_x1_b = np.mean(data['B'][0,:])
    mean_x2_b = np.mean(data['B'][1,:])
    mean_x3_b = np.mean(data['B'][2,:])

    variance_x1_a = np.var(data['A'][0,:])
    variance_x2_a = np.var(data['A'][1,:])
    variance_x3_a = np.var(data['A'][2,:])

    variance_x1_b = np.var(data['B'][0,:])
    variance_x2_b = np.var(data['B'][1,:])
    variance_x3_b = np.var(data['B'][2,:])

    pd_x1_given_a = mlab.normpdf(x1, mean_x1_a, variance_x1_a)
    pd_x2_given_a = mlab.normpdf(x2, mean_x2_a, variance_x2_a)
    pd_x3_given_a = mlab.normpdf(x3, mean_x3_a, variance_x3_a)
    pd_x1_given_b = mlab.normpdf(x1, mean_x1_b, variance_x1_b)
    pd_x2_given_b = mlab.normpdf(x2, mean_x2_b, variance_x2_b)
    pd_x3_given_b = mlab.normpdf(x3, mean_x3_b, variance_x3_b)

    posterior_numerator_a = probability_a * pd_x1_given_a * pd_x2_given_a * pd_x3_given_a
    posterior_numerator_b = probability_b * pd_x1_given_b * pd_x2_given_b * pd_x3_given_b

    posterior_numerators = { 'A': posterior_numerator_a, 'B': posterior_numerator_b }

    return max(posterior_numerators.iterkeys(), key=(lambda k: posterior_numerators[k]))

predicted_class = classify_3d(matlab_data, [2, 2, 8])

# Exercise 1c
# =============================================================================

combined_matlab_data = np.concatenate((matlab_data['A'], matlab_data['B']), axis=1)
cov_dataset = np.cov(combined_matlab_data)
U, s, Vt = np.linalg.svd(cov_dataset)

V = Vt.T
S = np.diag(s)

first_principal = U[:, 0:1].T
second_principal = U[:, 1:2].T

original_matrix = combined_matlab_data
reconstructed_matrix =  np.dot(first_principal, original_matrix)

original_matrix_variance = np.var(original_matrix)
reconstructed_matrix_variance = np.dot(first_principal, np.dot(cov_dataset, first_principal.T))

# Exercise 1d
# =============================================================================

def classify_1d(data, x):
    x1 = x[0]

    probability_a = data['A'].shape[1] / (data['A'].shape[1] + data['B'].shape[1])
    probability_b = data['B'].shape[1] / (data['A'].shape[1] + data['B'].shape[1])

    mean_x1_a = np.mean(data['A'][0,:])
    mean_x1_b = np.mean(data['B'][0,:])

    variance_x1_a = np.var(data['A'][0,:])
    variance_x1_b = np.var(data['B'][0,:])

    pd_x1_given_a = mlab.normpdf(x1, mean_x1_a, variance_x1_a)
    pd_x1_given_b = mlab.normpdf(x1, mean_x1_b, variance_x1_b)

    posterior_numerator_a = probability_a * pd_x1_given_a
    posterior_numerator_b = probability_b * pd_x1_given_b

    posterior_numerators = { 'A': posterior_numerator_a, 'B': posterior_numerator_b }

    return max(posterior_numerators.iterkeys(), key=(lambda k: posterior_numerators[k]))

matrix_a = matlab_data['A']
matrix_b =  matlab_data['B']

matrix_a_mean = matrix_a.mean(axis=1)
matrix_a_variance = np.var(matrix_a)

matrix_b_mean = matrix_b.mean(axis=1)
matrix_b_variance = np.var(matrix_b)

projected_matrix_a = np.dot(first_principal, matrix_a)
projected_matrix_b = np.dot(first_principal, matrix_b)

projected_matrix_a_mean = np.dot(first_principal, matrix_a_mean)
projected_matrix_a_variance = np.dot(first_principal, np.dot(cov_a, first_principal.T))

projected_matrix_b_mean = np.dot(first_principal, matrix_b_mean)
projected_matrix_b_variance = np.dot(first_principal, np.dot(cov_b, first_principal.T))

x = [2, 2, 8]

corrected_x = x

projected_x = np.dot(first_principal, corrected_x)

predicted_class = classify_1d({ 'A': projected_matrix_a, 'B': projected_matrix_b }, projected_x)

pdb.set_trace()

# Exercise 1e
# =============================================================================

original_matrix = combined_matlab_data
reconstructed_matrix =  np.dot(U[:, :2], np.dot(S[:2, :2], V[:,:2].T))

original_matrix_variance = np.var(original_matrix)
reconstructed_matrix_variance = np.var(reconstructed_matrix)

def classify_2d(data, x):
    x1, x2 = x

    probability_a = data['A'].shape[1] / (data['A'].shape[1] + data['B'].shape[1])
    probability_b = data['B'].shape[1] / (data['A'].shape[1] + data['B'].shape[1])

    mean_x1_a = np.mean(data['A'][0,:])
    mean_x2_a = np.mean(data['A'][1,:])

    mean_x1_b = np.mean(data['B'][0,:])
    mean_x2_b = np.mean(data['B'][1,:])

    variance_x1_a = np.var(data['A'][0,:])
    variance_x2_a = np.var(data['A'][1,:])

    variance_x1_b = np.var(data['B'][0,:])
    variance_x2_b = np.var(data['B'][1,:])

    pd_x1_given_a = mlab.normpdf(x1, mean_x1_a, variance_x1_a)
    pd_x2_given_a = mlab.normpdf(x2, mean_x2_a, variance_x2_a)
    pd_x1_given_b = mlab.normpdf(x1, mean_x1_b, variance_x1_b)
    pd_x2_given_b = mlab.normpdf(x2, mean_x2_b, variance_x2_b)

    posterior_numerator_a = probability_a * pd_x1_given_a * pd_x2_given_a
    posterior_numerator_b = probability_b * pd_x1_given_b * pd_x2_given_b

    posterior_numerators = { 'A': posterior_numerator_a, 'B': posterior_numerator_b }

    return max(posterior_numerators.iterkeys(), key=(lambda k: posterior_numerators[k]))

matrix_a = matlab_data['A']
matrix_b =  matlab_data['B']

matrix_a_mean = np.mean(matrix_a)
matrix_a_variance = np.var(matrix_a)

matrix_b_mean = np.mean(matrix_b)
matrix_b_variance = np.var(matrix_b)

projected_matrix_a = np.dot(U[: ,:2].T, matrix_a)
projected_matrix_b = np.dot(U[: ,:2].T, matrix_b)

projected_matrix_a_mean = np.mean(projected_matrix_a)
projected_matrix_a_variance = np.var(projected_matrix_a)

projected_matrix_b_mean = np.mean(projected_matrix_b)
projected_matrix_b_variance = np.var(projected_matrix_b)

projected_x = np.dot(U[: ,0:2].T, x)

# correct_x = [ 6.1028375 , -5.66231849 ]

predicted_class = classify_2d({ 'A': projected_matrix_a, 'B': projected_matrix_b }, projected_x)

pdb.set_trace()

from __future__ import division

import numpy as np
import matplotlib.mlab as mlab
import scipy.io as sio
import pdb

#2a

breast_data = sio.loadmat('data/breast-cancer.mat')

class_2 = [d for d in breast_data['breast_cancer'] if d[10] == 2]
class_4 = [d for d in breast_data['breast_cancer'] if d[10] == 4]

length_2 = len(class_2)
length_4 = len(class_4)

split_2 = int(0.67 * length_2)
split_4 = int(0.67 * length_4)

training_set_a = np.delete(class_2[0:split_2], (0,10), 1)
training_set_b = np.delete(class_4[0:split_4], (0,10), 1)
validation_set_a = np.delete(class_2[split_2:length_2], (0,10), 1)
validation_set_b = np.delete(class_4[split_4:length_4], (0,10), 1)

def classify_1d(data_a, data_b, x):
    x1 = x[0]

    probability_a = data_a.shape[1] / (data_a.shape[1] + data_b.shape[1])
    probability_b = data_b.shape[1] / (data_a.shape[1] + data_b.shape[1])

    mean_x1_a = np.mean(data_a)
    mean_x1_b = np.mean(data_b)

    variance_x1_a = np.var(data_a)
    variance_x1_b = np.var(data_b)

    pd_x1_given_a = mlab.normpdf(x1, mean_x1_a, variance_x1_a)
    pd_x1_given_b = mlab.normpdf(x1, mean_x1_b, variance_x1_b)

    posterior_numerator_a = probability_a * pd_x1_given_a
    posterior_numerator_b = probability_b * pd_x1_given_b

    posterior_numerators = { 'A': posterior_numerator_a, 'B': posterior_numerator_b }

    return max(posterior_numerators.iterkeys(), key=(lambda k: posterior_numerators[k]))
	
def classify_2d(data_a, data_b, x):
    x1 = x[0]
    x2 = x[1]

    probability_a = data_a.shape[1] / (data_a.shape[1] + data_b.shape[1])
    probability_b = data_b.shape[1] / (data_a.shape[1] + data_b.shape[1])

    mean_x1_a = np.mean(data_a[0,:])
    mean_x2_a = np.mean(data_a[1,:])

    mean_x1_b = np.mean(data_b[0,:])
    mean_x2_b = np.mean(data_b[1,:])

    variance_x1_a = np.var(data_a[0,:])
    variance_x2_a = np.var(data_a[1,:])

    variance_x1_b = np.var(data_b[0,:])
    variance_x2_b = np.var(data_b[1,:])

    pd_x1_given_a = mlab.normpdf(x1, mean_x1_a, variance_x1_a)
    pd_x2_given_a = mlab.normpdf(x2, mean_x2_a, variance_x2_a)
    pd_x1_given_b = mlab.normpdf(x1, mean_x1_b, variance_x1_b)
    pd_x2_given_b = mlab.normpdf(x2, mean_x2_b, variance_x2_b)

    posterior_numerator_a = probability_a * pd_x1_given_a * pd_x2_given_a
    posterior_numerator_b = probability_b * pd_x1_given_b * pd_x2_given_b

    posterior_numerators = { 'A': posterior_numerator_a, 'B': posterior_numerator_b }

    return max(posterior_numerators.iterkeys(), key=(lambda k: posterior_numerators[k]))
	
#only x2
training_set_a_only_x2 = training_set_a[:, 0]
training_set_b_only_x2 = training_set_b[:, 0]
validation_set_a_only_x2 = validation_set_a[:, 0]
validation_set_b_only_x2 = validation_set_b[:, 0]

def errors_1d(validation_set_a, validation_set_b, training_set_a, training_set_b):
	error_a = 0
	for x in validation_set_a:
		error_a = error_a + (classify_1d(training_set_a, training_set_b, x) == 'B')
		
	error_b = 0
	for x in validation_set_b:
		error_b = error_b + (classify_1d(training_set_a, training_set_b, x) == 'A')
		
	return error_a, error_b
	
def errors_2d(validation_set_a, validation_set_b, training_set_a, training_set_b):
	error_a = 0
	for x in validation_set_a:
		error_a = error_a + (classify_2d(training_set_a, training_set_b, x) == 'B')
		
	error_b = 0
	for x in validation_set_b:
		error_b = error_b + (classify_2d(training_set_a, training_set_b, x) == 'A')
		
	return error_a, error_b

#first principal component

total_training_set = np.concatenate((training_set_a, training_set_b), axis=0)
cov_training_set = np.cov(total_training_set, rowvar=0)
U, s, V = np.linalg.svd(cov_training_set)
first_principal = U[:, 0:1].T
second_principal = U[:, 1:2].T

training_set_a_fp = np.dot(first_principal, training_set_a.T)
training_set_b_fp = np.dot(first_principal, training_set_b.T)

validation_set_a_fp = np.dot(first_principal, validation_set_a.T).T
validation_set_b_fp = np.dot(first_principal, validation_set_b.T).T

error_a_fp, error_b_fp = errors_1d(validation_set_a_fp, validation_set_b_fp, training_set_a_fp, training_set_b_fp)

#x2 and x8 only
training_set_a_only_x2_and_x8 = training_set_a[:, (0,6)]
training_set_b_only_x2_and_x8 = training_set_b[:, (0,6)]
validation_set_a_only_x2_and_x8 = validation_set_a[:, (0,6)]
validation_set_b_only_x2_and_x8 = validation_set_b[:, (0,6)]

error_a_x2_x8, error_b_x2_x8 = errors_2d(validation_set_a_only_x2_and_x8, validation_set_b_only_x2_and_x8, training_set_a_only_x2_and_x8, training_set_b_only_x2_and_x8)

#first two principal components
training_set_a_sp = np.dot(np.hstack((first_principal.T, second_principal.T)).T, training_set_a.T)
training_set_b_sp = np.dot(np.hstack((first_principal.T, second_principal.T)).T, training_set_b.T)

validation_set_a_sp = np.dot(np.hstack((first_principal.T, second_principal.T)).T, validation_set_a.T)
validation_set_b_sp = np.dot(np.hstack((first_principal.T, second_principal.T)).T, validation_set_b.T)

error_a_sp, error_b_sp = errors_2d(validation_set_a_sp, validation_set_b_sp, training_set_a_sp, training_set_b_sp)



pdb.set_trace()
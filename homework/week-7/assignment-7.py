import numpy as np
import matplotlib.pyplot as plt
import scipy.io as sio
import pdb

# Prelude
# =============================================================================

matlab_data = sio.loadmat('data/assignment-7.mat')

# Exercise 1a
# =============================================================================

def estimate_mean(data):
    return np.mean(data)

def estimate_covariance(data):
    return np.cov(data)

mean_a = estimate_mean(matlab_data['A'])
mean_b = estimate_mean(matlab_data['B'])

cov_a = estimate_covariance(matlab_data['A'])
cov_b = estimate_covariance(matlab_data['B'])

pdb.set_trace()

import numpy as np
import matplotlib.pyplot as plt

np.random.seed(42)

num_samples = 1000   
sample_size = 50     
distribution_range = (0, 10)  

means = []

for _ in range(num_samples):
    sample = np.random.uniform(distribution_range[0], distribution_range[1], sample_size)
    means.append(np.mean(sample))

plt.hist(means, bins=30, edgecolor='black', alpha=0.7, color='blue')
plt.title("Distribution of Sample Means (Central Limit Theorem)")
plt.xlabel("Sample Mean")
plt.ylabel("Frequency")
plt.show()

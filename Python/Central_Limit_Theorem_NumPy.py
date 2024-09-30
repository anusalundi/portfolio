import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

np.random.seed(42)  # For reproducibility
population_size = 100000
data = np.random.exponential(scale=2, size=population_size)

sample_size = 100  # Size of each sample
num_samples = 1000  # Number of samples

sample_means = []

for _ in range(num_samples):
    sample = np.random.choice(data, size=sample_size)
    sample_means.append(np.mean(sample))

plt.figure(figsize=(12, 6))

plt.subplot(1, 2, 1)
sns.histplot(data, bins=50, kde=True, color='blue')
plt.title('Original Data (Exponential Distribution)')
plt.xlabel('Value')
plt.ylabel('Frequency')

plt.subplot(1, 2, 2)
sns.histplot(sample_means, bins=50, kde=True, color='green')
plt.title('Distribution of Sample Means (CLT)')
plt.xlabel('Sample Mean')
plt.ylabel('Frequency')

plt.tight_layout()
plt.show()

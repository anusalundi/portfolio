import numpy as np
import matplotlib.pyplot as plt
import random

n = 100000  # number of steps

x = np.zeros(n)


for i in range(1, n):
    val = random.randint(1, 2)  

    (-1)
    if val == 1:
        x[i] = x[i-1] + 1  # up
    else:
        x[i] = x[i-1] - 1  # down

# Visualisation
plt.figure(figsize=(10, 6)) 
plt.plot(x, color='skyblue', lw=2, alpha=0.7) 
plt.scatter(0, x[0], c='green', s=100, label='Start')  
plt.scatter(n-1, x[-1], c='red', s=100, label='Finish')  

plt.title(f'1D Random Walk with {n} steps', fontsize=16)
plt.xlabel('Number of steps')
plt.ylabel('Location')
plt.grid(True)
plt.legend()

plt.show()

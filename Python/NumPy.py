import numpy as np

# list of 25 values in order

my_values = np.arange(0, 25)
my_values

my_values.shape

my_values.reshape(5, 5)

my_values.reshape(25, 1)

# INDEX

my_values[2] # kuidas saab listist 3. numbri

my_values[2:7] # kuidas saab listist 3-6 numbri

my_values[-2] # hakkab loendama tagasi

# SELECTION

my_values > 20

my_values[my_values > 20] # kõik, mis on 20-st suuremad

x = 8
my_values[my_values > x] # kõik, mis on x-st suuremad

# BROADCASTING

### Allows operations between arrays of different shapes
### Broadcasting allows NumPy to automatically expand the smaller array, , to match the larger array

scores = np.array([
    [60, 89, 78, 55],
    [55, 76, 78, 32],
    [99, 89, 67, 77]
    ])
scores.shape

bonuses = np.array([5, 3, 10, 2])
bonuses.shape

adjusted_scores = scores + bonuses
adjusted_scores

bonuses2 = np.array([5, 3, 10]) # ei tööta, sest peab olema ka 4 numbrit, nagu scores

# REPLACING VALUES

array_zero = np.zeros((10, 10))
array_zero

array_zero[1, :] = 100
array_zero

array_zero.shape

for i in range(10):
    array_zero[i, :] = i
array_zero

# NumPy mathematical operations

array2 = np.arange(0,10)
array2

array2 + array2

array2 - array2

array2 * array2

array2 / array2 # nan sest jagasime 0-ga

arr3 = np.arange(0,101, 1)
arr3

# Ploting array in a line graph

import matplotlib.pyplot as plt
plt.plot(arr3, color='grey') # source of truth

# two times smaller than arr3
plt.plot(arr3/2, color='red')

# two times larger than arr3
plt.plot(arr3*2, color='blue')

# arr3 power of 2
plt.plot(arr3**2, color='green')
np.sqrt(arr3) # ruutjuur (square root)

np.sin(arr3) # sinus

# Random walk

n = 100000 # defining number of steps

x = np.zeros(n) # defining array of zeros
y = np.zeros(n) # defining array of zeros

y

import random
val = random.randint(1, 4)
val

for i in range(1, n):
    val = random.randint(1, 4)
    if val == 1:
        x[i] = x[i-1] + 1 # dot moves x coordinate +1
        y[i] = y[i-1]
    elif val == 2:
        x[i] = x[i-1] - 1 # dot moves x coordinate -1
        y[i] = y[i-1]
    elif val == 3:
        x[i] = x[i-1]
        y[i] = y[i-1] + 1 # dot moves y coordinate +1
    else:
        x[i] = x[i-1]
        y[i] = y[i-1] - 1 # dot moves y coordinate -1

import pylab as pl
pl.title(f'Random walk of n={n} steps')
pl.plot(x, y)

plt.figure(figsize=(10, 6))  # Increase figure size
plt.plot(x, y, color='skyblue', lw=2, alpha=0.7)  # Line with transparency
plt.scatter(x[0], y[0], c='green', s=100, label='Start')  # Mark start point
plt.scatter(x[-1], y[-1], c='red', s=100, label='End')  # Mark end point

plt.title('2D Random Walk', fontsize=16)
plt.xlabel('X-Coordinate')
plt.ylabel('Y-Coordinate')
plt.grid(True)
plt.legend()

plt.show()

plt.savefig('2D_rand.png')

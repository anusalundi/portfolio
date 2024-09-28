import numpy as np

coin = ["Heads", "Tails"] # 1-dimensional array = list
coin
number_of_throws = 1000
tosses = np.random.choice(coin, number_of_throws) # visked
tosses

print(f"The results of coins toss simulation for {number_of_throws} throws are: {tosses}")

number_of_heads = np.sum(tosses == "Heads")
number_of_heads
number_of_tails = np.sum(tosses == "Tails")
number_of_tails

# Probabilities
probability_of_heads = number_of_heads / number_of_throws
probability_of_heads
probability_of_tails = number_of_tails / number_of_throws
probability_of_tails
print(f'Probability of getting Heads is {probability_of_heads}')
print(f'Probability of getting Tails is {probability_of_tails}')

# Numpy
### List of numbers
my_list = [1, 2, 3] # Python list
my_list

import sys

size_of_py_list = sys.getsizeof(my_list)
print("Size of the python list is:", size_of_py_list) #bytes

my_array = np.array(my_list)
my_array

size_of_array = my_array.nbytes
print("Size of the numpy array is:", size_of_array) #bytes

test_list = [1,2,3, 'Autumn', 0.3, True]
test_list
test_list_array = np.array(test_list) # numpy arrays saab hoida ainult samu tüüpe, sp on siin kõik nüüd stringid
test_list_array

### Built-in-method in Numpy
# arrange
np.arange(10)
np.arange(5,10) # 5 algus, 10 lõpp
np.arange(10,20,2) # 10 algus, 20 lõpp, 2 aste
np.arange(10,20,3.5)

# Zeros
np.zeros(3)
np.zeros((5,5)) # 5x5 matrix

# ones
np.ones(3)
np.ones((10,7), dtype=int) # modified the format from float to int

# Numpy linspace
np.linspace(100, 200, 33) # 33 numbers between 100 and 200 with same distance

# eye
np.eye(6)
np.random.rand(2)
np.random.rand(4,3)
coordinates = np.random.randn(2)
x = coordinates[0] # first value of the array
y = coordinates[1] # second value of the array

import matplotlib.pyplot as plt

plt.scatter(x, y, s=100, color='blue')
plt.title('Random Coordinates')
plt.xlabel('X')
plt.ylabel('Y')
plt.grid(True)

# Uniform distribution
coordinates2 = np.random.rand(100000, 2)
coordinates2
x = coordinates2[:, 0] # all the rows from the first column
y = coordinates2[:, 1] # all the rows from second column
plt.scatter(x, y, s=100, color='blue', alpha=0.3)
plt.title('100000 Randomly selected Coordinates')
plt.xlabel('X')
plt.ylabel('Y')
plt.grid(True)

# Normal distribution
coordinates3 = np.random.randn(100000, 2)
coordinates3
x = coordinates3[:, 0] # all the rows from the first column
y = coordinates3[:, 1] # all the rows from second column
colors = np.arctan2(y, x)
plt.scatter(x, y, s=100, cmap='rainbow', c=colors, alpha=0.1)
plt.title('100000 Randomly selected Coordinates')
plt.xlabel('X')
plt.ylabel('Y')
plt.colorbar()
plt.grid(True)

np.random.randint(1,100) # start=1 (inclusive), end=100(exclusive)
np.random.randint(1,100,10) # start=1 (inclusive), end=100(exclusive), 10 numbers
my_values = np.random.randint(1,100,10)
my_values

# Math
my_values.min()
my_values.max()
my_values.std()

# Finding index of different locations
my_values.argmin()
my_values.argmax()

# Linear Algebra
A = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

B = np.array([
    [6, 5],
    [4, 3],
    [2, 1]
])

A.dot(B)
A @ B
B.T
A
B.T @ A

# Size of objects in Memory

# An integer in Python is > 24bytes
sys.getsizeof(1)

# Longs are even larger
sys.getsizeof(10**100)

# Numpy size is much smaller
np.dtype(int).itemsize

np.dtype(float).itemsize

# A one-element list
sys.getsizeof([1])

# An array of one element in Numpy
np.array([1]).nbytes

l = list(range(1000))

a = np.arange(1000)

%time np.sum(a ** 2)
%time sum([x ** 2 for x in l])

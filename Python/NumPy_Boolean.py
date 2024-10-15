import sys
import numpy as np

# Basic Numpy Arrays
np.array([1,2,3,4])

a = np.array([1,2,3,4])
b = np.array([0, .5, 1, 1.5, 2])

a[0], a[1]
a[0:]
a[1:3]
a[1:-1]
a[::2]
b[0], b[2], b[-1]
b[[0, 2, -1]]

# Array Types
print(a)
print(a.dtype)
print(b)
print(b.dtype)

np.array([1, 2, 3, 4], dtype=np.float64)

c = np.array(['a', 'b', 'c'])
print(c.dtype)

d = np.array([{'a': 1}, sys])
print(d.dtype)

# Dimensions and shapes
A = np.array([
    [1, 2, 3],
    [4, 5, 6]
])

print(A.shape) # two rows three numbers
print(A.ndim) # dimensions
print(A.size)

B = np.array([
    [
        [12, 11, 10],
        [9, 8, 7],
    ],
    [
        [6, 5, 4],
        [3, 2, 1]
    ]
])

print(B)
print(B.shape)
print(B.ndim)
print(B.size)

# Indexing and Slicing of Matrices
A = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]   
])

print(A[1])
print(A[1] [0])
print(A[1, 0])
print(A[0:2])
print(A[:, :2])
print(A[:2, :2])
print(A[:2, 2:])
print(A)

A[1] = np.array([10, 10, 10])

print(A)
A[2] = 99
print(A)

# Summary statistics
a = np.array([1, 2, 3, 4])

print(a.sum())
print(a.mean())
print(a.std())
print(a.var())

A = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

print(A.sum())
print(A.mean())
print(A.std())
print(A.sum(axis=0))
print(A.sum(axis=1))
print(A.mean(axis=0))
print(A.mean(axis=1))

# Broadcasting and Vectorizing operations
a = np.arange(4)

print(a)
print(a + 10)
print(a * 10)
print(a)

a += 100
print(a)

l = [0, 1, 2, 3]
print([i * 10 for i in l])

a = np.arange(4)
print(a)

b = np.array([10, 10, 10, 10])
print(a  + b)
print(a * b)

# Boolean arrays
a = np.arange(4)
a
a[[0, -1]]
a[[True, False, False, True]]
a >= 2
a[a >= 2]
a.mean()
a[a > a.mean()]
a[~(a > a.mean())]
a[(a == 0) | (a == 1)]
a[(a <= 2) & (a % 2 == 0)]

A = np.random.randint(100, size=(3, 3))
A
A[np.array([
    [True, False, True],
    [False, True, False],
    [True, False, True]
])]
A > 30

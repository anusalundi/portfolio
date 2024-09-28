# Unsupervised training example (clustering)

from sklearn.datasets import make_blobs # create synthetic dataset

X, y = make_blobs(n_samples=100000, centers=5, cluster_std=0.80)

X[:, 0] # x coordinate
X[:, 1] # y coordinate
y # cluster of the point

import matplotlib.pyplot as plt

plt.scatter(X[:, 0], X[:, 1], c='black', edgecolors='grey')
plt.show()

from sklearn.cluster import KMeans

kmeans = KMeans(n_clusters=5) # initialize the model
kmeans.fit(X) # train the model

cluster_labels = kmeans.predict(X) # predict the cluster of the points

plt.scatter(X[:, 0], X[:, 1], c=cluster_labels, edgecolors='k')
plt.show()

kmeans.cluster_centers_[:, 0] # x coordinate of the cluster center
kmeans.cluster_centers_[:, 1] # y coordinate of the cluster center

# cluster center with big red star
plt.scatter(X[:, 0], X[:, 1], c=cluster_labels, edgecolors='darkgrey')
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], s=300, marker='X', c='magenta')

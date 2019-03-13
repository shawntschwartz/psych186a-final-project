#
# By Shawn T. Schwartz, 2109
# <shawnschwartz@ucla.edu>
#

# import modules
import pandas as pd
from sklearn.decomposition import PCA

# read in image classification data for PCA
alexnet_data = pd.read_csv( "_csvs/Kmeans_coords.csv" , header = None )
alexnet_centroids = pd.read_csv ("_csvs/Kmeans_centroids.csv" , header = None )

# init PCA for 2 components
pca = PCA( n_components = 2 )

fruitPrincipalComponents = pca.fit_transform( alexnet_data )
fruitPrincipalDF = pd.DataFrame( data = fruitPrincipalComponents , columns = ['PC1' , 'PC2'] )

centroidsPCS = pca.fit_transform( alexnet_centroids )
centroidsPrincipalDF = pd.DataFrame( data = centroidsPCS , columns = ['PC1.Centroid' , 'PC2.Centroid'] )

# save first 2 principal components as dataframe to csv
fruitPrincipalDF.to_csv( '_output/alexnet_kmeans_pcs.csv' )
centroidsPrincipalDF.to_csv( '_output/alexnet_kmeans_centroids.csv' )

print( "Principal Component Analysis of Fruits Successfully Completed and Saved!" )
print( "==> PCA with row count: ", fruitPrincipalDF.shape[0] )
print( "==> Centroids with row count: ", centroidsPrincipalDF.shape[0] ) 


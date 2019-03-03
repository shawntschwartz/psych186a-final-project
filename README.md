# Psych186A Final Project

## Authors
Shawn Schwartz, Maisy Tarlow, Madi Yeomans, Richard Sherbrooke, & Suhwan Choi

University of California, Los Angeles - Department of Psychology

**UCLA - Winter Quarter - 2019**

### Project Summary
Final project comparing similarity in psychological space to CNN image classification in computational space of fruits.

### Code Structure
The code for the following experiments is organized into various directories and functions for each experiment.

```bash
.
├── AlexNet_experiment
│   ├── coreFruitNet.m
│   ├── executePlotFruits.m
│   ├── fruitAnalyses.m
│   ├── fruitClassification.m
│   ├── fruitPreprocessing.m
│   ├── plotFruits.m
│   ├── runFruitNet.m
│   └── saveFruitFeatures.m
├── README.md
├── mds_experiment
│   ├── _output
│   │   ├── fruit2_romney.mat_figure.png
│   │   ├── fruit2_romney.mat_subcategories.txt
│   │   ├── fruit_romney.mat_figure.png
│   │   ├── fruit_romney.mat_subcategories.txt
│   │   ├── fruits.mat_figure.png
│   │   └── fruits.mat_subcategories.txt
│   ├── analyzeMDS.m
│   ├── coreMDS.m
│   ├── getMDSEigenVals.m
│   ├── mds_datasets
│   │   ├── fruit2_romney.mat
│   │   ├── fruit_romney.mat
│   │   └── fruits.mat
│   └── runMDSExp.m
└── papers
    └── DeDeyne2008BRM.PDF

5 directories, 23 files
```

To run ```mds_experiment```, set your *current working directory* to the ```mds_experiment/``` directory and call ```runMDSExp``` in the MATLAB command window (console).

**REQUIREMENTS:** ```mds_experiment/mds_datasets/``` must include *at least one* ```.mat``` file as a dataset with the following variables:
 - **d** (n x n) *double* a normalized distance matrix (i.e., max distance = 1, min distance = 0)
 - **labs** (n x A) *char* as an ordered listing of strings with each label corresponding to the items in the matrices
 - **n** (1 x 1) *double* where n is the numerical value used in the above (n x ...) matrices representing the number of items
 - **s** (n x n) *double* a normalized similarity matrix (i.e., max similarity = 1, min similarity = 0)

### Background
Prior work by Shepard (1987) laid the foundation for measuring similarity and inferring structure from similarity. This prior work was essential for assessing the underlying structures that make up people’s psychological representations of similarity between various objects in space. Through the use of multidimensional scaling (MDS) as a framework, we arrive at Shepard’s “universal” law that is explained by an exponential function where similarity decreases with distance in psychological space.

**Part A.** In the current study, we seek to first examine how people’s psychological representations between various subcategories of fruit (e.g., watermelon, cantaloupe, honeydew), within the parent category melon, differ in similarity in the psychological space. By examining how people’s similarity ratings in the psychological space are clustered by subcategory of fruit, we can have a better understanding as to how people cluster various fruits in the psychological representation of fruit. 

**Part B.** Secondly, we seek to then compare people’s psychological representations of various subcategories of fruit to the image feature categorizations of these fruits through the use of a pre-trained convolutional neural network (CNN; Krizhevsky, Sutskever, & Hinton, 2012). Through these image classifications, we can then compare the Principal Component Analysis (PCA) reduced data of 1000 image categories to the psychological representations of fruits (Lee, Pincombe, & Welsh, 2005). In doing so, we shall see how various feature classifications vary across subcategory of fruit, and further extend findings in the biological sector that image features vary significantly between more highly related subclades from a parent clade, into the psychological space with the current interest centered upon fruit categorization. These comparisons will serve as the framework to the current study’s primary question.

### Question
In the current study, we seek to examine the relational differences between psychological representation of similarity amongst human subjects and image-feature categorization representation of similarity amongst the computational space. Using the framework, we ask: how does computational representation of subcategories of fruit compare to that of human psychological representation of those same fruits? If the reduced data across the human and computational space are highly similar, is this a potential explanation for human similarity space to be heavily weighted on the visual image features of these fruits, and if not, what are some potential explanations for the differences across the spaces?

### Method
In part A, we will use the MDS datasets provided by Lee, Pincombe, & Welsh (2005). We will plot these previously collected data to have a visual representation of the psychological similarity ratings between each subcategory of fruit in a two-dimensional coordinate system. Then, to prepare for part B, we will collect 20 high-quality images of each subcategory of fruit measured in the similarity ratings from part A. We will then use this curated dataset with the AlexNet CNN to return classifications for each of these images. After using PCA to orthogonally transform the 1000 image classification layers for each image into a reduced two-dimensional dataset, we will plot the AlexNet classifications and compare the relative clustering and centroids of each subcategory of fruit against the similarity plots from the psychological space to statistically compare relative differences between the distances of fruit subcategories in each cluster to their respective centroid. Then, we will perform multiple paired-samples t-tests between each subcategory of fruit to determine if there is a significant difference in relative clustering of subcategories of fruits as they are represented by humans in the psychological space compared to image-classifications in the computational space.

### References
1. Krizhevsky, A., Sutskever, I., & Hinton, G. E. (2012). Imagenet classification with deep convolutional 
neural networks. In Advances in neural information processing systems (pp. 1097-1105).
2. Lee, M.D., Pincombe, B. M., & Welsh, M. B. (2005). An empirical evaluation of models of text 
document similarity. In B.G. Bara, L.W. Barsalou & M. Bucciarelli, (Eds.),  Proceedings of the 
27th Annual Conference of the Cognitive Science Society, pp. 1254-1259. Mahwah, NJ: Erlbaum.
3. Shepard, R. N. (1987). Toward a universal law of generalization for psychological science. Science, 
237(4820), 1317-1323.

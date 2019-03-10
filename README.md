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
│   ├── _curated-fruit-images
│   │   ├── apple
│   │   │   ├── apple_01.jpg
│   │   │   ├── apple_02.jpg
│   │   │   ├── apple_03.jpg
│   │   │   ├── apple_04.jpg
│   │   │   ├── apple_05.jpg
│   │   │   ├── apple_06.jpg
│   │   │   ├── apple_07.jpg
│   │   │   ├── apple_08.jpg
│   │   │   ├── apple_09.jpg
│   │   │   └── apple_10.jpg
│   │   ├── apricot
│   │   │   ├── apricot_01.jpg
│   │   │   ├── apricot_02.jpg
│   │   │   ├── apricot_03.jpg
│   │   │   ├── apricot_04.jpg
│   │   │   ├── apricot_05.jpg
│   │   │   ├── apricot_06.jpg
│   │   │   ├── apricot_07.jpg
│   │   │   ├── apricot_08.jpg
│   │   │   ├── apricot_09.jpg
│   │   │   └── apricot_10.jpg
│   │   ├── banana
│   │   │   ├── banana_01.jpg
│   │   │   ├── banana_02.jpg
│   │   │   ├── banana_03.jpg
│   │   │   ├── banana_04.jpg
│   │   │   ├── banana_05.jpg
│   │   │   ├── banana_06.jpg
│   │   │   ├── banana_07.jpg
│   │   │   ├── banana_08.jpg
│   │   │   ├── banana_09.jpg
│   │   │   └── banana_10.jpg
│   │   ├── blueberry
│   │   │   ├── blueberries_01.jpg
│   │   │   ├── blueberries_02.jpg
│   │   │   ├── blueberries_03.jpg
│   │   │   ├── blueberries_04.jpg
│   │   │   ├── blueberries_05.jpg
│   │   │   ├── blueberries_06.jpg
│   │   │   ├── blueberries_07.jpg
│   │   │   ├── blueberries_08.jpg
│   │   │   ├── blueberries_09.jpg
│   │   │   └── blueberries_10.jpg
│   │   ├── coconut
│   │   │   ├── coconut_01.jpg
│   │   │   ├── coconut_02.jpg
│   │   │   ├── coconut_03.jpg
│   │   │   ├── coconut_04.jpg
│   │   │   ├── coconut_05.jpg
│   │   │   ├── coconut_06.jpg
│   │   │   ├── coconut_07.jpg
│   │   │   ├── coconut_08.jpg
│   │   │   ├── coconut_09.jpg
│   │   │   └── coconut_10.jpg
│   │   ├── date
│   │   │   ├── date_01.jpg
│   │   │   ├── date_02.jpg
│   │   │   ├── date_03.jpg
│   │   │   ├── date_04.jpg
│   │   │   ├── date_05.jpg
│   │   │   ├── date_06.jpg
│   │   │   ├── date_07.jpg
│   │   │   ├── date_08.jpg
│   │   │   ├── date_09.jpg
│   │   │   └── date_10.jpg
│   │   ├── grape
│   │   │   ├── grape_01.jpg
│   │   │   ├── grape_02.jpg
│   │   │   ├── grape_03.jpg
│   │   │   ├── grape_04.jpg
│   │   │   ├── grape_05.jpg
│   │   │   ├── grape_06.jpg
│   │   │   ├── grape_07.jpg
│   │   │   ├── grape_08.jpg
│   │   │   ├── grape_09.jpg
│   │   │   └── grape_10.jpg
│   │   ├── grapefruit
│   │   │   ├── grapefruit_01.jpg
│   │   │   ├── grapefruit_02.jpg
│   │   │   ├── grapefruit_03.jpg
│   │   │   ├── grapefruit_04.jpg
│   │   │   ├── grapefruit_05.jpg
│   │   │   ├── grapefruit_06.jpg
│   │   │   ├── grapefruit_07.jpg
│   │   │   ├── grapefruit_08.jpg
│   │   │   ├── grapefruit_09.jpg
│   │   │   └── grapefruit_10.jpg
│   │   ├── honeydew
│   │   │   ├── honeydew_01.jpg
│   │   │   ├── honeydew_02.jpg
│   │   │   ├── honeydew_03.jpg
│   │   │   ├── honeydew_04.jpg
│   │   │   ├── honeydew_05.jpg
│   │   │   ├── honeydew_06.jpg
│   │   │   ├── honeydew_07.jpg
│   │   │   ├── honeydew_08.jpg
│   │   │   ├── honeydew_09.jpg
│   │   │   └── honeydew_10.jpg
│   │   ├── lemon
│   │   │   ├── lemon_01.jpg
│   │   │   ├── lemon_02.jpg
│   │   │   ├── lemon_03.jpg
│   │   │   ├── lemon_04.jpg
│   │   │   ├── lemon_05.jpg
│   │   │   ├── lemon_06.jpg
│   │   │   ├── lemon_07.jpg
│   │   │   ├── lemon_08.jpg
│   │   │   ├── lemon_09.jpg
│   │   │   └── lemon_10.jpg
│   │   ├── olive
│   │   │   ├── olive_01.jpg
│   │   │   ├── olive_02.jpg
│   │   │   ├── olive_03.jpg
│   │   │   ├── olive_04.jpg
│   │   │   ├── olive_05.jpg
│   │   │   ├── olive_06.jpg
│   │   │   ├── olive_07.jpg
│   │   │   ├── olive_08.jpg
│   │   │   ├── olive_09.jpg
│   │   │   └── olive_10.jpg
│   │   ├── orange
│   │   │   ├── orange_01.jpg
│   │   │   ├── orange_02.jpg
│   │   │   ├── orange_03.jpg
│   │   │   ├── orange_04.jpg
│   │   │   ├── orange_05.jpg
│   │   │   ├── orange_06.jpg
│   │   │   ├── orange_07.jpg
│   │   │   ├── orange_08.jpg
│   │   │   ├── orange_09.jpg
│   │   │   └── orange_10.jpg
│   │   ├── peach
│   │   │   ├── peach_01.jpg
│   │   │   ├── peach_02.jpg
│   │   │   ├── peach_03.jpg
│   │   │   ├── peach_04.jpg
│   │   │   ├── peach_05.jpg
│   │   │   ├── peach_06.jpg
│   │   │   ├── peach_07.jpg
│   │   │   ├── peach_08.jpg
│   │   │   ├── peach_09.jpg
│   │   │   └── peach_10.jpg
│   │   ├── pear
│   │   │   ├── pear_01.jpg
│   │   │   ├── pear_02.jpg
│   │   │   ├── pear_03.jpg
│   │   │   ├── pear_04.jpg
│   │   │   ├── pear_05.jpg
│   │   │   ├── pear_06.jpg
│   │   │   ├── pear_07.jpg
│   │   │   ├── pear_08.jpg
│   │   │   ├── pear_09.jpg
│   │   │   └── pear_10.jpg
│   │   ├── pineapple
│   │   │   ├── pineapple_01.jpg
│   │   │   ├── pineapple_02.jpg
│   │   │   ├── pineapple_03.jpg
│   │   │   ├── pineapple_04.jpg
│   │   │   ├── pineapple_05.jpg
│   │   │   ├── pineapple_06.jpg
│   │   │   ├── pineapple_07.jpg
│   │   │   ├── pineapple_08.jpg
│   │   │   ├── pineapple_09.jpg
│   │   │   └── pineapple_10.jpg
│   │   ├── plum
│   │   │   ├── plum_01.jpg
│   │   │   ├── plum_02.jpg
│   │   │   ├── plum_03.jpg
│   │   │   ├── plum_04.jpg
│   │   │   ├── plum_05.jpg
│   │   │   ├── plum_06.jpg
│   │   │   ├── plum_07.jpg
│   │   │   ├── plum_08.jpg
│   │   │   ├── plum_09.jpg
│   │   │   └── plum_10.jpg
│   │   ├── pomegranate
│   │   │   ├── pomegranate_01.jpg
│   │   │   ├── pomegranate_02.jpg
│   │   │   ├── pomegranate_03.jpg
│   │   │   ├── pomegranate_04.jpg
│   │   │   ├── pomegranate_05.jpg
│   │   │   ├── pomegranate_06.jpg
│   │   │   ├── pomegranate_07.jpg
│   │   │   ├── pomegranate_08.jpg
│   │   │   ├── pomegranate_09.jpg
│   │   │   └── pomegranate_10.jpg
│   │   ├── strawberry
│   │   │   ├── strawberries_01.jpg
│   │   │   ├── strawberries_02.jpg
│   │   │   ├── strawberries_03.jpg
│   │   │   ├── strawberries_04.jpg
│   │   │   ├── strawberries_05.jpg
│   │   │   ├── strawberries_06.jpg
│   │   │   ├── strawberries_07.jpg
│   │   │   ├── strawberries_08.jpg
│   │   │   ├── strawberries_09.jpg
│   │   │   └── strawberries_10.jpg
│   │   ├── tangerine
│   │   │   ├── tangerine_01.jpg
│   │   │   ├── tangerine_02.jpg
│   │   │   ├── tangerine_03.jpg
│   │   │   ├── tangerine_04.jpg
│   │   │   ├── tangerine_05.jpg
│   │   │   ├── tangerine_06.jpg
│   │   │   ├── tangerine_07.jpg
│   │   │   ├── tangerine_08.jpg
│   │   │   ├── tangerine_09.jpg
│   │   │   └── tangerine_10.jpg
│   │   ├── tomato
│   │   │   ├── tomato_01.jpg
│   │   │   ├── tomato_02.jpg
│   │   │   ├── tomato_03.jpg
│   │   │   ├── tomato_04.jpg
│   │   │   ├── tomato_05.jpg
│   │   │   ├── tomato_06.jpg
│   │   │   ├── tomato_07.jpg
│   │   │   ├── tomato_08.jpg
│   │   │   ├── tomato_09.jpg
│   │   │   └── tomato_10.jpg
│   │   └── watermelon
│   │       ├── watermelon_01.jpg
│   │       ├── watermelon_02.jpg
│   │       ├── watermelon_03.jpg
│   │       ├── watermelon_04.jpg
│   │       ├── watermelon_05.jpg
│   │       ├── watermelon_06.jpg
│   │       ├── watermelon_07.jpg
│   │       ├── watermelon_08.jpg
│   │       ├── watermelon_09.jpg
│   │       └── watermelon_10.jpg
│   ├── _output
│   │   ├── classified_fruit_data.mat
│   │   ├── classified_fruit_data.mat_figure.png
│   │   └── classified_fruit_data.mat_subcategories.txt
│   ├── _size-regressions
│   │   ├── _csvs
│   │   │   ├── fruit-img-dims.csv
│   │   │   ├── fruits.avgsizes.csv
│   │   │   └── y_test_coords.csv
│   │   ├── _plots
│   │   │   ├── alexnetX-vs-img-height.png
│   │   │   ├── alexnetX-vs-img-width.png
│   │   │   ├── alexnetX-vs-size-cm.png
│   │   │   ├── alexnetY-vs-img-height.png
│   │   │   ├── alexnetY-vs-img-width.png
│   │   │   └── alexnetY-vs-size-cm.png
│   │   ├── _stats
│   │   │   ├── alexnetX-vs-img-height-stats.txt
│   │   │   ├── alexnetX-vs-img-width-stats.txt
│   │   │   ├── alexnetX-vs-size-cm-stats.txt
│   │   │   ├── alexnetY-vs-img-height-stats.txt
│   │   │   ├── alexnetY-vs-img-width-stats.txt
│   │   │   ├── alexnetY-vs-size-cm-stats.txt
│   │   │   ├── fruit_img_dims-lm-stats.txt
│   │   │   └── fruit_sizes-lm-stats.txt
│   │   └── alexnet-regression.R
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

32 directories, 254 files
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

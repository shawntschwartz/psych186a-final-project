function [Y, eigvals] = getMDSEigenVals(input_dataset)
%This function gets the mdscale for a given dataset
% and returns the Y (euclidean distances) and eigenvalues (stress) of the 
% nonclassical (nonmetric) multidimensional scaling.

load(input_dataset);

% s is a variable expected from the input_dataset (and is assumed to exist)
[Y, eigvals] = mdscale(s,__); % @Maisy fill in the dimension required for this matrix
end
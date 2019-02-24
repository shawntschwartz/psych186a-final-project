%% Get All Dataset Files from mds_datasets directory
all_datasets = dir(mds_datasets);
num_datasets = length(________);

%% Create data structures to hold values from getMDSEigenVals
Y_vals = {};
eig_vals = {};

%% Run getMDSEigenVals for each dataset from dir
for i = 1:____
    current_file = [all_datasets(__)._____() '/' all_datasets(__)._____()];
    [___{_}, ___{_}] = getMDSEigenVals(__________);
    
    % Run analyzeMDS script
    analyzeMDS(__________, ___);
end
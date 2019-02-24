function analyzeMDS(current_dataset)
%This function creates a plot of the MDS data for the current dataset.

figure('name', current_dataset);
plot(Y(:,1), Y(:,2), '.');
text(Y(:,1)+0.01, Y(:,2), labs) % labels (labs) is assumed to be a part of the current dataset)
axis auto square;

end
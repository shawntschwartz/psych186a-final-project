function analyzeMDS(current_dataset, iterator)
%This function creates a plot of the MDS data for the current dataset.

figure('name', current_dataset);
plot(Y_vals{____}(:,1), Y_vals{____}(:,2), '.');
text(Y_vals{____}(:,1)+0.01, Y_vals{____}(:,2), labs) % labels (labs) is assumed to be a part of the current dataset)
axis auto square;
end
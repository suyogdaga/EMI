eva = evalclusters(data,'kmeans','DaviesBouldin','klist',2:10);
k = eva.CriterionValues;
[z,i] = min(k);

ind = eva.InspectedK;
ind = [ind;a(:)';k(:)';];

 tree=(linkage(meas,'average')); 
 [~,T] = dendrogram(tree,30);
 xlabel('Nodes');
 ylabel('Height is Average of unweighted Eucledian distance');
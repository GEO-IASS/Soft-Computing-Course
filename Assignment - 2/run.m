%                   Assignment - 2
%                  SOFT COMPUTING 
%
%
%
%
extensions = {'centerlight', 'glasses', 'happy', 'leftlight', 'noglasses', 'normal', 'rightlight', 'sad', 'sleepy', 'surprised', 'wink' };
clc;
clear;
clear train;
clear test;

%----------------------------PART - 1 --------------------------------------
%Loading Datasets
%First, extract the faces into training and test faces
fprintf('\n\n-----------------Loading Dataset--------------\n');
fprintf('-----------And randomly diving dataset into training set and test set-------------\n');
trainidx = 1;
testidx = 1;

[Faces Truth] = readfaces();
train = [];
test = [];
test_truth = [];
train_truth = [];
for i = 1:size(Faces,2)
    
        if( rand > 0.3 )
            train = [train Faces(:,i)];
            trainidx = trainidx + 1;
            train_truth = [train_truth Truth(:,i)];
        else
            test = [test Faces(:,i)];
            testidx = testidx + 1;
            test_truth = [test_truth Truth(:,i)];
        end;
        
    
end;


fprintf('Total size of Dataset : %f\nTotal size of Traing set : %f\nTotal size of Test set : %f\n',size(Faces,2),size(train,2),size(test,2));
clear Faces;




%Normalize features of train dataset
fprintf('\n\n\n------Normalising features -----------\n');
[train_norm avg]= normalizeFeatures(train);

%Put all of the training faces into one big matrix and do svd

[U, W, V] = svd(train_norm,0);

Result = U * W * V';


%Show the variance produced by the top eigenvectors
fprintf('\n\n\nShow the variance produced by the top eigenvectors\n');
cvalues = zeros(1,size(W,1));
cvalues(1) = W(1,1);
valsum = W(1,1);
for i = 2:size(cvalues,2);
    cvalues(i) = cvalues(i-1) + W(i,i);
    valsum = valsum + W(i,i);
end;
cvalues = cvalues / valsum;
figure(1);
plot(1:size(W,1),cvalues);
title('Variance produced by eigenvectors ');
fprintf('Top 25 principle components, Variance: %f\nTop 50 principle components, Variance %f\n', cvalues(25), cvalues(50));
    
    
    
% Choosing the correct value of K for slecting principle components
%Show the top k eigenfaces
%{fprintf('\n\n\nSelecting no. of reduced dimensions  with variance regained = 85\n');
variance_regained = 85;
k = 0;
for i = 1:size(W,1)
    k = k+1;
    if cvalues(i) >= variance_regained
        break;
    end   
end
fprintf('K = %f\n',k);
%}
k = 25

%Put all of the training faces into one big matrix and project
idx = 1;
train_project = projectData(U,train_norm,k);


% Calculate normalized Features for test faces 
test_norm = normalizeFeatures(test);

%Project all test faces into eigen space
test_project = projectData(U,test_norm,k);

distances = zeros(size(train,2), 1);
recognition = zeros(size(test,2), 2);
accuracy = zeros(size(test,2), 1);
for i = 1:size(test,2)
    for j = 1:size(train,2)
        distances(j,1) = sum((train_project(:,j) - test_project(:,i)).^2);
    end
        
    [score, best] = min(distances);
    recognition(i,:) = [best,score]; 
    if test_truth(:,i) == train_truth(:,best)
        accuracy(i,1) = 1;
    end 
end

fprintf('Sample 3 test image along with recognised image : ');
figure(2);
temp = uint8(rand * size(test,2));
subplot(3,2,1),imshow(uint8(reshape(test(:,temp),[243 320]))),title(' test image');
subplot(3,2,2),imshow(uint8(reshape(train(:,recognition(temp,1)),[243 320]))),title('Recognised image');
temp = uint8(rand * size(test,2));
subplot(3,2,3),imshow(uint8(reshape(test(:,temp),[243 320]))),title(' test image');
subplot(3,2,4),imshow(uint8(reshape(train(:,recognition(temp,1)),[243 320]))),title('Recognised image');
temp = uint8(rand * size(test,2));
subplot(3,2,5),imshow(uint8(reshape(test(:,temp),[243 320]))),title(' test image');
subplot(3,2,6),imshow(uint8(reshape(train(:,recognition(temp,1)),[243 320]))),title('Recognised image');

fprintf('\n\n\nAccuracy for test cases : %f\n\n',sum(accuracy)/size(accuracy,1));

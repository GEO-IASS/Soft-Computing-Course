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
            if flag == 0
                  train_truth = Truth(:,i);
            else
                train_truth = [train_truth Truth(:,i)];
            end
        else
            test = [test Faces(:,i)];
            testidx = testidx + 1;
            if flag == 0
                  test_truth = Truth(:,i);
            else
                test_truth = [test_truth Truth(:,i)];
            end
            
        end;
        
    
end;


fprintf('Total size of Dataset : %f\nTotal size of Traing set : %f\nTotal size of Test set : %f\n',size(Faces,2),size(train,2),size(test,2));
clear Faces;




%Normalize features of train dataset
fprintf('\n\n\n------Normalising features -----------\n');
[train_norm avg]= normalizeFeatures(train);

%Put all of the training faces into one big matrix and do svd

[U, W, V] = svd(train_norm,0);
k = 40;

%Put all of the training faces into one big matrix and project
idx = 1;
train_project = projectData(U,train_norm,k);


% Calculate normalized Features for test faces 
test_norm = normalizeFeatures(test);

%Project all test faces into eigen space
test_project = projectData(U,test_norm,k);

% Calculating SW and SB 
meanClass = zeros(size(train_project,1),15);
SW = zeros(k,k);
avg = zeros(size(train_project,1),1);
lastClass = 1;
last = 1;
c = 1;
for i = 1:size(train,2)
        if lastClass == train_truth(1,i) 
              avg = avg + train_project(:,i);
        else 
              meanClass(:,c) = avg;
              SW = SW + cov(train_project(:,last:i)');
              avg = train_project(:,i);
              lastClass = lastClass + 11;
              c = c+1;
              last = i;
        end
end
meanClass(:,c) = avg;
SW = SW + cov(train_project(:,last:i)');
%size(SW)
M = sum(meanClass,2);
%size(M)
SB = cov(meanClass');
%size(SB)

[U2, S2, W2] = svd(pinv(SW)*SB);
train_fisher_project = U2(:,1:25)' * train_project;
test_fisher_project = U2(:,1:25)' * test_project;




fprintf('\n\n-----------------------PCA recognition(40 most components)-----------------------------\n\n');



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

fprintf('Sample 3 test image along with recognised image : (see figure(1))');
figure(1);
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







fprintf('\n\n-----------------------LDA recognition(25 most components)-----------------------------\n\n');


distances = zeros(size(train,2), 1);
recognition = zeros(size(test,2), 2);
accuracy = zeros(size(test,2), 1);
for i = 1:size(test,2)
    for j = 1:size(train,2)
        distances(j,1) = sum((train_fisher_project(:,j) - test_fisher_project(:,i)).^2);
    end
        
    [score, best] = min(distances);
    recognition(i,:) = [best,score]; 
    if test_truth(:,i) == train_truth(:,best)
        accuracy(i,1) = 1;
    end 
end
fprintf('Sample 3 test image along with recognised image :  (see figure(2))');
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


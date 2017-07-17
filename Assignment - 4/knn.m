

clear;
clc;
close all;

train_images = loadMNISTImages('train-images.idx3-ubyte');
train_labels = loadMNISTLabels('train-labels.idx1-ubyte');

test_images = loadMNISTImages('test-images.idx3-ubyte');
test_labels = loadMNISTLabels('test-labels.idx1-ubyte');

accuracy = zeros(size(test_labels));
c = 1;
for i = 1:100
      
      eudist = sum((train_images - test_images(i,:)).^2 , 2);
      [q qi] = min(eudist);
      if train_labels(qi,1) == test_labels(i,1)
      
            accuracy(i,1) = 1;      
      end
      
end
%size(test_labels,1))
fprintf('Accuracy : ');
a = (sum(accuracy)/double(100)) * 100;

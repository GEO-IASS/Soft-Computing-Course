files = dir('/home/nani/Pictures/Webcam/*.jpg');
for i = 1:length(files)
filename = strcat('/home/nani/Pictures/Webcam/',files(i).name);
filename
A = imread(filename);
A = imresize(A,[243 320]);
A = rgb2gray(A);
imwrite(A,filename);
end
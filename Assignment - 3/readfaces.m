function [F Truth] = readfaces()

extensions = {'centerlight', 'glasses', 'happy', 'leftlight', 'noglasses', 'normal', 'rightlight', 'sad', 'sleepy', 'surprised', 'wink' };
F = zeros(243*320, 15 * length(extensions));
Truth = zeros(11,15 * length(extensions));
idx = 1;
c = 1;
for i = 1 : 15,
    basename = 'yalefaces/subject';
    if( i < 10 )
        basename = [basename, '0', num2str(i)];
    else
        basename = [basename, num2str(i)];
    end;

    for j = 1:length(extensions),
        fullname = [basename, '.', extensions{j}];
        X = imread(fullname);
        %X = rgb2gray(X);
        F(:,idx) = X(:);
        idx = idx+1;
        Truth(:,idx) = c : c+10;
    end;
    c = c+11;
end;
Truth(:,1) = Truth(:,2);
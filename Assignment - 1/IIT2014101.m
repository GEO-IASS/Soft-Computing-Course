R = imread('1.gif');
G = imread('2.gif');
B = imread('3.gif');
I = imread('4.gif');
figure(1),imshow('1.gif');
[x,y] = ginput(50);
x,y
%{x = [
  146.0000
  145.0000
  154.0000
  152.0000
  160.0000
  165.0000
  165.0000
  174.0000
  180.0000
  182.0000
  180.0000
  183.0000
  185.0000
  186.0000
  186.0000
  189.0000
  199.0000
  207.0000
  218.0000
  220.0000
  219.0000
  216.0000
  213.0000
  211.0000
  203.0000
  197.0000
  192.0000
  191.0000
  186.0000
  193.0000
  189.0000
  186.0000
  182.0000
  176.0000
  173.0000
  171.0000
  166.0000
  170.0000
  174.0000
  179.0000
  181.0000
  178.0000
  167.0000
  166.0000
  164.0000
  166.0000
  162.0000
  164.0000
  164.0000
  164.0000

y = [
  511.0000
  499.0000
  486.0000
  493.0000
  470.0000
  465.0000
  456.0000
  454.0000
  443.0000
  433.0000
  424.0000
  413.0000
  400.0000
  393.0000
  379.0000
  368.0000
  363.0000
  338.0000
  335.0000
  325.0000
  310.0000
  297.0000
  289.0000
  280.0000
  273.0000
  255.0000
  253.0000
  257.0000
  244.0000
  244.0000
  244.0000
  235.0000
  229.0000
  221.0000
  212.0000
  206.0000
  205.0000
  215.0000
  201.0000
  210.0000
  227.0000
  216.0000
  225.0000
  191.0000
  176.0000
  186.0000
  179.0000
  188.0000
  164.0000
  151.0000
];
%}
sample_Riv_R = x;
sample_Riv_G = x;
sample_Riv_B = x;
sample_Riv_I = x;
for i = 1:50
    sample_Riv_R(i) = R( uint8(x(i)) , uint8(y(i)) );
    sample_Riv_G(i) = G( uint8(x(i)) , uint8(y(i)) );
    sample_Riv_B(i) = B( uint8(x(i)) , uint8(y(i)) );
    sample_Riv_I(i) = I( uint8(x(i)) , uint8(y(i)) );
end

T1 = [mean(sample_Riv_R), mean(sample_Riv_G), mean(sample_Riv_B), mean(sample_Riv_I)];
% Printing sample points for offline use 
%x,y


figure(2),imshow('1.gif');
[x,y] = ginput(100);
x,y
%{
x = [
   60.0000
   69.0000
   78.0000
   91.0000
   79.0000
  106.0000
   92.0000
  109.0000
   79.0000
  112.0000
  374.0000
  403.0000
  421.0000
  423.0000
  410.0000
  390.0000
  335.0000
  329.0000
  334.0000
  334.0000
  334.0000
  339.0000
  354.0000
  356.0000
  355.0000
  342.0000
  341.0000
  343.0000
  359.0000
  369.0000
  392.0000
  401.0000
  426.0000
  419.0000
  417.0000
  391.0000
  385.0000
  320.0000
  281.0000
  267.0000
  269.0000
  276.0000
  307.0000
  371.0000
  382.0000
  401.0000
  470.0000
  502.0000
  480.0000
  446.0000
  431.0000
  425.0000
  417.0000
  397.0000
  374.0000
  367.0000
  371.0000
  373.0000
  373.0000
  373.0000
  367.0000
  353.0000
  363.0000
  377.0000
  385.0000
  407.0000
  409.0000
  410.0000
  413.0000
  387.0000
  387.0000
  369.0000
  368.0000
  343.0000
  377.0000
  342.0000
  293.0000
  273.0000
  275.0000
  212.0000
  199.0000
  202.0000
  207.0000
  229.0000
  212.0000
  213.0000
  225.0000
  245.0000
  248.0000
  260.0000
  246.0000
  272.0000
  289.0000
  269.0000
  282.0000
   97.0000
   76.0000
   52.0000
   14.0000
   23.0000

y = [
  126.0000
  151.0000
  194.0000
  236.0000
  262.0000
  277.0000
  289.0000
  297.0000
  318.0000
  320.0000
  362.0000
  388.0000
  411.0000
  430.0000
  449.0000
  449.0000
  450.0000
  406.0000
  327.0000
  304.0000
  240.0000
  214.0000
  181.0000
  168.0000
  153.0000
  130.0000
  122.0000
  115.0000
   98.0000
   91.0000
   96.0000
  118.0000
  159.0000
  173.0000
  251.0000
  257.0000
  226.0000
   93.0000
   70.0000
   54.0000
   35.0000
   43.0000
   70.0000
  150.0000
  192.0000
  239.0000
  461.0000
  427.0000
  496.0000
  494.0000
  476.0000
  452.0000
  427.0000
  431.0000
  490.0000
  473.0000
  455.0000
  434.0000
  409.0000
  396.0000
  375.0000
  346.0000
  341.0000
  349.0000
  349.0000
  353.0000
  358.0000
  360.0000
  382.0000
  355.0000
  328.0000
  406.0000
  386.0000
  368.0000
  354.0000
  260.0000
  203.0000
  167.0000
   79.0000
   77.0000
  134.0000
  183.0000
  202.0000
  249.0000
  227.0000
  236.0000
  261.0000
  278.0000
  303.0000
  325.0000
  347.0000
  342.0000
  300.0000
  242.0000
  169.0000
   99.0000
   64.0000
   46.0000
   10.0000
   24.0000
];
%}
sample_NonRiv_R = x;
sample_NonRiv_G = x;
sample_NonRiv_B = x;
sample_NonRiv_I = x;
for i = 1:100
    sample_NonRiv_R(i) = R( uint8(x(i)) , uint8(y(i)) );
    sample_NonRiv_G(i) = G( uint8(x(i)) , uint8(y(i)) );
    sample_NonRiv_B(i) = B( uint8(x(i)) , uint8(y(i)) );
    sample_NonRiv_I(i) = I( uint8(x(i)) , uint8(y(i)) );
end

T2 = [mean(sample_NonRiv_R), mean(sample_NonRiv_G), mean(sample_NonRiv_B), mean(sample_NonRiv_I)];
% Printing sample points for offline use 
%x,y
temp = zeros(50,4);
temp( : ,1) = sample_Riv_R;
temp( : ,2) = sample_Riv_G;
temp( : ,3) = sample_Riv_B;
temp( : ,4) = sample_Riv_I;
cov_Riv = cov(temp);
temp = zeros(100,4);
temp( : ,1) = sample_NonRiv_R;
temp( : ,2) = sample_NonRiv_G;
temp( : ,3) = sample_NonRiv_B;
temp( : ,4) = sample_NonRiv_I;
cov_NonRiv = cov(temp);

test = zeros(4,size(R,1),size(R,2));
test(1, : , : ) = R;
test(2, : , : ) = G;
test(3, : , : ) = B;
test(4, : , : ) = I;
out_image = R;


P1 = 0.3;
P2 = 0.7;
size(cov_Riv);
size(T1);
size(test);
size(cov_NonRiv);
size(T2);
for i = 1:size(R,1)
    for j = 1:size(R,2)
        river_class = ( double(test( : ,i,j)).' - T1 ) * inv(cov_Riv)  * ( double(test( : ,i,j)).' - T1 ).';
        non_river_class = ( double(test( : ,i,j)).' - T2 ) * inv(cov_NonRiv)  * ( double(test( : ,i,j)).' - T2 ).';
        p1 = (-0.5)*(1/sqrt(det(cov_Riv)))*exp(river_class);
        p2 = (-0.5)*(1/sqrt(det(cov_NonRiv)))*exp(non_river_class);
        
        if (P1 * p1) >= (P2 * p2)
            out_image(i,j) = 255;
        else 
            out_image(i,j) = 0;
            
        end
    end
end

imwrite(out_image,'output1.gif');
figure(1),imshow(out_image);



P1 = 0.7;
P2 = 0.3;
for i = 1:size(R,1)
    for j = 1:size(R,2)
        river_class = ( double(test( : ,i,j)).' - T1 ) * inv(cov_Riv)  * ( double(test( : ,i,j)).' - T1 ).';
        non_river_class = ( double(test( : ,i,j)).' - T2 ) * inv(cov_NonRiv)  * ( double(test( : ,i,j)).' - T2 ).';
        p1 = (-0.5)*(1/sqrt(det(cov_Riv)))*exp(river_class);
        p2 = (-0.5)*(1/sqrt(det(cov_NonRiv)))*exp(non_river_class);
        
        if (P1 * p1) >= (P2 * p2)
            out_image(i,j) = 255;
        else 
            out_image(i,j) = 0;
            
        end
    end
end

imwrite(out_image,'output2.gif');
figure(2),imshow(out_image);



P1 = 0.5;
P2 = 0.5;
for i = 1:size(R,1)
    for j = 1:size(R,2)
        river_class = ( double(test( : ,i,j)).' - T1 ) * inv(cov_Riv)  * ( double(test( : ,i,j)).' - T1 ).';
        non_river_class = ( double(test( : ,i,j)).' - T2 ) * inv(cov_NonRiv)  * ( double(test( : ,i,j)).' - T2 ).';
        p1 = (-0.5)*(1/sqrt(det(cov_Riv)))*exp(river_class);
        p2 = (-0.5)*(1/sqrt(det(cov_NonRiv)))*exp(non_river_class);
        
        if (P1 * p1) >= (P2 * p2)
            out_image(i,j) = 255;
        else 
            out_image(i,j) = 0;
            
        end
    end
end

imwrite(out_image,'output3.gif');
figure(3),imshow(out_image);

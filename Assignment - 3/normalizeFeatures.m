function [featureNorm,avg] = normalizeFeatures(F)
    
    avg = mean(F,2);
    featureNorm = F - avg;
    fprintf('\n\nFeatures are Normalized\n\n');
    
end
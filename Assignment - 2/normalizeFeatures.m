function [featureNorm,avg] = normalizeFeatures(F)
    
    avg = mean(F,2);
    featureNorm = F - avg;
    
end
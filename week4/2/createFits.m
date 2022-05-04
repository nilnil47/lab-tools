mkdir fig
mkdir png
fitsIn = struct();
fitsOut = struct();
keys = fieldnames(data);
for i = 1:length(keys)

    key = keys{i};
    val = data.(key);
    [fitIn, fitOut, gofIn, gofOut] = createFit(val, key);
    if (gofOut.rsquare > 0.9)
        fitsIn.(key) = fitIn;
        fitsOut.(key) = fitOut; 
    else
        disp(sprintf('igorring fit: %s', key));
    end
    
    
end

clear i key table_ val

mkdir fig
mkdir png
mkdir badFits
fitsIn = struct();
fitsOut = struct();
keys = fieldnames(data);
for i = 1:length(keys)

    key = keys{i};
    val = data.(key);
    createFit(val, key);
    % [fitIn, fitOut, gofIn, gofOut] = createFit(val, key);
    % if (gofOut.rsquare > 0.9)
    %     fitsIn.(key) = fitIn;
    %     fitsOut.(key) = fitOut; 
    % else
    %     disp(sprintf('igorring fit: %s', key));
    %     movefile(sprintf("fig/%s.fig", key), "badFits");
    % end
    
    
end

clear i key table_ val

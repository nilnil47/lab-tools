mkdir fig
mkdir png
mkdir badFits
fits = struct();
fitsOut = struct();

data_ = underFitData;
keys = fieldnames(data_);
for i = 1:length(keys)

    key = keys{i};
    val = data_.(key);
    fits_ = createFit(val, key);
    fits.(key) = fits_;
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

keys = fields(data);
avgStruct = struct();
std_ = struct();
avgV = [];
avgH = [];
d = [];

for i = 1:length(keys)
    key = keys{i};
    m = mean(data.(key), 'omitnan');
    avgStruct.(key) = m;
    if startsWith(key, "V")
        avgV = [avgV, m];
    elseif startsWith(key, "H")
        avgH = [avgH, m];
    end

    d = [d, str2double(key(2:end))];
    % std.(key) = std(data.(key), 'omitnan')
end

d = unique(d)

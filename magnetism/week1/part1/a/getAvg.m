keys = fields(data);
avgStruct = struct();
std_ = struct();
avg = [];
d = [];

for i = 1:length(keys)
    key = keys{i};
    m = mean(data.(key), 'omitnan');
    avgStruct.(key) = m;
    avg = [avg, m];
    d = [d, key(2:end)];
    % std.(key) = std(data.(key), 'omitnan')
end
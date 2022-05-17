data_ = data;
keys = fields(data);
avgStruct = struct();
std_ = struct();
avgV = [];
avgH = [];
d = [];

types = fieldnames(data);
for typeIndex = 1:length(types)
    currentData = data_.(types{typeIndex});
    keys = fieldnames(currentData);
    for i = 1:length(keys)
        key = keys{i};
        m = mean(currentData.(key), 'omitnan');
        avgStruct.(key) = m;
        if startsWith(key, "V")
            avgV = [avgV, m];
        elseif startsWith(key, "H")
            avgH = [avgH, m];
        d = [d, str2double(key(2:end))];
        end 

    end
    % std.(key) = std(data.(key), 'omitnan')
%     % end
end

% d = unique(d)
clear types typeIndex i key keys m files data_ 
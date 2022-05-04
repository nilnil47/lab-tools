fits = struct();
keys = fieldnames(data);
for i = 1:length(keys)

    key = keys{i};
    val = data.(key);
    fits.(key) = createFit(val.t, val.v, key);
end

clear i key table_ val

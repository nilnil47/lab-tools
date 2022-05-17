files = dir('csv/*.csv')
data = struct();

for i = 1:length(files)
    f = files(i);
    path = sprintf("csv/%s", f.name)
    currentData = importfile(path);
    data = nest_struct_merge(data, currentData);
end

clear f f_ currentData i path
files = dir('csv/*.csv')


for i = 1:length(files)
    f = files(i);
    f_ = sprintf("R%s", extractBefore(f.name,'.'))
    path = sprintf("csv/%s", f.name)
    currentData = importfile(path);
    data.(f_) = currentData;

end

clear f f_ currentData i
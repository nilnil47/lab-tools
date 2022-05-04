T = [];
R = [];
Terror = [];

keys = fieldnames(fits);
for i = 1:length(keys)
    key = keys{i};
    fit = fits.(key);
    Terror = [Terror, getErrorsFromFit(fit)];
    T = [T, fit.b];
    R = [R ,str2num(key(2:end))];
end

Rerror = 0.006 * R;
T = 1 ./ T;

clear keys i key fit
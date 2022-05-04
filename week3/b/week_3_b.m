files = dir('*.csv');
% data = {}
% data = struct()
% fits = struct();

for i = 1:length(files)
    f = files(i);
    % sprintf("R%s = importFile('%s')", extractBefore(f.name,'.'), f.name)
    % eval(sprintf("R%s = importfile('%s')", extractBefore(f.name,'.'), f.name))
    % eval(sprintf("R%s_t =R%s.t", extractBefore(f.name,'.'), extractBefore(f.name,'.')))
    % eval(sprintf("R%s_v =R%s.v", extractBefore(f.name,'.'), extractBefore(f.name,'.')))
    
end

% keys = fieldnames(data)
% for i = 1:length(keys)
%     a = keys{i}
%     table_ = data.(a)
%     fits.(a) = createFit(table_.t, table_.v)
% end



% for i = 1:length(files)
%     f = files(i);
%     f_ = sprintf("R%s", extractBefore(f.name,'.'))
%     currentData = importfile(extractBefore(f.name,'.'));
%     data.(f_) = currentData;
% end

T = [];
Terror = [];

keys = fieldnames(fits)
for i = 1:length(keys)
    a = keys{i}
    fit = fits.(a)
    Terror = [Terror, getErrorsFromFit(fit)]
    T = [T, fit.b]
end
% this is a script and not a function 
% because in this way we do not need to expose
% the variables to be global variables

keys = fieldnames(data)
for i = 1:length(keys)

    key = keys{i};
    val = data.(key);

    % expose with this method the variables to the worksapce
    eval(sprintf("%s_t =val.t;", key));
    eval(sprintf("%s_v =val.v;", key));

end

clear val keys key i
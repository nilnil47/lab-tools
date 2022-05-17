function ret = mergeStructs(s1,s2)
ret = struct()
f = fieldnames(s1);
for i = 1:length(f)
    ret.(f{i}) = s1.(f{i})
end

f = fieldnames(s2);
for i = 1:length(f)
    ret.(f{i}) = s2.(f{i})
end
end


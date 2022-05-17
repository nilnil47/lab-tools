function ret = saveGraph(name)
%saveGraph - Description
%
% Syntax: ret = saveGraph(name)
%
% Long description

saveas(gca, sprintf("%s/%s.png", name, name), "png");
saveas(gca, sprintf("%s/%s.fig", name, name), "fig");
saveas(gca, sprintf("%s/%s.svg", name, name), "svg");

    
end
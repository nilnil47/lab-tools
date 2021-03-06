function data = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  PART1A1 = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  PART1A1 = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  part1a1 = importfile("/Users/user/Documents/semester_b/lab/מגנטיות/week1/part1/a/part1_a_20_300.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-May-2022 17:06:47

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 87);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
% opts.VariableNames = ["Times22", "MagneticFieldStrengthAxialG22", "MagneticFieldStrengthPerpendicularT22", "Times32", "MagneticFieldStrengthAxialG32", "MagneticFieldStrengthPerpendicularT32", "Times42", "MagneticFieldStrengthAxialG42", "MagneticFieldStrengthPerpendicularT42", "Times52", "MagneticFieldStrengthAxialG52", "MagneticFieldStrengthPerpendicularT52", "Times62", "MagneticFieldStrengthAxialG62", "MagneticFieldStrengthPerpendicularT62", "Times72", "MagneticFieldStrengthAxialG72", "MagneticFieldStrengthPerpendicularT72", "Times82", "MagneticFieldStrengthAxialG82", "MagneticFieldStrengthPerpendicularT82", "Times90", "MagneticFieldStrengthAxialG90", "MagneticFieldStrengthPerpendicularT90", "Times100", "MagneticFieldStrengthAxialG100", "MagneticFieldStrengthPerpendicularT100", "Times110", "MagneticFieldStrengthAxialG110", "MagneticFieldStrengthPerpendicularT110", "Times120", "MagneticFieldStrengthAxialG120", "MagneticFieldStrengthPerpendicularT120", "Times130", "MagneticFieldStrengthAxialG130", "MagneticFieldStrengthPerpendicularT130", "Times140", "MagneticFieldStrengthAxialG140", "MagneticFieldStrengthPerpendicularT140", "Times150", "MagneticFieldStrengthAxialG150", "MagneticFieldStrengthPerpendicularT150", "Times160", "MagneticFieldStrengthAxialG160", "MagneticFieldStrengthPerpendicularT160", "Times170", "MagneticFieldStrengthAxialG170", "MagneticFieldStrengthPerpendicularT170", "Times180", "MagneticFieldStrengthAxialG180", "MagneticFieldStrengthPerpendicularT180", "Times190", "MagneticFieldStrengthAxialG190", "MagneticFieldStrengthPerpendicularT190", "Times200", "MagneticFieldStrengthAxialG200", "MagneticFieldStrengthPerpendicularT200", "Times210", "MagneticFieldStrengthAxialG210", "MagneticFieldStrengthPerpendicularT210", "Times220", "MagneticFieldStrengthAxialG220", "MagneticFieldStrengthPerpendicularT220", "Times230", "MagneticFieldStrengthAxialG230", "MagneticFieldStrengthPerpendicularT230", "Times240", "MagneticFieldStrengthAxialG240", "MagneticFieldStrengthPerpendicularT240", "Times250", "MagneticFieldStrengthAxialG250", "MagneticFieldStrengthPerpendicularT250", "Times260", "MagneticFieldStrengthAxialG260", "MagneticFieldStrengthPerpendicularT260", "Times270", "MagneticFieldStrengthAxialG270", "MagneticFieldStrengthPerpendicularT270", "Times280", "MagneticFieldStrengthAxialG280", "MagneticFieldStrengthPerpendicularT280", "Times290", "MagneticFieldStrengthAxialG290", "MagneticFieldStrengthPerpendicularT290", "Times300", "MagneticFieldStrengthAxialG300", "MagneticFieldStrengthPerpendicularT300"];
% opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
part1a1 = readtable(filename, opts);

data = struct();
keys = fieldnames(part1a1);

for i = 1:length(keys)
    key = keys{i}
    name = filterKeyNames(key)
    data.(name) = part1a1.(key)
end

end

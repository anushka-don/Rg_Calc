function pdbRes = urlToCell(url)
% Step 1: Download the data from the URL
options = weboptions('ContentType', 'text');
data = webread(url, options);

% Step 2: Parse the data and create a cell array
% Split the data into lines
dataLines = splitlines(data);

% Initialize a cell array to store the data
cellArray = cell(numel(dataLines), 1);

% Fill the cell array with data from each line
for i = 1:numel(dataLines)
    cellArray{i} = dataLines{i};
end
% Initialize empty arrays to store the extracted data
pdbRes = {};

    % Regular expression pattern to match PDB ID and residues
pattern = '(\w+)\s+(\w+)';

for i = 2:numel(cellArray)
% Extract data from the current line using regular expressions
    matches = regexp(cellArray{i}, pattern, 'tokens');
    % Check if the line matched the pattern and contains valid data
    if ~isempty(matches)
        pdbRes{end+1,1} = matches{1}{1}(1:4);
        pdbRes{end,2} = matches{1}{1}(5);
        pdbRes{end,3} = matches{1}{2};
    end
end


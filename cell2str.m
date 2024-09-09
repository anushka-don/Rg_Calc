function str = cell2str(cell)
str = "";
for i = 1:length(cell)
    str(end) = cell{i};
end
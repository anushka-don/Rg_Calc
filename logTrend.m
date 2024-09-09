function tble = logTrend(url)
%logTrend = To plot log log plot of the code
% This function is an extension of trendRgNumOfRes. It plots the og log
% plot of the same parameters.
pdbid_list = urlToCell(url);
rg = []; num = [];
for i = 1:length(pdbid_list)
    try
        rg(i) = radius_of_gyration(pdbid_list(i,1),pdbid_list(i,2));
        num(i) = str2double(pdbid_list(i,3));            
    catch
        fprintf("Error downloading chain %s of protein %s\n", pdbid_list{i,2},pdbid_list{i,1});
        continue;
    end
end
tble = table(rg,num);
end
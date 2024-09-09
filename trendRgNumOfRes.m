function trendRgNumOfRes(url)
    % Initiation of all terms
    pdbid_list = urlToCell(url);
    rg = []; num = [];
    figure;
    xlabel("Number of protein residues"); ylabel("Radius of gyration (in A)"); title("Comparison between the number of residues and radius of gyration of a protein");

    % Plotting of the graph
    hold on; grid on;
    for i = 1:length(pdbid_list)
        try
            rg(i) = radius_of_gyration(pdbid_list(i,1),pdbid_list(i,2));
            num(i) = str2double(pdbid_list(i,3));
            plot(num(i), rg(i),'.', 'MarkerEdgeColor', 'r');
        catch
            fprintf("Error downloading chain %s of protein %s\n", pdbid_list{i,2},pdbid_list{i,1});
            continue;
        end
    end
    coefficients = polyfit(num, rg, 1);
    xFit = linspace(min(num), max(num), 1000);
    yFit = polyval(coefficients , xFit);
    plot(xFit, yFit, 'k');

    hold off;
end

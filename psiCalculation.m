function psi = psiCalculation(pdbid)
%Calculating psi angles in a protein
coords = coordinates(pdbid); % to get a cell array from another function 'coordinates'
psi = [];

% to identify 'N' atoms in the molecule
for i = 1:height(coords)
    if strcmp(coords(i,3),'CA') % C-alpha atom
        for j = i:-1:1
            if strcmp(coords(j,3),'N') % previous N atom
                for k = i+1:height(coords)
                    if strcmp(coords(k,3),'C') % C atom
                        for l = k:height(coords)
                            if strcmp(coords(l,3),'N') % next N atom
                                a = []; b = []; c = []; d = [];
                                a = cell2mat(coords(j,4:6)); % coordinates of prev N
                                b = cell2mat(coords(i,4:6)); % coordinates of CA
                                c = cell2mat(coords(k,4:6)); % coordinates of C
                                d = cell2mat(coords(l,4:6)); % coordinates of next N

                                psi(end+1) = calculateDihedralAngle(a,b,c,d);
                                
                                break;
                            end
                        end
                    break;
                    end
                end
                break;
            end
        end
    end
end
psi = psi(:);
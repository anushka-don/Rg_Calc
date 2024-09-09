function phi = phiCalculation(pdbid)
%Calculating phi angles in a protein
coords = coordinates(pdbid); % to get a cell array from another function 'coordinates'
phi = [];


% to identify 'N' atoms in the molecule
for i = 1:height(coords)
    if strcmp(coords(i,3),'N') % N atom
        for j = i:-1:1
            if strcmp(coords(j,3),'C') % previous C atom
                for k = i+1:height(coords)
                    if strcmp(coords(k,3),'CA') % C-alpha atom
                        for l = k:height(coords)
                            if strcmp(coords(l,3),'C') % next C atom
                                a = []; b = []; c = []; d = [];
                                a = cell2mat(coords(j,4:6)); % coordinates of prev C
                                b = cell2mat(coords(i,4:6)); % coordinates of N
                                c = cell2mat(coords(k,4:6)); % coordinates of CA
                                d = cell2mat(coords(l,4:6)); % coordinates of next C

                                print(coords(i,1) + "\t")
                                phi(end+1) = calculateDihedralAngle(a,b,c,d);
                                
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
phi = phi(:)';
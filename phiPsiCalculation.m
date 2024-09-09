function answer = phiPsiCalculation(pdbid)
coords = coordinates(pdbid); % to get a cell array from another function 'coordinates'
phi = 0;
answer = {};
x = 1;

% to identify 'N' atoms in the molecule
for i = 1:height(coords)
    phi = 'NaN'; psi = 'NaN';
    if strcmp(coords(i,3),'N') % N atom
        for j = i:-1:1
            if strcmp(coords(j,3),'C') % previous C atom
                for k = i+1:height(coords)
                    if strcmp(coords(k,3),'CA') % C-alpha atom
                        %phi Calulation
                        for l = k:height(coords)
                            if strcmp(coords(l,3),'C') % next C atom
                                a = []; b = []; c = []; d = [];
                                a = cell2mat(coords(j,4:6)); % coordinates of prev C
                                b = cell2mat(coords(i,4:6)); % coordinates of N
                                c = cell2mat(coords(k,4:6)); % coordinates of CA
                                d = cell2mat(coords(l,4:6)); % coordinates of next C

                                phi = calculateDihedralAngle(a,b,c,d);

                                break;
                            end
                        end

                        %Psi calculation
                        for m = l+1:height(coords)
                            if strcmp(coords(m,3),'N')
                                e = cell2mat(coords(m,4:6)); % coordinates of next N

                                psi = calculateDihedralAngle(b,c,d,e);
                                break;
                            end
                        end
                    % Adding data to answer
                        answer(x,1) = coords(i,1); 
                        answer(x,2) = coords(i,2);
                        answer(x,3) = coords(i,7);
                        answer(x,4) = mat2cell(phi,1); 
                        answer(x,5) = mat2cell(psi,1);
                        x = x + 1;
                    break;
                    end
                end
                break;
            end
        end
    end
end
answer = cell2table(answer,"VariableNames",["ResName", "ResNum", "Chain ID", "Phi angle", "Psi angle"]);
end
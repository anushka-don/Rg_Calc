function rg = radius_of_gyration(pdbid, chainID)
    % Get the pdb coordinates from coordinates function
    coords = coordinates(pdbid);
    chain_coords = {};
    
    if nargin > 1  % If the chainID argument is provided, extract specific chain atoms
        chainID = upper(chainID);
        for i = 1:length(coords)
            if strcmp(cell2str(coords(i,7)),chainID)
                chain_coords(end+1,:) = coords(i,:);
            end
        end
    else 
        chain_coords = coords;
    end


    mass = 0; ix_total= 0; iy_total = 0; iz_total = 0;  % Defining the essential values for the code

% Get the inertia of the protein

for i = 1:height(chain_coords)
    % If the atom is of a specific type, then its mass is added here
    % To calculate the inertia of the atom in all the axes 
    if startsWith(chain_coords(i,3),'H')
        mass = mass + 1.00794;
        ix_total = ix_total + 1.00794*sqrt((cell2mat(chain_coords(i,5)))^2 + (cell2mat(chain_coords(i,6)))^2);    
        iy_total = iy_total + 1.00794*sqrt((cell2mat(chain_coords(i,4)))^2 + (cell2mat(chain_coords(i,6)))^2);
        iz_total = iz_total + 1.00794*sqrt((cell2mat(chain_coords(i,4)))^2 + (cell2mat(chain_coords(i,5)))^2);
    elseif startsWith(chain_coords(i,3),'C')
        mass = mass + 12.01070;
        ix_total = ix_total + 12.01070*sqrt((cell2mat(chain_coords(i,6)))^2 + (cell2mat(chain_coords(i,5)))^2);
        iy_total = iy_total + 12.01070*sqrt((cell2mat(chain_coords(i,6)))^2 + (cell2mat(chain_coords(i,4)))^2);
        iz_total = iz_total + 12.01070*sqrt((cell2mat(chain_coords(i,5)))^2 + (cell2mat(chain_coords(i,4)))^2);
    elseif startsWith(chain_coords(i,3),'N')
        mass = mass + 14.00670;
        ix_total = ix_total + 14.00670*sqrt((cell2mat(chain_coords(i,6)))^2 + (cell2mat(chain_coords(i,5)))^2);
        iy_total = iy_total + 14.00670*sqrt((cell2mat(chain_coords(i,4)))^2 + (cell2mat(chain_coords(i,6)))^2);
        iz_total = iz_total + 14.00670*sqrt((cell2mat(chain_coords(i,5)))^2 + (cell2mat(chain_coords(i,4)))^2);
    elseif startsWith(chain_coords(i,3),'O')
        mass = mass + 15.99940;
        ix_total = ix_total + 15.99940*sqrt((cell2mat(chain_coords(i,6)))^2 + (cell2mat(chain_coords(i,5)))^2);
        iy_total = iy_total + 15.99940*sqrt((cell2mat(chain_coords(i,5)))^2+ (cell2mat(chain_coords(i,6)))^2);
        iz_total = iz_total + 15.99940*sqrt((cell2mat(chain_coords(i,4)))^2+ (cell2mat(chain_coords(i,5)))^2);
    elseif startsWith(chain_coords(i,3),'S')
        mass = mass + 32.06500;
        ix_total = ix_total + 32.06500*sqrt((cell2mat(chain_coords(i,6)))^2+ (cell2mat(chain_coords(i,5)))^2);
        iy_total = iy_total + 32.06500*sqrt((cell2mat(chain_coords(i,5)))^2+ (cell2mat(chain_coords(i,4)))^2);
        iz_total = iz_total + 32.06500*sqrt((cell2mat(chain_coords(i,4)))^2+ (cell2mat(chain_coords(i,5)))^2);
    end
end

% Calculate the radius of gyration
rg = sqrt((ix_total + iy_total + iz_total)/mass);
end

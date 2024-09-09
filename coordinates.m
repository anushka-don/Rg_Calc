function [coords,no_of_atoms] = coordinates(pdbid)
% to get coordinates of a protein molecule from a pdb file
pdbfile = getpdb(pdbid); % to get the pdb file (protein stuctural data from net)

atoms = pdbfile.Model.Atom; 
% To get the informations stored in subpart Atom in Model of the pdb file

coords = {atoms.resName; atoms.resSeq; atoms.AtomName; atoms.X; atoms.Y; atoms.Z; atoms.chainID}'; 
% cell array containing residue name, sewuence number, atoms name and x, y,
% z coordinates.

no_of_atoms = pdbfile.Master.numREMARK;
end
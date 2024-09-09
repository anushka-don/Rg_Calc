function dihedral_angle = calculateDihedralAngle(a,b,c,d)
    
    % Vectors between the points
    v1 = b - a;
    v2 = c - b;
    v3 = d - c;

    % Calculate the cross products
    cross1 = cross(v1, v2);
    cross2 = cross(v2, v3);

    % Normalize the cross products
    cross1 = cross1 / norm(cross1);
    cross2 = cross2 / norm(cross2);

    % Calculate the dot product between the cross products
    dot_product = dot(cross1, cross2);

    % Calculate the dihedral angle using the arccosine
    dihedral_rad = acos(dot_product);

    % Determine the sign of the angle
    if dot(cross1, v3) < 0
        dihedral_rad = -dihedral_rad;
    end

    % Convert the dihedral angle from radians to degrees
    dihedral_angle = rad2deg(dihedral_rad);
end

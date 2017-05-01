function v=missing2(X,i,j)
z = 1:9; 
z(nonzeros(X(i,:))) = 0; 
z(nonzeros(X(:,j))) = 0; 
z(nonzeros(part_pos(X,i,j)))= 0; 
v = nonzeros(z)'; 
end
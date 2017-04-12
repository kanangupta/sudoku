function possible=missingnumbers(X,row,col)
    full=1:9;
    missingrow=setdiff(full,X(row,:));
    missingcol=setdiff(full,X(:,col)');
    block=part_pos(X,row,col);
    missingblock=setdiff(full,block(:)');
    possible=intersect(missingrow,missingcol);
    possible=intersect(possible,missingblock);
end
    
    
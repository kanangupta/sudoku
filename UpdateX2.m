function X=UpdateX2(X,Xcell)
    for j=1:9
        for i=1:9
            if size(Xcell{i,j},2)==1
                X(i,j)=Xcell{i,j};
            end
        end
    end
end
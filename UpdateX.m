function Xcell=UpdateX(X)
    Xcell=num2cell(X);
    for i=1:9
        for j=1:9
            if X(i,j)==0
                Xcell{i,j}=missingnumbers(X,i,j);
            end
        end
    end
end
                
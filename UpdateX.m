function Xcell=UpdateX(X)
    Xcell=num2cell(X);
    for j=1:9
        for i=1:9
            if X(i,j)==0
                Xcell{i,j}=missing2(X,i,j);
            end
        end
    end
end
                
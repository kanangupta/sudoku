function [valid,invalid]=valid_input(a)
invalid=0;
if size(a)~=[9,9]
    valid=false;
    return;
end
if ~(fix(a)==a & a<=9 & a>=0)
    valid=false;
    return;
end
for i=1:3:7
        for j=1:3:7
            temp=a(i:i+2,j:j+2);
            if ~isequal(sort(nonzeros(temp)),nonzeros(unique(temp)))
                valid=false;
                invalid=temp;
                return;
            end
        end
end
for i=1:9
    if ~isequal(sort(nonzeros(a(i,1:end))),nonzeros(unique(a(i,1:end))))
                invalid=a(i,1:end);
                valid=false;
                return;
    end
end
for j=1:9
    if ~isequal(sort(nonzeros(a(1:end,j))),nonzeros(unique(a(1:end,j))))
                invalid=a(1:end,j);
                valid=false;
                return;
    end
end
valid=true;
end
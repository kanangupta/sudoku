function [valid,invalid]=valid_input(a)
invalid=0;
if ~(fix(a)==a & a<=9 & a>=0)
    valid=false;
    return;
end
for i=1:3:7
        for j=1:3:7
            temp=a(i:i+2,j:j+2);
            if exactly_once(temp)~=1
                valid=false;
                invalid=temp;
                return;
            end
        end
end
for i=1:9
    if exactly_once(a(i,1:end))~=1
                invalid=a(i,1:end);
                valid=false;
                return;
    end
end
for j=1:9
    if exactly_once(a(1:end,j))~=1
                invalid=a(1:end,j);
                valid=false;
                return;
    end
end
valid=true;
end
function x=shidoku(x)
f=1;
boolx=boolean(x);
x
for i=1:9
    for j=1:9
        if boolx(i,j)==0
            xm=missingnumbers(x,i,j);
            x(i,j)=xm(1);
            f=0;
            break
        end
    end
    if f==0
        break
    end
end
x=shidoku(x)
end

function ok=exactly_once(a)
a=a(:);
b=unique(a);
ok = size(b(b~=0),1)==size(a(a~=0),1);
end
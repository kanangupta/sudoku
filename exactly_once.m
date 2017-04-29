function ok=exactly_once(a)
ok = isequal(sort(nonzeros(a)),nonzeros(unique(a)));
end
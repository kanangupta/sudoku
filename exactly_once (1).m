function ok=exactly_once(a)
ok = nonzeros(a)==nonzeros(unique(a));
end
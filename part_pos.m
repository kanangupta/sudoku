function sub_block=part_pos(a,row,col)
index=1:3:7;
sub_row=index(ceil(row/3));
sub_col=index(ceil(col/3));
sub_block=a(sub_row:sub_row+2,sub_col:sub_col+2);
end
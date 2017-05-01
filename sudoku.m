%% Sudoku Solver
% This is a MATLAB(R) program designed to solve sudoku puzzles of the 9x9 
% kind using a brute force algorithm called backtracking.

%% Main Function
% This is the main function that calls other functions of 
% X is a sample 9x9 sudoku matrix that the program uses when run without
% any parameters.

function [X,solved]=sudoku(X)
[X,Xcell]=UpdateRecursively(X);
if ~valid_input(X) || any(any(cellfun(@isempty,Xcell)))
    solved=false;
    return %unsolvable
end
if any(X(:)==0)
    firstzero=find(X==0,1);
    Y=X;
    for i=Xcell{firstzero}
        X=Y;
        X(firstzero)=i;
        X=sudoku(X);
        if X>0
            if valid_input(X)
                solved=true;
                return %solved
            end
        end
        end
    end
end

%% Validity Check
% This function checks the validity of the input 9x9 matrix and determines
% if it's a valid sudoku puzzle.

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

%% Function to get 3x3 grids from input
% This function gets the 9 3x3 sub grids from the input 9x9 matrix.

function sub_block=part_pos(a,row,col)
index=1:3:7;
sub_row=index(ceil(row/3));
sub_col=index(ceil(col/3));
sub_block=a(sub_row:sub_row+2,sub_col:sub_col+2);
end

%% Checks for possible candidates at a position
% This function evaluates 

function v=missing2(X,i,j)
full = 1:9; 
full(nonzeros(X(i,:))) = 0; 
full(nonzeros(X(:,j))) = 0; 
full(nonzeros(part_pos(X,i,j)))= 0; 
v = nonzeros(full)'; 
end

%% Update Function 1
% This function checks for missing places in the cell and updates them as
% necessary.

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
                
%% Update Function 2
% Similar to the previous function, this function checks for missing
% places in the 9x9 grid and updates them as necessary.

function X=UpdateX2(X,Xcell)
    for j=1:9
        for i=1:9
            if size(Xcell{i,j},2)==1
                X(i,j)=Xcell{i,j};
            end
        end
    end
end

%% Recursive Call
% The 
function [Xnew, PossibleCell]=UpdateRecursively(X)
    PossibleCell=UpdateX(X);
    Xnew=UpdateX2(X,PossibleCell);
    while abs(sum(sum(Xnew-X)))>0
        X=Xnew;
        PossibleCell=UpdateX(X);
        Xnew=UpdateX2(X,PossibleCell);
    end
end

%% Sudoku Solver
% This is a MATLAB(R) program designed to solve sudoku puzzles of the 9x9 
% kind using a brute force algorithm called backtracking.

%% Main Function
% This is the main function that calls other functions of 
% X is a sample 9x9 sudoku matrix that the program uses when run without
% any parameters.

function [X,solved]=sudoku(X)
if ~nargin
    X = input('Please input the sudoku puzzle as a 9x9 matrix of integers 1 to 9, and 0 for blank spaces.\n Each entry in each row should be an integer from 0 to 9, separated by a space.\n Each row should be separated by a semicolon (;). The input should be enclosed in square brackets [ ].\n For example, a 3x3 matrix would be written like this: [1 2 3;4 5 6;7 8 9].\n ')
    [valid,invalid]=valid_sudoku(X);
    if ~valid
        fprintf(invalid)
        sudoku
    end
end
[X,Xcell]=UpdateRecursively(X);
if ~valid_sudoku(X) || any(any(cellfun(@isempty,Xcell)))
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
            if valid_sudoku(X)
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

function [valid,invalid]=valid_sudoku(a)
invalid=false;
if size(a)~=[9,9]
    invalid='The input is not a 9x9 matrix.\n';
    valid=false;
    return;
end
if ~(fix(a)==a & a<=9 & a>=0)
    invalid='The input should contain only integers 0 to 9.\n'
    valid=false;
    return;
end
for i=1:9
    if ~isequal(sort(nonzeros(a(i,1:end))),nonzeros(unique(a(i,1:end))))
                invalid=sprintf('The input is an invalid puzzle. Some entries are being repeated in row %d.\n',i);
                valid=false;
                return;
    end
end
for j=1:9
    if ~isequal(sort(nonzeros(a(1:end,j))),nonzeros(unique(a(1:end,j))))
                invalid=sprintf('The input is an invalid puzzle. Some entries are being repeated in column %d\n.',j);
                valid=false;
                return;
    end
end
for i=1:3:7
        for j=1:3:7
            temp=a(i:i+2,j:j+2);
            if ~isequal(sort(nonzeros(temp)),nonzeros(unique(temp)))
                valid=false;
                invalid=sprintf('Some elements are being repeated in the subblock starting at the position (%d,%d)\n.',i,j);
                return;
            end
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

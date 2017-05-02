%% Sudoku Solver
% This is a MATLAB(R) program designed to solve sudoku puzzles of the 9x9 
% kind using a brute force algorithm called backtracking.

%% Main Function
% This is the main function that calls other functions of 
% X is a sample 9x9 sudoku matrix that the program uses when run without
% any parameters.
function sudoku(X)
if ~nargin
    X = input('Please input the sudoku puzzle as a 9x9 matrix of integers 1 to 9, and 0 for blank spaces.\n Each entry in each row should be an integer from 0 to 9, separated by a space.\n Each row should be separated by a semicolon (;). The input should be enclosed in square brackets [ ].\n For example, a 3x3 matrix would be written like this: [1 2 3;4 5 6;7 8 9].\n ')
end
[valid,invalid]=valid_sudoku(X);
if ~valid
    fprintf(invalid)
    sudoku
end
[X,solved]=solver(X);
if solved
    fprintf('The solved sudoku is :\n')
    fprintf([repmat(' %d ', 1,9) '\n'], X')
else
    fprintf('The given sudoku is an unsolvable puzzle.\n')
end
again=input('Do you want to solve another sudoku puzzle? Enter 0 for No, and any non-zero number for Yes.\n');
if again
    sudoku
end
end

function [X,solved]=solver(X)
[X,Xcell]=RepeatCandidates(X);
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
        X=solver(X);
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

function [valid,invalid]=valid_sudoku(X)
invalid=false;
if size(X)~=[9,9]
    invalid='The input is not a 9x9 matrix.\n';
    valid=false;
    return;
end
if ~(fix(X)==X & X<=9 & X>=0)
    invalid='The input should contain only integers 0 to 9.\n'
    valid=false;
    return;
end
for row=1:9
    if ~isequal(sort(nonzeros(X(row,1:end))),nonzeros(unique(X(row,1:end))))
                invalid=sprintf('The input is an invalid puzzle. Some entries are being repeated in row %d.\n',row);
                valid=false;
                return;
    end
end
for col=1:9
    if ~isequal(sort(nonzeros(X(1:end,col))),nonzeros(unique(X(1:end,col))))
                invalid=sprintf('The input is an invalid puzzle. Some entries are being repeated in column %d\n.',col);
                valid=false;
                return;
    end
end
for row=1:3:7
        for col=1:3:7
            temp=X(row:row+2,col:col+2);
            if ~isequal(sort(nonzeros(temp)),nonzeros(unique(temp)))
                valid=false;
                invalid=sprintf('Some elements are being repeated in the subblock starting at the position (%d,%d)\n.',row,col);
                return;
            end
        end
end
valid=true;
end

%% Function to get 3x3 grids from input
% This function gets the 9 3x3 sub grids from the input 9x9 matrix.

function block=sub_block(X,row,col)
index=1:3:7;
sub_row=index(ceil(row/3));
sub_col=index(ceil(col/3));
block=X(sub_row:sub_row+2,sub_col:sub_col+2);
end

%% Checks for possible candidates at a position
% This function evaluates 

function candidates=missingcandidates(X,row,col)
full = 1:9; 
full(nonzeros(X(row,:))) = 0; 
full(nonzeros(X(:,col))) = 0; 
full(nonzeros(sub_block(X,row,col)))= 0; 
candidates = nonzeros(full)'; 
end

%% Update Function 1
% This function checks for missing places in the cell and updates them as
% necessary.

function Xcell=CandidateCell(X)
    Xcell=num2cell(X);
    for col=1:9
        for row=1:9
            if X(row,col)==0
                Xcell{row,col}=missingcandidates(X,row,col);
            end
        end
    end
end
                
%% Update Function 2
% Similar to the previous function, this function checks for missing
% places in the 9x9 grid and updates them as necessary.

function X=FillSingletons(X,Xcell)
    for col=1:9
        for row=1:9
            if size(Xcell{row,col},2)==1
                X(row,col)=Xcell{row,col};
            end
        end
    end
end

%% Recursive Call
% The 
function [Xnew, XCell]=RepeatCandidates(X)
    XCell=CandidateCell(X);
    Xnew=FillSingletons(X,XCell);
    while abs(sum(sum(Xnew-X)))>0
        X=Xnew;
        XCell=CandidateCell(X);
        Xnew=FillSingletons(X,XCell);
    end
end

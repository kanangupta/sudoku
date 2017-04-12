function [Xnew, PossibleCell]=UpdateRecursively(X)
    PossibleCell=UpdateX(X);
    Xnew=UpdateX2(X,PossibleCell);
    while abs(sum(sum(Xnew-X)))>0
        X=Xnew;
        PossibleCell=UpdateX(X);
        Xnew=UpdateX2(X,PossibleCell);
    end
end
function [U] = Solveur_Chol(A,F);

[C] = Cholesky(A);
Y = descente(C,F) ;
X = remontee(C',Y) ;
B = A * X ;

U = B ;
end
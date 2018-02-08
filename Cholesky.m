function [C] = Cholesky(A)
n = length(A);
C = zeros(n,n);
for k=1:n-1
    C(k,k) = sqrt(A(k,k));
    C(k+1:n,k) = A(k+1:n,k) / C(k,k);
    A(k+1 : n , k+1 : n) = A(k+1 : n , k+1 : n) - C(k+1:n,k) * (C(k+1:n,k)') ;
end
C(n,n)=sqrt(A(n,n));

    



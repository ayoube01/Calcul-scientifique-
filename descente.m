function x=descente2(L,b)
n=length(L);
for i=1:n
    S=0;
    for k=1:i-1
        S=S+L(i,k)*x(k);
    end
    x(i)=(b(i)-S)/L(i,i);
end

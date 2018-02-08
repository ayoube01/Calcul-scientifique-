function x = remontee2(U,d)
n=length(U);
x=zeros(n,1);
x(n)=d(n)/U(n,n);

for i=n-1:-1:1
    S=0;
    for k=i+1:n
        S=S+U(i,k)*x(k);
    end
    x(i)=(d(i)-S)/U(i,i);
end  
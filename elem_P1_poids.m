function P=elem_P1_poids(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,l)
Ar=ar(l,:);
X=coord(:,1);
Y=coord(:,2);
mes=sqrt ( ( X(Ar(1))-X(Ar(2)) )^2+ ( Y(Ar(1))-Y(Ar(2)))^2);
P=(mes/4)*[1 ,1 ;1 ,1];
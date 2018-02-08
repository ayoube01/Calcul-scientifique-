function e=elem_P1_transf(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,l)
Ar=ar(l,:);
X=coord(:,1);
Y=coord(:,2);
mes=sqrt ( ( X(Ar(1))-X(Ar(2)) )^2+ ( Y(Ar(1))-Y(Ar(2)))^2);
P=(mes/2)*[1  ;1 ];
e=fonc_uE( ( X(Ar(1)) +  X(Ar(2)) )/2,( Y(Ar(1)) +  Y(Ar(2)) )/2 )*fonc_a( ( X(Ar(1)) +  X(Ar(2)) )/2,( Y(Ar(1)) +  Y(Ar(2)) )/2 )*P;
function F =elem_P1_source(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,l)
T=tri(l,:)
X=coord(:,1);
Y=coord(:,2);
B=[X(T(2))-X(T(1)),X(T(3))-X(T(1));Y(T(2))-Y(T(1)),Y(T(3))-Y(T(1))];
mes=det(B);
F=(mes*3)*fonc_f ( (X(T(1))+ X (T(2))+ X (T(3))) /3,(X(T(1))+ X (T(2))+ X (T(3)))/3)*ones(3,1)
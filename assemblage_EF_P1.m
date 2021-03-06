function [A,F]=assemblage_EF_P1(nbn,nbe,nba,coord,tri,ar,refn,reft,refa)
CodeFou=1;
A=zeros(nbn,nbn);
F=zeros(nbn,1);
for l=1:nbe
    K=elem_P1_rigid(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,l);
    f=elem_P1_source(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,l);
    for i=1:3
        I=tri(l,i);
        F(I)=F(I)+f(i);
        for j=1:3
            J=tri(l,j);
            A(I,J)=A(I,J)+K(i,j);
        end 
    end
end
for a=1:nba
    if (refa(a)==CodeFou)
        E=elem_P1_transf(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,a);
        P=elem_P1_poids(nbn,nbe,nba,coord,tri,ar,refn,reft,refa,a);
        for i=1:2
            I=ar(a,i);
            F(I)=F(I)+E(i);
            for j=1:2
                J=ar(a,j);
                A(I,J)=A(I,J)+P(i,j);
            end
        end
    end
end
%pour afficher trisurf(tri,coord(:,1),coord(:,2),u  )

function f=fonc_f(x,y)
f=(pi/2)^2.*sin((pi/2).*x)-2*cos((pi/2).*y)+(pi/2)^2*x.*(x-4).*cos((pi/2).*y);
%y'a un moins devant toutes l'expression

% >> trimesh(tri,coord(:,1),coord(:,2),fonc_f(coord(:,1),coord(:,2))  ) pour affichage du maillage
%// >> trisurf(tri,coord(:,1),coord(:,2),fonc_f(coord(:,1),coord(:,2))  )
close all;
clear all;

 
%parametre du maillage 

lambda_l=1;
CodeDir=15;




% lecture du maillage sur fichier
M=lit_fichier_msh('m1.msh') ;

nbn=M.nbn; nbe=M.nbe; nba=M.nba;


% affichage du nombre de noeuds (nbn) et de triangles (nbe)
disp(sprintf('%d sommets, %d triangles',nbn,nbe));


%Assemblage et solveur de l'equation


A=zeros(nbn,nbn); % allocation d'une matrice creuse
F = zeros(nbn,1); % allocation d'un vecteur
U_D=zeros(nbn,1);

for l=1:nbe
    % coordonnees du l-eme triangle:
    coord_tri = [M.coord( M.tri(l,:) , 1 )'; 
                M.coord( M.tri(l,:) , 2 )'];
    % calcul de la matrice �l�mentaire de rigidit� sur le triangle K_l        
    K_l=rigid_elem(coord_tri,lambda_l);
    % calcul du vecteur �l�mentaire des charges volumiques            
    F_l=charge_elem(coord_tri,'fctf');
    for i=1:3
      I=M.tri(l,i); 
       if(M.refn(I)~=CodeDir)
           F(I)=F(I)+F_l(i);
             for j=1:3
                J=M.tri(l,j);
                 if (M.refn(J)~=CodeDir) 
                    A(I,J)=A(I,J)+K_l(i,j);
                 else
                  % coordonn�es du I-�me noeud
                  x = M.coord(I,1); y = M.coord(I,2);
                  % �valuation de la fonction u_D
                  U_D(J)=feval(x,y,M.refn(I));  
                  F(I)=F(I)-K_l(i,j)*U_D(J);
                 end
             end
       else    
             A(I,I)=A(I,I)+K_l(i,i);    
           F(I)=F(I)+K_l(i,i)*U_D(I);
       end 
    end
end

%on calcule la solution U
%U = A\F;   % AU = F  %On prend 
%Solveur Cholesky
U=Solveur_Chol2(A,F);




disp(' ');
disp('r�solution syst�me lin�aire termin�');
disp(' ');

subplot(1,2,1)
%profil de la matrice A
spy(A)
hold on;
%%%%Qualit� du maillage 
Q=qualite(M.nbe,M.tri,M.coord); 
subplot(1,2,2); 
trisurf(M.tri,M.coord(:,1),M.coord(:,2),U);

hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                  %
%                       Post-traitement                                            %
%                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure('Units','Normalized','Position',[0.1 0.1 0.8 0.8])
subplot(2,1,1)
%%%%%%%%%%%%%%%%% appartement %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coord = load('data.txt');%uploader les points du maillage
plot([coord(:,1); coord(1,1)], [coord(:,2); coord(1,2)],'k','LineWidth',2);%trace de l'appartement
axis off
hold on

f_salon = [0 1.0; 0.25 1.0];%%%fen�tre salon
f_cuisine = [0.75 0.5;0.95 0.5 ];%%%fen�tre cuisine
f_sdb = [0.25 0; 0.15 0];%%%fen�tre sdp


p_entree = [0.5 0.6; 0.5 0.75];%porte entr�e


plot(f_salon(:,1), f_salon(:,2), 'b', 'LineWidth',5);%dessin fen�tre salon
plot(f_cuisine(:,1), f_cuisine(:,2), 'b', 'LineWidth',4);%dessin cuisine salon
plot(f_sdb(:,1), f_sdb(:,2), 'b', 'LineWidth',4);%dessin sdb salon

plot(p_entree(:,1), p_entree(:,2), 'm', 'LineWidth',4);%dessin porte entr�e



plot([0 0.25 ],[0.97  0.97],'r', 'LineWidth',6); % radiateur salon
plot([0.15 0.25 ], [0.02  0.02],'r','LineWidth',6); %radiateur sdb
plot([0.75 0.95 ],[0.48  0.48],'r', 'LineWidth',6);% radiateur cuisine

subplot(2,1,2)
%%%%%%%%%%%%%%%% Simulation de la temp�rature %%%%%%%%%%%%%%%%%%%%%%%%%%%%
trisurf(M.tri,M.coord(:,1),M.coord(:,2),U);
view(2);
colorbar;
hold on;
k = menu('fichier.msh','m0.msh','m1.msh','m2.msh','m3.msh','m4.msh','Projet.msh')
m= menu ('choisir methode','num','ref')
if (k==1)  [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh('m0.msh');
        if (m==1)trace_maillage_num(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
        else trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
        end 
end
if (k==2)  [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh('m1.msh');
     if (m==1)trace_maillage_num(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
     else trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
     end
end
if (k==3)  [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh('m2.msh');
  if (m==1)trace_maillage_num(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
  else trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
  end
end
if (k==4)  [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh('m3.msh');
     if (m==1)trace_maillage_num(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
     else trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
     end 
end
if (k==5)  [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh('m4.msh');
 if (m==1)trace_maillage_num(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
 else trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
 end
end
if (k==6)  [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh('Projet.msh');
     if (m==1)trace_maillage_num(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
     else trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa);
     end 
end

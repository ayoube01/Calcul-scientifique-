function [nbn,nbe,nba,coord,tri,ar,refn,reft,refa]=lit_fichier_msh(fichier_msh)


	fid=fopen(fichier_msh,'r');
	nbn=fscanf(fid,'%d',1);
    nbe=fscanf(fid,'%d',1);
    nba=fscanf(fid,'%d',1);
	for i=1:nbn
      for j=1:2
        coord(i,j)=fscanf(fid,'%f',1);
      end 
      refn(i)=fscanf(fid,'%d',1);
    end
    for i=1:nbe
      for j=1:3
        tri(i,j)=fscanf(fid,'%d',1);
      end 
      reft(i)=fscanf(fid,'%d',1);
    end
    for i=1:nba
      for j=1:2
        ar(i,j)=fscanf(fid,'%d',1);
      end 
      refa(i)=fscanf(fid,'%d',1);
    end 
	refn=refn';
    reft=reft';
    refa=refa';
	
 fclose(fid);





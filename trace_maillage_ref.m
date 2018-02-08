function trace_maillage_ref(nbn,nbe,nba,coord,tri,ar,refn,reft,refa)
xt=coord(:,1); yt=coord(:,2); zt=zeros(size(xt));

hfig=figure(1); clf; hold on;
set(hfig,'Position',[200 10 1000 700]);
%subplot(212)
hmesh=trimesh(tri,xt,yt,zt);
title(sprintf('REFERENCES du Maillage Eléments Finis de type P1 (%d triangles, %d noeuds, %d aretes)',nbe,nbn,nba))
xlabel('axe Ox'); ylabel('axe Oy'); axis equal;

for i=1:length(xt) % noeuds
  h=text(xt(i),yt(i),num2str(refn(i))); 
  set(h,'Color','r');
end

for k=1:length(tri(:,1)) % triangles
  i1=tri(k,1); i2=tri(k,2); i3=tri(k,3);
  xm=(xt(i1)+xt(i2)+xt(i3))/3; ym=(yt(i1)+yt(i2)+yt(i3))/3;
  h=text(xm,ym,num2str(reft(k))); 
  set(h,'Color','k');
end

for a=1:length(ar(:,1)) % aretes
  i1=ar(a,1); i2=ar(a,2);
  xm=(xt(i1)+xt(i2))/2; 
  ym=(yt(i1)+yt(i2))/2;
  h=text(xm,ym,num2str(refa(a)));
  set(h,'Color','b');
end

axis([min(xt) max(xt) min(yt) max(yt)]); 

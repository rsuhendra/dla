r=120; 
k=0.5; 

[mass, A]=dla2D(r,k);
imagesc(A)
title(sprintf('$r=%i, k=%g$',r,k))
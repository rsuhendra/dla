r=120; 
k=1.0; 

[mass, A]=dla2D(r,k);
imagesc(A)
title(sprintf('$r=%i, k=%g$',r,k))
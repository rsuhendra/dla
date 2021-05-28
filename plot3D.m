r=50;
k=0.3;

X=zeros(1,r^2);
Y=zeros(1,r^2);
Z=zeros(1,r^2);

[mass,A]=dla3D(r,k);

counter=1;
for i=1:length(A)
    for j=1:length(A)
        for l=1:length(A)
            if A(i,j,l)==1
                X(counter)=i;
                Y(counter)=j;
                Z(counter)=l;
                counter=counter+1;
            end
        end
    end
end

d=(length(A)+1)/2;
figure(1)
scatter3(X,Y,Z,10,'filled')
axis([d-r-2 d+r+2 d-r-2 d+r+2 d-r-2 d+r+2 ])
pbaspect([1 1 1])
title(sprintf('$r=%i, k=%g$',r,k))
xlabel('x')
ylabel('y')
zlabel('z')

figure(2)
subplot(1,3,1)
imagesc(A(:,:,d-1))
title(sprintf('%i slice',d-1))
subplot(1,3,2)
imagesc(A(:,:,d))
title(sprintf('%i slice',d))
subplot(1,3,3)
imagesc(A(:,:,d+1))
title(sprintf('%i slice',d+1))


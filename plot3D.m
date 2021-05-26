r=50;
k=1;

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
scatter3(X,Y,Z,10,'filled')
axis([d-r-2 d+r+2 d-r-2 d+r+2 d-r-2 d+r+2 ])
pbaspect([1 1 1])
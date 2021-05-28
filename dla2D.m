function [mass, A] = dla2D(rmin,k) % rmin = size of cluster, k = stickiness
    d=2; % area of rmax circle compared to rmin circle
    max_iter=50000; % maximum iterations before stopping 

    rmax=round(rmin*sqrt(d)); % rmax is death radius of particle
    
    N=2*rmax+3; 
    A=zeros(N);
    m=ceil(N/2); % middle of grid
    A(m,m)=1;
    mass=1; % number of total particles in cluster

    terminate=false; % termination condition

    for j=1:max_iter
        d=rmin+2;
        theta=unifrnd(0,2*pi);
        x=m+round(d*cos(theta));
        y=m+round(d*sin(theta));

        A(x,y)=1;

        while 1
            sum=A(x+1,y)+ A(x-1,y)+ A(x,y+1)+A(x,y-1); % check if any neighbors
            if sum>0 && rand<k % if neighbors and it sticks, then move on to next particle
                if (x-m)^2+(y-m)^2 >= rmin^2 % check if any branch passed rmin
                    terminate=true; % if so, terminate program
                end
                mass=mass+1;
                break
            end
            
            A(x,y)=0; % first set to current location to have no particle
            
            c=randi(4); % randomly picks between up, down, left, right
            switch c
                case 1
                    if A(x+1,y)==0 % if spot is not taken
                        x=x+1;
                    end
                case 2
                    if A(x-1,y)==0
                        x=x-1;
                    end
                case 3
                    if A(x,y+1)==0
                        y=y+1;
                    end
                case 4
                    if A(x,y-1)==0
                        y=y-1;
                    end
            end
            if ((x-m)^2+(y-m)^2)>rmax^2 % if particle escapes past rmax, kill it
                break;
            else % otherwise particle settles down
                A(x,y)=1;
            end
        end
        if terminate==true
            break;
        end
    end
    if j==max_iter
        fprintf('cluster incomplete, try higher max_iter');
    end
end



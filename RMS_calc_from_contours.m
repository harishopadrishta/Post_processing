A = importdata('uy_contour5000000.dat');
npoints = 100;
rmsval(1:npoints) = 0.0;
nbin(1:npoints) = 0.0;
vyave(1:npoints) = 0.0;

prad = 148.50;
binspace = prad/npoints;
visc = 0.0032;
Rstar = 180.0;
ustar = Rstar*visc/(prad);
ystar = visc/ustar;
x = A(:,1);
z = A(:,2);
uy = A(:,3);
n = length(x);
for i = 1:n
    r = sqrt(x(i)*x(i) + z(i)*z(i));
%     x1(i) = x(i) - 0.5;
%     z1(i) = z(i) - 0.5;
%     x2(i) = x(i) + 0.5;
%     z2(i) = z(i) + 0.5;
%     r(1) = sqrt(x1(i)*x1(i) + z1(i)*z1(i))/prad;
%     r(2) = sqrt(x1(i)*x1(i) + z2(i)*z2(i))/prad;
%     r(3) = sqrt(x2(i)*x2(i) + z1(i)*z1(i))/prad;
%     r(4) = sqrt(x2(i)*x2(i) + z2(i)*z2(i))/prad;
%     for j = 1:4
%         if r(j) > dmax 
%             dmax = r(j);
%         end
%         if r(j) < dmin 
%             dmin = r(j);
%         end
%     end
%     if dmin <=1.0
%         ibin2 = floor(dmax/binspace) + 1;
%         ibin1 = floor(dmin/binspace) + 1;
%     end
%     if(ibin1 > npoints) 
%         ibin1 = npoints;
%     end
    if r <= 148.50
         if (r/binspace) == npoints
            rmsval(npoints) = rmsval(npoints) + uy(i)*uy(i);
            vyave(npoints) = vyave(npoints) + uy(i);
            nbin(npoints) = nbin(npoints) + 1;
         else
            ibin = floor(r/binspace) + 1;
            rmsval(ibin) = rmsval(ibin) + uy(i)*uy(i);
            vyave(ibin) = vyave(ibin) + uy(i);
            nbin(ibin) = nbin(ibin) + 1;
        end
    else
    end
end
for j = 1:npoints
    yplus(j) = ((npoints - (real(j) - 0.5))/npoints)*(prad/ystar);
    vyave(j) = vyave(j)/(nbin(j));
    vrms(j) = rmsval(j)/(nbin(j));
    vrms(j) = vrms(j) - vyave(j)*vyave(j);
end

plot(yplus,vrms);

        
            
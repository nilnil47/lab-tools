wError = 0.03 * ones(size(w));
Rerror = R * 0.006;
vRError = vR * 0.006;

VR = [vR - vRError,vR,vR + vRError];
R = [R - Rerror,R,R+ Rerror];
I = VR ./ flip(R);

Idelta = abs(I - circshift(I,[0,-1]));
Idelta = Idelta(:,1:2);

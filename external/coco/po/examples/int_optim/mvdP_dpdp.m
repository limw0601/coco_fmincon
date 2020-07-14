function dJ = mvdP_dpdp(x, p)

x1 = x(1,:);
x2 = x(2,:);
x3 = x(3,:);
p1 = p(1,:);
p2 = p(2,:);
p4 = p(4,:);

dJ = zeros(3,4,4,numel(x1));
dJ(1,1,1,:) = 2*(-p4.*(x1.^3/3-x1) + (x3-x1)./p2 - x2)./p1.^3;
dJ(1,2,1,:) = (x3-x1)./p1.^2./p2.^2;
dJ(1,4,1,:) = (x1.^3/3-x1)./p1.^2;
dJ(1,2,2,:) = 2*(x3-x1)./p1./p2.^3;
dJ(3,2,2,:) = 2*(x1-x3)./p2.^3;
dJ(1,1,2,:) = (x3-x1)./p1.^2./p2.^2;
dJ(1,1,4,:) = (x1.^3/3-x1)./p1.^2;

end
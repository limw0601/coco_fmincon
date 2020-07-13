function y = catn(x, p)
%CATN   'coll'-compatible encoding of catenary vector field

x1 = x(1,:);
x2 = x(2,:);

y(1,:) = x2;
y(2,:) = (1+x2.^2)./x1;

end

function J = gfunc_dy(t,x,y,p)
%CATENARY   'coll'-compatible encoding of catenary vector field

% x1 = x(1,:);
% x2 = x(2,:);
% 
% f = x2-y;

J = zeros(1,1,numel(t));
J(1,1,:) = -1;

end
function sol = coll_init_sol(data, t0, x0, p0)
%COLL_INIT_SOL   Build initial solution guess.
%
% Use sampled trajectory on temporal mesh to construct initial solution
% guess for 'coll' toolbox.
%
% Differs from coll_v2 by initializing the warping coefficients and the
% corresponding Lagrange multiplier for a comoving-mesh algorithm.
%
% SOL = COLL_INIT_SOL(DATA, T0, X0, P0)
%
% DATA - Toolbox data structure.
% T0   - Array of temporal mesh points.
% X0   - Array of state vectors at mesh points.
% P0   - Initial solution guess for problem parameters.

% Copyright (C) Frank Schilder, Harry Dankowicz
% $Id: coll_init_sol.m 2839 2015-03-05 17:09:01Z fschild $

t0 = t0(:);
T0 = t0(end)-t0(1); % Interval length
if abs(T0)>eps % Check for zero-length mesh
  t0 = (t0-t0(1))/T0; % Rescaling
  x0 = interp1(t0, x0, data.mesh.tbp)'; % Collection of basepoint values
else
  x0 = repmat(x0(1,:), size(data.mesh.tbp))'; % Collection of basepoint values
end
ka = data.mesh.ka; % Array of warping coefficients
la = 1;            % Lagrange multiplier

sol.u = [x0(:); T0; p0; ka; la];

end

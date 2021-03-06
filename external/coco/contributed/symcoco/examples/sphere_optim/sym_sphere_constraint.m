function varargout=sym_sphere_constraint(action,varargin)
%% Automatically generated with matlabFunction
%#ok<*DEFNU,*INUSD,*INUSL>

switch action
  case 'nargs'
   varargout{1}=2;
   return
  case 'nout'
   varargout{1}=1;
   return
  case 'argrange'
   varargout{1}=struct('x',1:1,'p',2:4);
   return
  case 'argsize'
   varargout{1}=struct('x',1,'p',3);
   return
  case 'vector'
   varargout{1}=struct('x',1,'p',1);
   return
  case 'extension'
   varargout{1}='rhs';
   return
  case 'maxorder'
   varargout{1}=2;
   return
end
nout=1;
order=varargin{1};
f=str2func(sprintf('sym_sphere_constraint_%s_%d',action,order));
varargout=cell(nout,1);
[varargout{:}]=f(varargin{2:end});




function out1 = sym_sphere_constraint_rhs_0(x,p1,p2,p3,x_dev,p1_dev,p2_dev,p3_dev)
%SYM_SPHERE_CONSTRAINT_RHS_0
%    OUT1 = SYM_SPHERE_CONSTRAINT_RHS_0(X,P1,P2,P3,X_DEV,P1_DEV,P2_DEV,P3_DEV)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    02-Feb-2020 22:09:59

out1 = p1.^2+p2.^2+p3.^2+x.^2-1.0;


function out1 = sym_sphere_constraint_rhs_1(x,p1,p2,p3,x_dev,p1_dev,p2_dev,p3_dev)
%SYM_SPHERE_CONSTRAINT_RHS_1
%    OUT1 = SYM_SPHERE_CONSTRAINT_RHS_1(X,P1,P2,P3,X_DEV,P1_DEV,P2_DEV,P3_DEV)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    02-Feb-2020 22:09:59

out1 = p1.*p1_dev.*2.0+p2.*p2_dev.*2.0+p3.*p3_dev.*2.0+x.*x_dev.*2.0;


function out1 = sym_sphere_constraint_rhs_2(x,p1,p2,p3,x_dev,p1_dev,p2_dev,p3_dev)
%SYM_SPHERE_CONSTRAINT_RHS_2
%    OUT1 = SYM_SPHERE_CONSTRAINT_RHS_2(X,P1,P2,P3,X_DEV,P1_DEV,P2_DEV,P3_DEV)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    02-Feb-2020 22:09:59

out1 = p1_dev.^2.*2.0+p2_dev.^2.*2.0+p3_dev.^2.*2.0+x_dev.^2.*2.0;


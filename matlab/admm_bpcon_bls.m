function [xsol, z] = admm_bpcon_bls(y, epsilon, A, At, Psi, Psit, param)
%
% sol = admm_bpcon_bls(y, epsilon, A, At, Psi, Psit, param) solves:
%
%   min ||Psit x||_1   s.t.  ||y-A x||_2 <= epsilon
%
%
% Using a proximal ADMM that uses a backtracking line search method to
% adapt the primal step size.
% y contains the measurements. A is the forward measurement operator and
% At the associated adjoint operator. Psit is a sparfying transform and Psi
% its adjoint. PARAM a Matlab structure containing the following fields:
%
%   General parameters:
% 
%   - verbose: 0 no log, 1 print main steps, 2 print all steps.
%
%   - max_iter: max. nb. of iterations (default: 200).
%
%   - rel_obj: minimum relative change of the objective value (default:
%   1e-4)
%       The algorithm stops if
%           | ||x(t)||_1 - ||x(t-1)||_1 | / ||x(t)||_1 < rel_obj,
%       where x(t) is the estimate of the solution at iteration t.
%
%   - gamma: control the converge speed (default: 1e-2).
% 
% 
%   Proximal L1 operator:
%
%   - rel_obj_L1: Used as stopping criterion for the proximal L1
%   operator. Min. relative change of the objective value between two
%   successive estimates.
%
%   - max_iter_L1: Used as stopping criterion for the proximal L1
%   operator. Maximun number of iterations.
% 
%   - param.nu_L1: bound on the norm^2 of the operator Psi, i.e.
%       ||Psi x||^2 <= nu * ||x||^2 (default: 1)
% 
%   - param.tight_L1: 1 if Psit is a tight frame or 0 if not (default = 1)
% 
%   - param.weights: weights (default = 1) for a weighted L1-norm defined
%       as sum_i{weights_i.*abs(x_i)}
%           
%
% Author: Rafael Carrillo
% E-mail: rafael.carrillo@epfl.ch
% Date: Jun. 13, 2015
%

% Optional input arguments
if ~isfield(param, 'verbose'), param.verbose = 1; end
if ~isfield(param, 'rel_obj'), param.rel_obj = 1e-4; end
if ~isfield(param, 'max_iter'), param.max_iter = 200; end
if ~isfield(param, 'gamma'), param.gamma = 1e-2; end

% Input arguments for prox L1 function
param_L1.Psi = Psi; 
param_L1.Psit = Psit; 
if isfield(param, 'nu_L1')
    param_L1.nu = param.nu_L1;
end
if isfield(param, 'tight_L1')
    param_L1.tight = param.tight_L1;
end
if isfield(param, 'max_iter_L1')
    param_L1.max_iter = param.max_iter_L1;
end
if isfield(param, 'rel_obj_L1')
    param_L1.rel_obj = param.rel_obj_L1;
else
    param_L1.rel_obj = param.rel_obj;
end
if isfield(param, 'weights')
    param_L1.weights = param.weights;
else
    param_L1.weights = 1;
end
if isfield(param, 'pos_L1')
    param_L1.pos = param.pos_L1;
else
    param_L1.pos = 0;
end
if isfield(param, 'verbose_L1')
    param_L1.verbose = param.verbose_L1;
else
    param_L1.verbose = param.verbose;
end

% Useful functions for the projection
sc = @(z) z*min(epsilon/norm(z(:)), 1); % scaling


%Initializations.

%Initial solution
if isfield(param,'initsol')
    xsol = param.initsol;
else
    xsol = zeros(size(At(y))); 
end

%Initial dual variables
if isfield(param, 'initz')
    z = param.initz;
else
    z = zeros(size(y));
end

%Initial residual
res = A(xsol) - y;

%Flags initialization
dummy = Psit(xsol);
fval = sum(param_L1.weights(:).*abs(dummy(:))); 
flag = 0;

%Step sizes computation

%Step size for the dual variables
beta = 0.9;

%Shrinkage parameter for the primal step size
alpha = 0.9;

%Step size estimate
grad = At(res);
sol = A(grad);
L = norm(sol(:))^2/norm(grad(:))^2;
mu = 1.0/L;

%Smooth part evaluation
qfval = real(z(:)'*res(:)) + 0.5*norm(res(:))^2;

%Main loop. Sequential.
for t = 1:param.max_iter
    
    %Slack variable update
    s = sc(- z - res);
    
    %Gradient formation
    grad = At(z + res + s);
    
    %Gradient decend
    sol = xsol - mu*grad;
    
    %Prox L1 norm (global solution)
    prev_fval = fval;
    [sol, fval] = prox_L1(sol, param.gamma*mu, param_L1);
    
    %Stepsize check
    l1norm = fval;
    q = qfval + real((sol(:)-xsol(:))'*grad(:))...
        + 0.5/mu*norm(sol(:)-xsol(:))^2 + param.gamma*l1norm;
    %Residual
    res = A(sol) - y;
    %Objective function (Lagrangian)
    curr_obj = param.gamma*l1norm + real(z(:)'*(res(:)+s(:)))...
        + 0.5*norm(res(:)+s(:))^2;
    %Reset number of subiterations
    tsub = 0;
    %fprintf(' Lagrangian = %e, Q = %e\n', curr_obj, q);
    %Backtraking line search
    while (curr_obj > q)
        %Backtracking rule
        mu = alpha*mu;
        %Gradient descend step
        sol = xsol - mu*grad;
        %Proximal L1 operator
        [sol, fval] = prox_L1(sol, param.gamma*mu, param_L1);
        %New stepsize check
        l1norm = fval;
        q = qfval + real((sol(:)-xsol(:))'*grad(:))...
            + 0.5/mu*norm(sol(:)-xsol(:))^2 + param.gamma*l1norm;
        %Residual
        res = A(sol) - y;
        curr_obj = param.gamma*l1norm + real(z(:)'*(res(:)+s(:)))...
            + 0.5*norm(res(:)+s(:))^2;
        %Update iter counter
        tsub = tsub + 1;
    end
    
    %Current solution
    xsol = sol;
    
    %Lagrange multipliers update
    z = z + beta*(res + s);
    
    %Smooth part evaluation
    qfval = real(z(:)'*(res(:)+s(:))) + 0.5*norm(res(:)+s(:))^2;
     
    %Check feasibility
    res1 = norm(res(:));
    
    %Check relative change of objective function   
    rel_fval = abs(fval - prev_fval)/fval;
    
    %Log
    if (param.verbose >= 1)
        fprintf('Iter %i\n',t);
        fprintf(' L1 norm = %e, rel_fval = %e\n', ...
            fval, rel_fval);
        fprintf(' epsilon = %e, residual = %e\n', epsilon, res1);
        %fprintf(' number of subiterations: %i\n\n', tsub);
    end
    
    %Global stopping criteria
    if (rel_fval < param.rel_obj && res1 <= epsilon*1.001)
        flag = 1;
        break;
    end
          
end


%Final log
if (param.verbose > 0)
    if (flag == 1)
        fprintf('Solution found\n');
        fprintf(' Objective function = %e\n', fval);
        fprintf(' Final residual = %e\n', res1);
    else
        fprintf('Maximum number of iterations reached\n');
        fprintf(' Objective function = %e\n', fval);
        fprintf(' Relative variation = %e\n', rel_fval);
        fprintf(' Final residual = %e\n', res1);
        fprintf(' epsilon = %e\n', epsilon);
    end
end

end


function sol = sopt_mltb_sdmm_bpcon(y, epsilon, A, At, Psi, Psit, param)
% BPSDMM - Solve BPDN problem using the simultaneous direction method of multipliers.
%
% sol = solve_BPDN(y, A, At, Psi, Psit, PARAM) solves:
%
%   min ||Psit x||_1   s.t.  ||y-A x||_2 < epsilon, x>=0
%
%
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
%   - gamma: control the converge speed (default: 1e-1).
% 
% 
%   Projection onto the L2-ball :
%
%   - param.tight_B2: 1 if A is a tight frame or 0 if not (default = 1)
% 
%   - nu_B2: bound on the norm of the operator A, i.e.
%       ||A x||^2 <= nu * ||x||^2 (default: 1)
%
%   - tol_B2: tolerance for the projection onto the L2 ball:
%       epsilon/(1-tol) <= ||y - A z||_2 <= epsilon/(1+tol)
%    (default: 1e-3)
%
%   - max_iter_B2: max. nb. of iterations for the projection onto the L2
%   ball (default 200).
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
% 
% Author: Rafael Carrillo
% E-mail: rafael.carrillo@epfl.ch
% Date: Apr. 1, 2012
%

% Optional input arguments
if ~isfield(param, 'verbose'), param.verbose = 1; end
if ~isfield(param, 'rel_obj'), param.rel_obj = 1e-4; end
if ~isfield(param, 'max_iter'), param.max_iter = 200; end
if ~isfield(param, 'gamma'), param.gamma = 1e-2; end
if ~isfield(param, 'max_iter_cg'), param.max_iter_cg = 20; end
if ~isfield(param, 'tol_cg'), param.tol_cg = 1e-6; end
if ~isfield(param, 'weights'), param.weights = 1; end

% Useful functions for the projection
sc = @(z) z*min(epsilon/norm(z(:)), 1); % scaling
soft = @(z, T) sign(z).*max(abs(z)-T, 0); %soft thresholding

% Initialization
iter = 1; prev_norm = 0;

if isfield(param, 'initsol')
    x3=param.initsol;
    x2=A(x3);
    x1=Psit(x3);
else
    x3=real(At(y));
    x3(x3<0)=0;
    x2=A(x3);
    x1=Psit(x3);  
end


z1=zeros(size(x1));
z2=zeros(size(x2));
z3=zeros(size(x3));

pres1 = 1;
pres2 = 1;
pres3 = 1;
dres1 = 1;
dres2 = 1;
dres3 = 1;

w1 =zeros(size(x1));
w2 =zeros(size(x2));
w3 =zeros(size(x3));

%Linear operator for the cg solver
P = @(x) At(A(x))+ 2*x;

%Initial solution estimate
sol = x3;

% Main loop
while 1
    
    %
    if param.verbose >= 1
        fprintf('Iteration %i:\n', iter);
    end
    
    %Mixing step. Final solution
    px = (Psi(x1-z1)+At(x2-z2)+(x3-z3));
    sol = cgsolver(P,px,param.verbose,param.max_iter_cg,sol,param.tol_cg);
    
    % Global stopping criterion
    s1 = Psit(sol);
    curr_norm = sum(param.weights(:).*abs(s1(:)));    
    rel_norm = abs(curr_norm - prev_norm)/curr_norm;
    s2 = A(sol); 
    res = norm(y(:) - s2(:), 2);
    if param.verbose >= 1
        fprintf('  ||x||_1 = %e, rel_norm = %e,\n', ...
            curr_norm, rel_norm);
        fprintf('  epsilon = %e,||y-Ax||_2 = %e\n', ...
            epsilon, res);
        fprintf('  Primal residual: e1 = %e, e2 = %e, e3 = %e\n',...
             pres1, pres2, pres3);
        fprintf('  Dual residual: r1 = %e, r2 = %e, r3 = %e\n',...
             dres1, dres2, dres3);
    end
    
    if (rel_norm < param.rel_obj)&&(res<=epsilon)
    %if (rel_norm < param.rel_obj)
        crit_BPDN = 'REL_NORM';
        break;
    elseif iter >= param.max_iter
        crit_BPDN = 'MAX_IT';
        break;
    end
    
    
    %Proximal L1 operator
    %s1 = Psit(sol);
    x1 = soft(s1 + z1, param.gamma*param.weights);
    z1 = z1 + s1 - x1;
    if param.verbose >= 1
        pres1 = norm(s1(:)-x1(:),2);
        dres1 = norm(x1(:)-w1(:),2);
    end
    
    %Projection onto the L2-ball
    %s2 = A(sol);
    x2 = y + sc(s2 + z2 - y);
    z2 = z2 + s2 - x2;
    if param.verbose >= 1
        pres2 = norm(s2(:)-x2(:),2);
        dres2 = norm(x2(:)-w2(:),2);
    end
    
    %Projection on to the positive orthant
    x3 = real(sol + z3);
    x3(x3<0) = 0;
    z3 = z3 + sol - x3;
    if param.verbose >= 1
        pres3 = norm(sol(:)-x3(:),2);
        dres3 = norm(x3(:)-w3(:),2);
    end
    
    % Update variables
    iter = iter + 1;
    prev_norm = curr_norm;
    w1 = x1;
    w2 = x2;
    w3 = x3;
    
end

% Log
if param.verbose>=1
    % L1 norm
    fprintf('\n Solution found:\n');
    fprintf(' Final L1 norm: %e\n', curr_norm);
    
    % Residual
    dummy = A(sol); res = norm(y(:)-dummy(:), 2);
    fprintf(' epsilon = %e, ||y-Ax||_2=%e\n', epsilon, res);
    
    % Stopping criterion
    fprintf(' %i iterations\n', iter);
    fprintf(' Stopping criterion: %s \n\n', crit_BPDN);
    
end

end
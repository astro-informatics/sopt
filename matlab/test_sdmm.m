clear
addpath data/
addpath src/

stringname='M31.fits';
%stringname='CYGCBEST.fits';
%stringname='M87ABABCPCONV6.fits';

data = fitsread(stringname);
data=flipud(data);
im=im2double(data);
im(im<0)=0;
[Ny,Nx]=size(im);
N = Nx*Ny;

%% Parameters
input_snr = 20; % Noise level (on the measurements)

%% Sampling pattern
p = 5;
sigma_m = pi/2;
rho = 2-(erf(pi/(sigma_m*sqrt(2))))^2;
num_meas1 = floor(p*rho*N);
u1 = sigma_m*randn(num_meas1,1);
v1 = sigma_m*randn(num_meas1,1);

%Discard points outside (-pi,pi)x(-pi,pi)

sf1=find((u1<pi)&(u1>-pi));
sf2=find((v1<pi)&(v1>-pi));
sf=intersect(sf1,sf2);

v=v1(sf);
u=u1(sf);
M = length(u);

clear v1 u1


%% Measurement operator initialization 

%Oversampling factors for nufft
ox = 2;
oy = 2;

%Number of neighbours for nufft
Kx = 8;
Ky = 8;

%Initialize nufft parameters
fprintf('Initializing the NUFFT operator\n\n');
tstart1=tic;
st = nufft_init([v u],[Ny Nx],[Ky Kx],[oy*Ny ox*Nx], [Ny/2 Nx/2]);
tend1=toc(tstart1);
fprintf('Time for the initialization: %e\n\n', tend1);

%Operator functions

A = @(x) nufft(x, st);
At = @(x) nufft_adj(x, st);

%Maximum eigenvalue of operato A^TA
eval = pow_method(A, At, [Ny,Nx], 1e-4, 100, 1);

y0 = A(im);
    
% Add Gaussian i.i.d. noise
%sigma_noise = 10^(-input_snr/20)*norm(im(:))/sqrt(N);
sigma_noise = 10^(-input_snr/20)*norm(y0)/sqrt(M);
noise = (randn(size(y0)) + 1i*randn(size(y0)))*sigma_noise/sqrt(2);
y = y0 + noise;

epsilon = sqrt(M + 2*sqrt(M))*sigma_noise;

%Dirty image
dirty = At(y);
dirty1 = 2*real(dirty)/eval;
%dirty1(dirty1<0) = 0;

y = y/sqrt(eval);
A = @(x) A(x)/sqrt(eval);
At = @(x) At(x)/sqrt(eval);
epsilon = epsilon/sqrt(eval);

%% Sparsity operator definition

%Wavelets parameters
nlevel=4;
dwtmode('per');

% Sparsity operator for SARA

[C1,S1]=wavedec2(dirty1,nlevel,'db1'); 
ncoef1=length(C1);
[C2,S2]=wavedec2(dirty1,nlevel,'db2'); 
ncoef2=length(C2);
[C3,S3]=wavedec2(dirty1,nlevel,'db3'); 
ncoef3=length(C3);
[C4,S4]=wavedec2(dirty1,nlevel,'db4'); 
ncoef4=length(C4);
[C5,S5]=wavedec2(dirty1,nlevel,'db5'); 
ncoef5=length(C5);
[C6,S6]=wavedec2(dirty1,nlevel,'db6'); 
ncoef6=length(C6);
[C7,S7]=wavedec2(dirty1,nlevel,'db7'); 
ncoef7=length(C7);
[C8,S8]=wavedec2(dirty1,nlevel,'db8'); 
ncoef8=length(C8);

clear C1 C2 C3 C4 C5 C6 C7 C8


Psit = @(x) [wavedec2(x,nlevel,'db1')'; wavedec2(x,nlevel,'db2')';...
    wavedec2(x,nlevel,'db3')';wavedec2(x,nlevel,'db4')';...
    wavedec2(x,nlevel,'db5')'; wavedec2(x,nlevel,'db6')';...
    wavedec2(x,nlevel,'db7')'; wavedec2(x,nlevel,'db8')'; x(:)]/sqrt(9); 
Psi = @(x) (waverec2(x(1:ncoef1),S1,'db1')+...
    waverec2(x(ncoef1+1:ncoef1+ncoef2),S2,'db2')+...
    waverec2(x(2*ncoef1+1:2*ncoef1+ncoef2),S3,'db3')+...
    waverec2(x(3*ncoef1+1:3*ncoef1+ncoef2),S4,'db4')+...
    waverec2(x(4*ncoef1+1:4*ncoef1+ncoef2),S5,'db5')+...
    waverec2(x(5*ncoef1+1:5*ncoef1+ncoef2),S6,'db6')+...
    waverec2(x(6*ncoef1+1:6*ncoef1+ncoef2),S7,'db7')+...
    waverec2(x(7*ncoef1+1:7*ncoef1+ncoef2),S8,'db8')+...
    reshape(x(8*ncoef1+1:8*ncoef1+N), [Ny Nx]))/sqrt(9);


% Parameters for BPDN
param1.verbose = 1; % Print log or not
param1.gamma = 9e-4; % Converge parameter
param1.rel_obj = 1e-4; % Stopping criterion for the L1 problem
param1.max_iter = 100; % Max. number of iterations for the L1 problem
param1.max_iter_cg = 50;
param1.tol_cg = 1e-6;

     
%Solve BPDN
tstart2 = tic;
sol = sdmm_bpcon(y, epsilon, A, At, Psi, Psit, param1);
tend2 = toc(tstart2)

sol = real(sol);
sol(sol<0) = 0;

error = im - sol;
SNR = 20*log10(norm(im(:))/norm(error(:)))


residual = At(y - A(sol));
DR = max(sol(:))/(norm(residual(:))/sqrt(N))

% save('results/par_results_1.mat','sol','residual','tend','DR','param1',...
%     'nlevel','SNR','z');

soln = sol/max(sol(:));
dirtyn = dirty1 - min(dirty1(:));
dirtyn = dirtyn/max(dirtyn(:));

figure, imagesc(log10(soln + 1e-4)), colorbar, axis image
figure, imagesc(log10(dirtyn + 1e-3)), colorbar, axis image

figure, imagesc(real(residual)/eval), colorbar, axis image



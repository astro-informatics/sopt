function x = cgsolver(A,b,verbose,nit,initsol,tol)

d=b(:);
x0=initsol(:);
[n1,n2]=size(b);

P = @(x) reshape(A(reshape(x,n1,n2)),n1*n2,1);

[x, flag, relres, iter] = pcg(P,d,tol,nit,[],[],x0);
x=reshape(x,n1,n2);
nb = norm(x,2);

if (verbose >= 1)
    if nb == 0
        fprintf(' Conjugate gradient relative residual: %e\n', 1);
    else
        fprintf(' Conjugate gradient relative residual: %e, iter : %i, flag : %i\n',relres, iter, flag);
    end
end
end
        
   
QP Parameters
========================

regularize_threshold
--------------------------------
Real value >= 1. Default value: -Inf

Ill-conditioning of the BFGS inverse Hessian approximations H may 
cause QP solver to have difficulty in solving either the steering or 
termination QPs.  The BFGS inverse Hessian approximations H can be 
optionally regularized by limiting their condition numbers to 
regularize_threshold.  Note that this regularization is only 
applied to the H matrices appearing in the QPs; the evolving BFGS 
inverse Hessian approximation itself is never regularized. 
NOTE: setting opts.regularize_threshold to inf disables any
regularization (and thus disables even computing the condition
number of H).

regularize_max_eigenvalues
--------------------------------          
Boolean value. Default value: False

If opts.regularize_threshold < inf, then NCVX's default strategy
to regularize the BFGS inverse Hessian approximation H is done by 
raising the smallest magnitude eigenvalues such that the condition 
number of the regularized version of H never exceeds 
opts.regularize_threshold.  This default regularization should also 
help ensure that regularized version of H is numerically positive 
definite, since H may have tiny eigenvalues and in practice, these 
may have the wrong sign numerically (negative), particularly on 
nonsmooth problems.  Alternatively, by setting this option to true, 
NCVX will instead apply regularization by lowering the largest 
eigenvalues of H but note that this mode does not attempt to 
maintain numerical positive definiteness.  Also, if an eigenvalue 
of H is exactly zero, this mode will instead resort to raising the 
smallest eigenvalues of H on that particular iteration of NCVX.


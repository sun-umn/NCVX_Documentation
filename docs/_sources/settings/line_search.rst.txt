Line Search Parameters
========================

wolfe1
----------------
Real value in (0,0.5]. Default value: 1e-4

First weak Wolfe line search parameter, ensuring sufficient 
decrease of the objective/penalty.  

wolfe2
----------------
Real value in [wolfe1,1). Default value: 0.5

Second weak Wolfe line search parameter, ensuring algebraic 
increase in projected gradient.

linesearch_nondescent_maxit
--------------------------------                  
Non-negative integer. Default value: 0

If the computed direction is not numerically a descent direction, 
the line search can still be optionally attempted to see if it gets
"lucky", using up to  linesearch_nondescent_maxit evaluations of 
the penalty/objective function (since there may be numerical issues 
in calculating whether it truly is a descent direction or not).

linesearch_reattempts
--------------------------------                  
Positive integer. Default value: 10

If the line search fails to bracket a minimizer, this may be an
indication that the objective function is unbounded below.  For
constrained problems, it may be that the objective is only unbouded 
below off the feasible set, in which case lower values of
the penalty parameter mu may be necessary for NCVX to find the
feasible region.  For constrained problems, if the line search 
fails to bracket a minimizer, NCVX will reattempt the line search 
with progressively lower values of mu, up to linesearch_reattempts 
times.  See opts.linesearch_c_mu, opts.linesearch_reattempts_x0, 
and opts.linesearch_c_mu_x0.
NOTE: this option is irrelevant for unconstrained problems.

linesearch_reattempts_x0
--------------------------------                  
Positive integer. Default value: 30

The same as linesearch_reattempts but applies only to the first
iteration, where it may beneficial to be more aggressive in
lowering the penalty parameter for line search reattempts.  
NOTE: this option is irrelevant for unconstrained problems.

linesearch_c_mu
--------------------------------
Real value in (0,1). Default value: 0.5

If the line search fails to bracket a minimizer for a constrained 
problem, and linesearch_reattempts > 0, each line search reattempt
will try a progressively smaller penalty parameter, shrinking it by 
another factor of linesearch_c_mu on each reattempt.  See 
opts.linesearch_reattempts, opts.linesearch_reattempts_x0, and 
opts.linesearch_c_mu_x0.
NOTE: this option is irrelevant for unconstrained problems.

linesearch_c_mu_x0
--------------------------------
Real value in (0,1). Default value: 0.5

The same as linesearch_c_mu but applies only to the first
iteration, where it may beneficial to be more aggressive in
lowering the penalty parameter for line search reattempts.
NOTE: this option is irrelevant for unconstrained problems.



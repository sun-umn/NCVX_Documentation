Settings
========

Below listed the key options. For more options, please check the documentation of pygransoOptions.py and 
pygransoOptionsAdvanced.py in the source code.

x0
----------------

n by 1 real numpy array. Default value: rng.standard_normal(size=(n,1))

Initial starting point.  One should pick x0 such that the objective
and constraint functions are smooth at and about x0.  If this is
difficult to ascertain, it is generally recommended to initialize
PyGRANSO at randomly-generated starting points.

mu0
----------------
Positive real value. Default value: 1

Initial value of the penalty parameter. 
NOTE: irrelevant for unconstrained optimization problems.


H0
----------------

n by n real numpy array. Default value: scipy.sparse.eye(n).toarray()

Initial inverse Hessian approximation.  In full-memory mode, and 
if opts.checkH0 is true, PyGRANSO will numerically assert that this
matrix is positive definite.

checkH0
----------------

Boolean value. Default value: True

By default, PyGRANSO will check whether or not H0 is numerically
positive definite (by checking whether or not chol() succeeds).
However, when restarting PyGRANSO from the last iterate of an earlier
run, using soln.H_final (the last BFGS approximation to the inverse
Hessian), soln.H_final may sometimes fail this check.  Set this
option to False to disable it.

opt_tol     
----------------        

Positive real value. Default value: 1e-8

Tolerance for reaching (approximate) optimality/stationarity.
See opts.ngrad, opts.evaldist, and the description of PyGRANSO's 
output argument soln, specifically the subsubfield .dnorm for more
information.

fvalquit
----------------
Positive real value. Default value: -Inf

Quit if objective function drops below this value at a feasible 
iterate (that is, satisfying feasibility tolerances 
opts.viol_ineq_tol and opts.viol_eq_tol).

print_level     
----------------
Integer in {0,1,2,3}. Default value: 1

Level of detail printed to console regarding optimization progress:

0 - no printing whatsoever

1 - prints info for each iteration  

2 - adds additional info about BFGS updates and line searches (TODO)

3 - adds info on any errors that are encountered (TODO)

print_frequency      
----------------          

Positive integer. Default value: 1

Sets how often the iterations are printed.  When set to 1, every
iteration is printed; when set to 10, only every 10th iteration is
printed.  When set to Inf, no iterations are printed, except for
at x0.  Note that this only affects .print_level == 1 printing;
all messages from higher values of .print_level will still be
printed no matter what iteration they occurred on.

print_print_ascii     
----------------          

Boolean value. Default value: False

By default, PyGRANSO's printed output uses the extended character map, 
so nice looking tables can be made.  But if you need to record the output, 
you can restrict the printed output 
to only use the basic ASCII character map

maxit
----------------

Positive integer. Default value: 1000

Max number of iterations.

QPsolver
------------------

String in {'osqp', 'gurobi'}. Default value: 'osqp'

Select the QP solver used in the steering strategy and termination condition.




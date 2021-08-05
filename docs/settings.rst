Settings
========

Below listed the key options. For more options, please check the documentation of pygransoOptions.py and pygransoOptionsAdvanced.py

x0
----------------

n by 1 real numpy array. Default value: rng.standard_normal(size=(n,1))

Initial starting point.  One should pick x0 such that the objective
and constraint functions are smooth at and about x0.  If this is
difficult to ascertain, it is generally recommended to initialize
PyGRANSO at randomly-generated starting points.

mu0
----------------
real, positive value. Default value: 1

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


maxit
----------------

Setting the number of maximum iterations performed in GRANSO.

quadprog_opts.QPsolver
------------------

Default: quadprog

You can set it to be ``quadprog``, ``qpalm``, or ``gurobi``


quadprog_opts.verbose
---------------------

Default: False

When ``False``, the output of QPALM is suppressed



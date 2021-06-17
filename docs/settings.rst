Settings
========

PyGRANSO has a number of settings that will effect its behavior. 

x0
----------------

Initial point

mu0
----------------

Initial penalty parameter value


H0
----------------

Initial value of the (approx) Hessian inverse

Note

To restart GRANSO, we need to set the above three parameters as the final values from previous run.

checkH0
----------------

The user-provided H0 may fail PyGRANSO's initial check to assess whether or not the H0 is positive definite. If it fails this test, the test may be disabled by setting checkH0 to ``false``.

scaleH0
----------------

If one desires to restart PyGRANSO as if it had never stopped (e.g. to continue optimization after it hit its maxit limit), then one must also disable scaling the initial BFGS inverse Hessian approximation on the very first iterate by setting scaleH0 to ``false``. 


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



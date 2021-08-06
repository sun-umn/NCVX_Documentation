Rosenbrock objective function
========

Modified based on GRANSO's example.

2-variable nonsmooth Rosenbrock objective function, subject to simple bound constraints

Reference: Curtis, Frank E., Tim Mitchell, and Michael L. Overton. "A BFGS-SQP method for nonsmooth, nonconvex, constrained optimization and its evaluation using relative minimization profiles." Optimization Methods and Software 32.1 (2017): 148-181.
.. image:: images/Rosenbrock.png
   :width: 600


runExample.py
-----------------

The required input for ``pygranso()`` is ``var_in``, ``parameters`` (optional) and ``opts`` (optional)

1. ``var_in``

   ``vars`` is a python dictionary used for indicate variable name and corresponding matrix dimension. 
   Since ``x1`` and ``x2`` are two scalars here, we set both of their dimensions to ``(1,1)``::

      var_in = {"x1": (1,1), "x2": (1,1)}

2. ``parameters``

   Parameter is not used in this problem.

3. ``opts``

   User-provided options. First initialize a structure for options::

      from pygransoStruct import Options
      opts = Options()

   Then define the options::

     opts.QPsolver = 'osqp'
     opts.maxit = 100
     opts.print_level = 1
     opts.print_frequency = 1
     opts.x0 = np.ones((2,1))

   See :ref:`settings<settings>` for more information.

After specify two values (``parameters`` and ``opts`` are optional), call the main function::

   soln = pygranso(var_in, user_opts = opts)

combinedFunction.py
-----------------

The ``combinedFunction.py`` is used to generate user defined objection function ``f``, 
inequality constraint function ``ci`` and equality constraint function ``ce``.

Notice that we have auto-differentiation feature implemented, so the analytical gradients are not needed.

1. Obtain the (pytorch) tensor form variables from structure ``X_struct``. And require gradient for the autodiff::

        x1 = X_struct.x1
        x2 = X_struct.x2
        x1.requires_grad_(True)
        x2.requires_grad_(True)

2. Obtain parameters from ``runExample.py``: skip

3. Define objective function. Notice that we must use pytorch function::

    # [0,0] means obtain scalar from the torch tensor
    f = (8 * abs(x1**2 - x2) + (1 - x1)**2)[0,0]

4. Define the inequality constraint function. We must initialize ``ci`` as a struct, 
   then assign different constraints as ``ci.c1``, ``ci.c2``, ``ci.c3``...::

      ci = general_struct()
      ci.c1 = (2**0.5)*x1-1  
      ci.c2 = 2*x2-1 

5. Since no inequality constraint required in this problem, we set ``ce`` to ``None``::

      ce = None

6. Return user-defined results::

     return [f,ci,ce]
Spectral Radius Optimization
========

This example is from Curtis, Frank E., Tim Mitchell, and Michael L. Overton. "A BFGS-SQP method for nonsmooth, nonconvex, constrained optimization and its evaluation using relative minimization profiles." Optimization Methods and Software 32.1 (2017): 148-181.


.. image:: images/specR.png
   :width: 600


runExample.py
-----------------

First read the prepared input data from a Matlab file::

    currentdir = os.path.dirname(os.path.realpath(__file__))
    file = currentdir + "/spec_radius_opt_data.mat"
    mat = scipy.io.loadmat(file)
    mat_struct = mat['sys']
    mat_struct = mat_struct[0,0]
    A = torch.from_numpy(mat_struct['A'])
    B = torch.from_numpy(mat_struct['B'])
    C = torch.from_numpy(mat_struct['C'])
    p = B.shape[1]
    m = C.shape[0]

The required input for ``pygranso()`` is ``var_in``, ``parameters`` (optional) and ``opts`` (optional)

1. ``var_in``

   ``vars`` is a python dictionary used for indicate variable name and corresponding matrix dimension. 
   Since ``X`` is a matrix here, we set the dimension to ``(p,m)``::

      var_in = {"X": (p,m) }

2. ``parameters``

   To save the computational sources, we recommend to generate all the required paramters in the ``runExample.py`` and 
   pass it to ``combinedFunction.py.`` through function ``pygranso()``.

   .. warning::
      All non-scalar parameters should be Pytorch tensor
   
   First initialize a structure for parameters::

      from pygransoStruct import Parameters
      parameters = Parameters()

   Then define the parameters::

     parameters = Parameters()
     parameters.A = A
     parameters.B = B
     parameters.C = C
     parameters.stability_margin = 1

3. ``opts``

   User-provided options. First initialize a structure for options::

      from pygransoStruct import Options
      opts = Options()

   Then define the options::

     opts.QPsolver = 'osqp' 
     opts.maxit = 200
     opts.x0 = np.zeros((p*m,1))
     opts.print_level = 1
     opts.print_frequency = 1

   See :ref:`settings<settings>` for more information.

After specify all three values (``parameters`` and ``opts`` are optional), call the main function::

   soln = pygranso(vars,parameters,opts)

combinedFunction.py
-----------------

The ``combinedFunction.py`` is used to generate user defined objection function ``f``, 
inequality constraint function ``ci`` and equality constraint function ``ce``.

Notice that we have auto-differentiation feature implemented, so the analytical gradients are not needed.

1. Obtain the (pytorch) tensor form gradients from structure ``X``. And require gradient for the autodiff::

      q = X.q
      q.requires_grad_(True)

2. Obtain parameters from ``runExample.py``::

      m = parameters.m
      Y = parameters.Y

3. Define objective function. Notice that we must use pytorch function::

      qtY = q.t() @ Y
      f = 1/m * torch.norm(qtY, p = 1)

4. Since no inequality constraint required in this problem, we set ``ci`` to ``None``::

      ci = None   

5. Define the equality constraint function. We must initialize ``ce`` as a struct, 
   then assign different as ``ce.c1``, ``ce.c2``, ``ce.c3``...::

      from pygransoStruct import general_struct
      ce = general_struct()
      ce.c1 = q.t() @ q - 1

6. Return user-defined results::

     return [f,ci,ce]
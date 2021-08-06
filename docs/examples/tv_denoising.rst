Generalized LASSO
========

Generalized LASSO: total variation denoising

Reference: Boyd, Stephen, Neal Parikh, and Eric Chu. Distributed optimization and statistical learning via the alternating direction method of multipliers. Now Publishers Inc, 2011.

.. image:: images/tvDenoising.png
   :width: 600


runExample.py
-----------------

The required input for ``pygranso()`` is ``var_in``, ``parameters`` (optional) and ``opts`` (optional)

1. ``var_in``
   
   ``var_in`` is a python dictionary used for indicate variable name and corresponding matrix dimension. 
   Since ``x`` is a vector here, we set the dimension to ``(n,1)``::

      n = 80
      var_in = {"x": (n,1)}

2. ``parameters``

   To save the computational sources, we recommend to generate all the required paramters in the ``runExample.py`` and 
   pass it to ``combinedFunction.py.`` through function ``pygranso()``.

   .. warning::
      All non-scalar parameters should be Pytorch tensor
   
   First initialize a structure for parameters::

      from pygransoStruct import Parameters
      parameters = Parameters()

   Then define the parameters::

      eta = 0.5 # parameter for penalty term
      torch.manual_seed(1)
      b = torch.rand(n,1)
      pos_one = torch.ones(n-1)
      neg_one = -torch.ones(n-1)
      F = torch.zeros(n-1,n)
      F[:,0:n-1] += torch.diag(neg_one,0) 
      F[:,1:n] += torch.diag(pos_one,0)
      parameters.F = F.double()  # double precision requireed in torch operations 
      parameters.b = b
      parameters.eta = np.double(eta) # double precision requireed in torch operations 

3. ``opts``

   User-provided options. First initialize a structure for options::

      from pygransoStruct import Options
      opts = Options()

   Then define the options::

      opts.QPsolver = 'osqp' 
      opts.maxit = 1000
      opts.x0 = np.ones((n,1))
      opts.print_level = 1
      opts.print_frequency = 10

   See :ref:`settings<settings>` for more information.

After specify all three values (``parameters`` and ``opts`` are optional), call the main function::

   soln = pygranso(var_in,parameters,opts)

combinedFunction.py
-----------------

The ``combinedFunction.py`` is used to generate user defined objection function ``f``, 
inequality constraint function ``ci`` and equality constraint function ``ce``.

Notice that we have auto-differentiation feature implemented, so the analytical gradients are not needed.

1. Obtain the (pytorch) tensor form variables from structure ``X_struct``. And require gradient for the autodiff::

      x = X_struct.x
      x.requires_grad_(True)

2. Obtain parameters from ``runExample.py``::

      b = parameters.b
      F = parameters.F
      eta = parameters.eta

3. Define objective function. Notice that we must use pytorch function::

      f = (x-b).t() @ (x-b)  + eta * torch.norm( F@x, p = 1)

4. Since no equality constraint required in this problem, we set ``ci`` to ``None``::

      ci = None   

5. Since no inequality constraint required in this problem, we set ``ci`` to ``None``::

      ce = None

6. Return user-defined results::

     return [f,ci,ce]
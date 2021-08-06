Robust PCA
========

This example is based on Bai, Yu, Qijia Jiang, and Ju Sun. "Subgradient descent learns orthogonal dictionaries." arXiv preprint arXiv:1810.10702 (2018).


.. image:: images/robustPCA.png
   :width: 600


runExample.py
-----------------

The required input for ``pygranso()`` is ``var_in``, ``parameters`` (optional) and ``opts`` (optional)

1. ``var_in``
   
  ``var_in`` is a python dictionary used for indicate variable name and corresponding matrix dimension. 
   Since ``M`` and ``S`` are two matrices here, we set both of their dimension to ``(d1,d2)``::

      d1 = 7
      d2 = 8
      var_in = {"M": (d1,d2),"S": (d1,d2)}

2. ``parameters``

   To save the computational sources, we recommend to generate all the required paramters in the ``runExample.py`` and 
   pass it to ``combinedFunction.py.`` through function ``pygranso()``.

   .. warning::
      All non-scalar parameters should be Pytorch tensor
   
   First initialize a structure for parameters::

      from pygransoStruct import Parameters
      parameters = Parameters()

   Then define the parameters::

      torch.manual_seed(1)
      parameters.eta = .5
      parameters.Y = torch.randn(d1,d2)

3. ``opts``

   User-provided options. First initialize a structure for options::

      from pygransoStruct import Options
      opts = Options()

   Then define the options::
      
      opts.x0 = np.ones((2*d1*d2,1))

   See :ref:`settings<settings>` for more information.

After specify all three values (``parameters`` and ``opts`` are optional), call the main function::

   soln = pygranso(var_in,parameters,opts)

combinedFunction.py
-----------------

The ``combinedFunction.py`` is used to generate user defined objection function ``f``, 
inequality constraint function ``ci`` and equality constraint function ``ce``.

Notice that we have auto-differentiation feature implemented, so the analytical gradients are not needed.

1. Obtain the (pytorch) tensor form variables from structure ``X_struct``. And require gradient for the autodiff::

      M = X_struct.M
      S = X_struct.S
      M.requires_grad_(True)
      S.requires_grad_(True)

2. Obtain parameters from ``runExample.py``::

      eta = parameters.eta
      Y = parameters.Y

3. Define objective function. Notice that we must use pytorch function::

      f = torch.norm(M, p = 'nuc') + eta * torch.norm(S, p = 1)

4. Since no inequality constraint required in this problem, we set ``ci`` to ``None``::

      ci = None   

5. Define the equality constraint function. We must initialize ``ce`` as a struct, 
   then assign different constraints as ``ce.c1``, ``ce.c2``, ``ce.c3``...::

      from pygransoStruct import general_struct
      ce = general_struct()
      ce.c1 = M + S - Y

6. Return user-defined results::

     return [f,ci,ce]
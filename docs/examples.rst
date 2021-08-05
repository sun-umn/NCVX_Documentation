Examples
========

There are two required input files to use PyGRANSO, ``runExample.py`` and ``combinedFunction.py.``
Please do not change the name of two required files as it was used in the main algorithm.



Dictionary Learning
-----------------

This example is based on Bai, Yu, Qijia Jiang, and Ju Sun. "Subgradient descent learns orthogonal dictionaries." arXiv preprint arXiv:1810.10702 (2018).

.. image:: images/DictL.png
   :width: 600

where q is a n by 1 vector, Y is a n by m matrix. m = 10*n^2.

In the given exampple, we set dimension n = 30.

runExample.py
============================

The required input for ``pygranso()`` is ``vars``, ``parameters`` (optional) and ``opts`` (optional)

1. ``vars``
   
   In the example, we set dimension::

      n = 30.
   
   ``vars`` is a python dictionary used for indicate variable name and corresponding matrix dimension. 
   Since ``q`` is a vector here, we set the dimension to ``(n,1)``::

      vars = {"q": (n,1)}

2. ``parameters``

   To save the computational sources, we recommend to generate all the required paramters in the ``runExample.py`` and 
   pass it to ``combinedFunction.py.`` through function ``pygranso()``.

   .. warning::
      All non-scalar parameters should be Pytorch tensor
   
   First initialize a structure for parameters::

      from pygransoStruct import Parameters
      parameters = Parameters()

   Then define the parameters::

      m = 10*n**2   # sample complexity
      theta = 0.3   # sparsity level
      Y = norm.ppf(np.random.rand(n,m)) * (norm.ppf(np.random.rand(n,m)) <= theta)  # Bernoulli-Gaussian model
      parameters.Y = torch.from_numpy(Y) 
      parameters.m = m

3. ``opts``

   User-provided options. First initialize a structure for options::

      from pygransoStruct import Options
      opts = Options()

   Then define the options::
   
      opts.QPsolver = 'osqp' 
      opts.maxit = 10000
      # User defined initialization. 
      np.random.seed(1)
      x0 = norm.ppf(np.random.rand(n,1))
      x0 /= la.norm(x0,2)
      opts.x0 = x0
      opts.opt_tol = 1e-6
      opts.fvalquit = 1e-6
      opts.print_level = 1
      opts.print_frequency = 10

   See :ref:`settings<Settings>` for more information.

LASSO
---------------

TODO


Robust PCA
-----------------

TODO


Constrained Deep Learning
-----------------

TODO

.. math::

   (a + b)^2  &=  (a + b)(a + b) \\
              &=  a^2 + 2ab + b^2
             
 
.. math::
   :nowrap:

   \begin{eqnarray}
      y    & = & ax^2 + bx + c \\
      f(x) & = & x^2 + 2xy + y^2
   \end{eqnarray}
   
   
.. math:: e^{i\pi} + 1 = 0
   :label: euler

Euler's identity, equation :eq:`euler`, was elected one of the most
beautiful mathematical formulas.

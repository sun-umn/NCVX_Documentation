Home
=======================================

NCVX (NonConVeX) is a user-friendly and scalable python package for solving general 
nonconvex, especially nonsmooth and constrained problems.  The initial release of NCVX contains the solver PyGRANSO, a PyTorch-enabled port of `GRANSO <http://www.timmitchell.com/software/GRANSO/>`_ incorporating auto-differentiation, GPU acceleration, tensor input, and support for new QP solvers. As a highlight, PyGRANSO can solve general constrained deep learning problems, the first of its kind. 

NCVX Home Page: https://ncvx.org

Our paper is available at https://arxiv.org/abs/2111.13984. 

Get the Code
-------------

The source code is available in the `PyGRANSO Repository <https://github.com/sun-umn/PyGRANSO>`_. 

Update Logs
-----------------

**Version: 1.1.0 --- 2022-02-20**

   * Description: major fixes and improvements.

   * Fixed: Avoid gradient accumulating in deep learning problem; Prevent memory leak problem when using torch tensor. See ex6 perceptual attack.

   * Changed: Update format of user-defined variables when using pygranso interface.

   * Packaging: Publish pygranso package on Pypi.

   * Added: ex 10 dictionary learning with torch.nn module; ex 11 orthogonal recurrent neural networks.

**Version: 1.0.0 --- 2021-12-27**

   * Description: initial public release of PyGRANSO.

   * Main features: auto-differentiation, GPU acceleration, tensor input, scalable QP solver, and zero dependency on proprietary packages. Multiple new examples added.


Contents
--------

.. toctree::
   :maxdepth: 1
   
   intro
   install
   settings/index
   examples/index
   mistakes
   jusun
   citation

Acknowledgements
----------------------

We would like to thank `Frank E. Curtis <https://coral.ise.lehigh.edu/frankecurtis/>`_  and `Michael L. Overton <https://cs.nyu.edu/~overton/>`_ for their involvement in creating the BFGS-SQP algorithm that is implemented in the software package `GRANSO <http://www.timmitchell.com/software/GRANSO/>`_. This work was supported by UMII Seed Grant Program and NSF CMMI 2038403.

Contact
----------------------

For questions or bug reports, please either:
    * raise issues in the `PyGRANSO Repository <https://github.com/sun-umn/PyGRANSO>`_ or
    
    * send an email to:
  
        * Buyun Liang (liang664 an_at_symbol umn a_dot_symbol edu)
        * Tim Mitchell (tim an_at_symbol timmitchell a_dot_symbol com)
        * Ju Sun (jusun an_at_symbol umn a_dot_symbol edu)

Also, we are always looking for contributors and collaborators.
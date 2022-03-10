Home
=======================================

.. raw:: html

    <a  href="https://github.com/sun-umn/NCVX"><img alt="_images/NCVX_logo.png" src="_images/NCVX_logo.png" style="width: 500px;" /></a><br> <br> 

NCVX Package
-------------

**NCVX (NonConVeX)** is a user-friendly and scalable python software package targeting general nonsmooth NCVX problems with nonsmooth constraints. **NCVX** is being developed by `GLOVEX <https://glovex.umn.edu/>`_ at the Department of Computer Science & Engineering, University of Minnesota, Twin Cities. 

Our paper is available at https://arxiv.org/abs/2111.13984. 

The initial release of **NCVX** contains the solver **PyGRANSO**, a PyTorch-enabled port of `GRANSO <http://www.timmitchell.com/software/GRANSO/>`_ incorporating auto-differentiation, GPU acceleration, tensor input, and support for new QP solvers. As a highlight, **PyGRANSO** can solve general constrained deep learning problems, the first of its kind. 

.. raw:: html

    <a  href="https://github.com/sun-umn/PyGRANSO"><img alt="_images/PyGRANSO_logo_banner.png" src="_images/PyGRANSO_logo_banner.png" style="width: 600px;" /></a><br> <br> 


.. raw:: html

    <b>PyGRANSO: A PyTorch-enabled port of GRANSO with auto-differentiation</b> 



Get the Code
-------------

The source code of NCVX Package is available in the `NCVX Repository <https://github.com/sun-umn/NCVX>`_. 

The source code of PyGRANSO Solver is available in the `PyGRANSO Repository <https://github.com/sun-umn/PyGRANSO>`_. 

Update Logs
-----------------

**Version: 1.2.0 --- 2022-03-XX (In development)**

   * Description: major fixes and improvements on LBFGS and Steering Strategy.

   * Fixed: Reducing memory usage for LBFGS. Now PyGRANSO can solve problem with ~15k parameters by using 8GB Memory. Improving steering stategy to deal with many constraints. 

   * Improved: improve the performance of ex11 orthogonal constraints on RNN; New suggestion about stationarity and feasibility tolerance, as it depends on problem scaling. 

   * Added: ex 12 perceptual attack on ImageNet images; ex 13 trace optimization with orthogonal constraints; ex 14 unconstrained deep learning with LeNet5; ex 15 logistic regression; ex 16 generic dictionary learning 

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
   forum

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
Installation
============

Steps
-----------------

.. note::
    Setting: Ubuntu 20.04, PyGRANSO v1.0.0

Installing PyGRANSO is simple. Here is a step-by-step instruction:

0. Prerequisite: install Anaconda on your system (recommend: Ubuntu 20.04). Detailed guidance: https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html

1. Download the latest version of PyGRANSO on GitHub (https://github.com/sun-umn/PyGRANSO)

2. Change the *name* and *prefix* in **environment.yml**. 
   
   (GPU and CPU) Simply run::

    conda env create -f environment_cuda.yml
    conda activate pygranso_cuda_env

   (CPU only) Simply run::

     conda env create -f environment_cpu.yml
     conda activate pygranso_cpu_env

3. (GPU and CPU) Run test to make sure the dependency installation is correct::

      python test_cuda.py

   (CPU only) Run test to make sure the dependency installation is correct::
    
      python test_cpu.py

4. Check the :ref:`Examples<examples>` section in the documentation to get started.
    
Dependencies
-----------------

osqp-0.6.2

Python-3.9.7

numpy-1.20.3

scipy-1.7.1

pytorch-1.9.0

Jupyter Notebook-6.4.5

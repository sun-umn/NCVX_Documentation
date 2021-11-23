Installation
============

Steps
-----------------

.. note::
	The current version NCVX is tested on Ubuntu 20.04

Installing NCVX is simple. Here is a step by step plan on how to do it:

1. Download the latest version of NCVX on GitHub (https://github.com/sun-umn/NCVX)

2. Change the *name* and *prefix* in **environment.yml**. Then simply run::

    conda env create -f environment.yml
    conda activate ncvx_env

3. Check the examples page in the documentation and example codes in NCVX package for detailed instruction.

4. Modify the working directory used in example codes.


(Optional) Alternative method for step 2::

    conda create --name ncvx_env
    
    conda activate ncvx_env

    conda install pytorch==1.9.0 torchvision torchaudio cudatoolkit=11.1.1 -c pytorch -c conda-forge

    conda install -c conda-forge osqp
    
    conda install -c conda-forge notebook
    
Dependencies
-----------------

osqp-0.6.2

Python-3.9.7

numpy-1.20.3

scipy-1.7.1

pytorch-1.9.0

Jupyter Notebook-6.4.5

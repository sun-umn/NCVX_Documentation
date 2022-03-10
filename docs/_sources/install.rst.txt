Installation
========================

Steps
-----------------

1. Install `Python >= 3.9 <https://www.python.org/>`_

2. Get the most recent `PyGRANSO package <https://github.com/sun-umn/PyGRANSO>`_ (including examples and requirements file)::

        git clone https://github.com/sun-umn/PyGRANSO.git
        cd PyGRANSO

3.  Install PyGRANSO solver from PyPI::

        pip install pygranso

4.  Install Dependencies from PyPI: 

    OS: **Linux** OR **Windows**; Compute Platform: **CUDA**::

            pip install -r requirements.txt -f https://download.pytorch.org/whl/cu111/torch_stable.html

    OS: **Linux**; Compute Platform: **CPU**::

            pip install -r requirements_linux_cpu.txt -f https://download.pytorch.org/whl/cpu/torch_stable.html

    OS: **Mac** OR **Windows**; Compute Platform: **CPU**::

            pip install -r requirements_cpu.txt
    
5.  (CUDA) Run test to make sure the dependency installation is correct::

           python test_cuda.py

    (CPU) Run test to make sure the dependency installation is correct::

            python test_cpu.py

6. Check the :ref:`Examples<examples>` section in the documentation website to get started.

Dependencies
-----------------

osqp-0.6.2

Python-3.9.7

numpy-1.20.3

scipy-1.7.1

pytorch-1.9.0

Jupyter Notebook-6.4.5

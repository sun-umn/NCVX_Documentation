PyGRANSO New Options
========================

QPsolver
------------------

String in {'osqp'}. Default value: 'osqp'

Select the QP solver used in the steering strategy and termination condition. Currently only OSQP is supported.

torch_device
--------------------------------

torch.device('cpu') OR torch.device('cuda'). Default value: torch.device('cpu')

Choose torch.device used for matrix operation in PyGRANSO.
opts.torch_device = torch.device('cuda') if one wants to use cuda device.

globalAD
--------------------------------

Boolean value. Default value: True

Compute all gradients of objective and constraint functions via auto-differentiation.
In the default setting, user should provide [f,ci,ce] = combined_fn(X).
When globalAD = False, user should provide [f,f_grad,ci,ci_grad,ce,ce_grad] = combined_fn(X). 
Please check the docstring of pygranso.py for more details of setting combined_fn.

double_precision
--------------------------------

Boolean value. Default value: True

Set the floating number formats to be double precision for PyGRANSO solver. If double_precision = False, 
the floating number formats will be single precision.


Experimental Options
========================

.. warning::
    The following options are still in development and may change or be removed in future releases. We don't recommend users use them in current version.

init_step_size     
----------------        

Positive real value. Default value: 1

Initial step size t in line search. Recommend using small value (e.g., 1e-2) for deep learning problems.

linesearch_maxit     
----------------        

Positive integer. Default value: inf

Max number of iterations in line search. Recommend using small value (e.g., 25) for deep learning problem.

is_backtrack_linesearch     
--------------------------------          

Boolean value. Default value: False

By default, NCVX will use weak-Wolfe line search. By enabling this method, the curvature condition will be disabled.

search_direction_rescaling     
--------------------------------          

Boolean value. Default value: False

Rescale the norm of searching direction to be 1. Recommend setting True in deep learning problem. 
Used only when backtracking line search is enabled.

disable_terminationcode_6     
--------------------------------          

Boolean value. Default value: False

Disable termination code 6 to ensure NCVX can always make a movement even if the line search failed. 
Recommend setting True in deep learning problem. Used only when backtracking line search is enabled.

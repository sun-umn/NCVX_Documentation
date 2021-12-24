NCVX New Options
========================

QPsolver
------------------

String in {'osqp'}. Default value: 'osqp'

Select the QP solver used in the steering strategy and termination condition. Currently only OSQP is supported.

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

By default, NCVX will use Weak-Wolfe line search. By enabling this method, the curvature condition will be disabled.

searching_direction_rescaling     
--------------------------------          

Boolean value. Default value: False

Rescale the norm of searching direction to be 1. Recommend setting True in deep learning problem. 
Used only when backtracking line search is enabled.

disable_terminationcode_6     
--------------------------------          

Boolean value. Default value: False

Disable termination code 6 to ensure NCVX can always make a movement even if the line search failed. 
Recommend setting True in deep learning problem. Used only when backtracking line search is enabled.




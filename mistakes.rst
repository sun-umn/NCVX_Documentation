Tips
==================

1. Always remember to modify the directories 
(e.g., *'/home/buyun/Documents/GitHub/NCVX'*) used in tutorials.

2. Please set *device = torch.device('cpu')* or 
do not specify it (default device is CPU), if your device does not support cuda.

3. *comb_fn* and *obj_eval_fn* have reuired format. 
It only allow 1 input argument (we are using *X_struct* in tutorials) and must return 
three values (e.g., *[f,ci,ce]*) for objective value, inequality constraints and equality constraints, respectively.
If there is no inequality constraints or/and equality constraints, please set *ci=None* and/or *ce=None*.

4. Always remember to set *requires_grad_(True)* for each individual 
optimization variable to allow auto-differentiation.

5. Users should try to avoid the use of option *max_it*, since 
NCVX has a reliable stopping criterion.

6. All the generated vector/matrix/tensor data must be in torch tensor 
form with double precision.
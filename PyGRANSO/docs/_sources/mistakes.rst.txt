Tips
==================

1. Always remember to modify the directories 
(e.g., ``'/home/buyun/Documents/GitHub/PyGRANSO'``) used in tutorials.

2. Please set ``device = torch.device('cpu')`` or 
do not specify it (default device is CPU), if your device does not support cuda.

3. ``combined_fn`` has required format. 
It only allows 1 input argument (we are using ``X_struct`` in tutorials) and must return 
three values (e.g., ``[f,ci,ce]``) for objective value, inequality constraints and equality constraints, respectively.
If there are no inequality constraints or/and equality constraints, please set ``ci=None`` or/and ``ce=None``.

Advanced users may provide their own analytical gradients. In this case, ``combined_fn`` should return three values (e.g., ``[f,f_grad,ci,ci_grad,ce,ce_grad]``) for objective value, inequality constraints and equality constraints, and their corresponding gradients, respectively.

4. Users should try to avoid the use of option ``max_it``, since 
NCVX has a reliable stopping criterion.

5. All the generated vector/matrix/tensor data must be in torch tensor 
form with double precision (PyTorch default is single precision).
Tips
==================

1. Always remember to modify the installation directories 
(e.g., ``'/home/buyun/Documents/GitHub/PyGRANSO'``) for the tutorials.

2. Please set ``device = torch.device('cpu')`` or 
do not specify it (default device is CPU) if your device does not support CUDA.

3. ``combined_fn`` has a required format. 
It only allows 1 input argument (we are using ``X_struct`` in tutorials) and must return 
three values (e.g., ``[f,ci,ce]``) for objective value, inequality constraints and equality constraints, respectively.
If there are no inequality constraints or/and equality constraints, one should set ``ci=None`` or/and ``ce=None``.

Advanced users may provide their own analytical gradients. In this case, ``combined_fn`` should return six values (e.g., ``[f,f_grad,ci,ci_grad,ce,ce_grad]``) for objective value, inequality constraints and equality constraints, and their corresponding gradients, respectively.

4. Users should try to avoid the use of option ``max_it``, since 
NCVX has a reliable stopping criterion.

5. All the user-provided data (vector/matrix/tensor) must be in torch 
tensor format. Also, as PyTorch default is single precision, one must explicitly set ``dtype=torch.double`` for the user-provided tensors.
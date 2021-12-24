Introduction
==================

Motivation and Background
----------------------------------

Optimizing nonconvex (NCVX) problems, especially those nonsmooth and constrained, is an essential part of machine learning and deep learning. But it is hard to reliably solve this type of problems without optimization expertise. Existing general-purpose NCVX optimization packages are powerful, but typically cannot handle nonsmoothness. GRANSO is among the first packages targeting NCVX, nonsmooth, constrained problems. However, it has several limitations such as the lack of auto-differentiation and GPU acceleration, which preclude the potential broad deployment by non-experts. To lower the technical barrier for the machine learning community, we revamp GRANSO into a user-friendly and scalable python package named NCVX, featuring auto-differentiation, GPU acceleration, tensor input, scalable QP solver, and zero dependency on proprietary packages. As a highlight, NCVX can solve general constrained deep learning problems, the first of its kind. 



Key Features
------------------
GRANSO is among the first optimization packages that can handle general NCVX, nonsmooth,
constrained problems (Curtis et al., 2017):

.. math::

   \min_{\mathbf{x} \in \mathbb{R}^n} f(\mathbf{x}), \text{ s.t. } c_i(\mathbf{x}) \leq 0, \forall i \in \mathcal{I};\ c_i(\mathbf{x}) = 0, \forall i \in \mathcal{E}

Here, the objective f and constraint functions ci’s are only required to be almost everywhere continuously differentiable. GRANSO is based on quasi-Newton methods with sequential quadratic programming (BFGS-SQP), and has the following advantages:

	(1) Unified Treatment of NCVX problems: no need to distinguish CVX vs NCVX and smooth vs
	nonsmooth problems, similar to typical nonlinear programming packages; 

	(2) Reliable Step Size Rule: specialized methods for nonsmooth problems, such as subgradient and proximal
	methods, often entail tricky step size tuning and require the expertise to recognize the
	structures. By contrast, GRANSO chooses step sizes adaptively via gold
	standard line search; 
	
	(3) Principled Stopping Criterion: GRANSO stops its iteration by
	checking a theory-grounded stationarity condition for nonsmooth problems, whereas specialized
	methods are usually stopped when reaching ad-hoc iteration caps.

However, GRANSO suffers from several practicality limitations. To overcome these and
facilitate practical usage in machine and deep learning, we revamp GRANSO with crucial
enhancements and turn it into our NCVX package, which is based on PyTorch. The limitations
and our corresponding enhancements include:

	(1) GRANSO requires analytical subgradients, whereas NCVX removes 
	this need and performs auto-differentiation; 
	
	(2) GRANSO only supports CPU-based computation, whereas NCVX both CPUs and GPUs to allow massively-parallel
	computation; 
	
	(3) GRANSO defaults variables as vectors, while NCVX allows general tensor
	variables including vectors and matrices; 
	
	(4) GRANSO solves two QP instances per iteration
	and uses MATLAB’s QP solver that hardly scales up. NCVX integrates `OSQP <https://osqp.org/docs/get_started/python.html>`_ that outperforms commercial QP solvers in terms of scalability and speed; 
	
	(5) GRANSO is written in MATLAB, which is proprietary software. All the dependencies of NCVX are
	open-source and non-proprietary. 
	
All these enhancements are crucial for machine learning researchers and practitioners to solve large-scale problems.


Road Map
----------------------------------

Although NCVX already has many powerful features, we plan to further improve it by adding
several major components:

	(1) Symmetric Rank One (SR1): SR1, another major type
	of quasi-Newton methods, allows less stringent step size search and tends to help escape
	from saddle points faster by taking advantage of negative curvature directions;
	
	(2) Stochastic Algorithms: in machine learning, computing with large-scale
	datasets often involves finite sums with huge number of terms, calling for (mini-batch)
	stochastic algorithms for reduced per-iteration cost and better scalability; 
	
	(3) Conic Programming (CP): semidefinite programming and 
	second-order cone programming, special cases of CP, are abundant in machine learning, e.g., kernel machines;
	
	(4) MiniMax Optimization (MMO): MMO is an emerging technique 
	in modern machine learning, e.g., generative adversarial networks (GANs) and multi-agent reinforcement learning.


References
-----------------

Buyun Liang, and Ju Sun. "NCVX: A User-Friendly and Scalable Package for Nonconvex Optimization in Machine Learning." arXiv preprint arXiv:2111.13984 (2021).

Frank E. Curtis, Tim Mitchell, and Michael L. Overton. "A BFGS-SQP method for nonsmooth, nonconvex, constrained optimization and its evaluation using relative minimization profiles." Optimization Methods and Software 32.1 (2017): 148-181.


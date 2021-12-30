Introduction
==================

Motivation and Background
----------------------------------

Optimizing nonconvex (NCVX) problems, especially those that are nonsmooth and constrained, is an essential part of machine learning and deep learning. However, it can be hard to reliably solve such problems without optimization expertise. Existing general-purpose NCVX optimization packages are powerful, but typically cannot handle nonsmoothness. GRANSO is among the first optimization solvers targeting nonsmooth NCVX problems with nonsmooth constraints, but, as it is implemented in MATLAB and requires users to provide gradients, GRANSO is often not a convenient choice in machine learning and deep learning applications. To greatly lower the technical barrier for the machine learning community, we introduce a new software package called NCVX, whose initial release contains the solver PyGRANSO, a PyTorch-enabled port of GRANSO incorporating auto-differentiation, GPU acceleration, tensor input, and support for new QP solvers. PyGRANSO is built on freely available and widely used open-source frameworks, and as a highlight, can solve general constrained deep learning problems, the first of its kind. 



Key Features
------------------
GRANSO is among the first optimization packages that can handle general NCVX, nonsmooth,
constrained problems (Curtis et al., 2017):

.. math::

   \min_{\mathbf{x} \in \mathbb{R}^n} f(\mathbf{x}), \text{ s.t. } c_i(\mathbf{x}) \leq 0, \forall i \in \mathcal{I};\ c_i(\mathbf{x}) = 0, \forall i \in \mathcal{E}

Here, the objective f and constraint functions ci’s are only required to be almost everywhere continuously differentiable. GRANSO is based on quasi-Newton updating with sequential quadratic programming (BFGS-SQP), and has the following advantages:

	#. Unified Treatment of NCVX problems: no need to distinguish CVX vs NCVX and smooth vs nonsmooth problems, similar to typical nonlinear programming packages; 

	#. Reliable Step Size Rule: specialized methods for nonsmooth problems, such as subgradient and proximal methods, often entail tricky step-size tuning and require the expertise to recognize the structures. By contrast, GRANSO chooses step sizes adaptively via gold standard line search; 
	
	#. Principled Stopping Criterion: GRANSO stops its iteration by	checking a theory-grounded stationarity condition for nonsmooth problems, whereas specialized methods are usually stopped when reaching ad-hoc iteration caps.

However, since GRANSO is implemented in MATLAB and expects users to be able to provide gradients,
it is often an impractical choice for machine learning applications.
Typically, GRANSO users must derive gradients analytically and then provide code for these computations,
a process which may require some expert knowledge, is often error-prone, and 
in machine learning, is generally impractical, e.g., for the training of large neural networks.
Furthermore, as part of the MATLAB software ecosystem, 
GRANSO is generally harder for practitioners to integrate it with existing popular machine learning frameworks
and users' own existing toolchains.
To overcome these issues and facilitate both high performance and ease of use in machine and deep learning, 
we introduce a new software package called NCVX, whose initial release contains the solver
PyGRANSO, a PyTorch-enabled port of GRANSO with several new key features:

	#. auto-differentiation of all gradients;

	#. support for both CPU and GPU computations for improved hardware acceleration and massive parallelism;

	#. support for general tensor variables including vectors and matrices (as opposed to the single vector of concatenated optimization variables that GRANSO uses);

	#. integrated support for OSQP and other QP solvers to solve the underlying subproblems in the BFGS-SQP algorithm and compute the stationarity measure on each iteration. In terms of scalability and speed, OSQP generally outperforms commercial QP solvers, and thus provides yet another way to improve optimization performance. 

All of these enhancements are crucial for machine learning researchers and practitioners to solve large-scale problems.

PyGRANSO is built entirely on freely available and widely used open-source frameworks, 
and itself is licensed under the AGPL version 3.


Road Map
----------------------------------

Although NCVX already has many powerful features, we plan to further improve it by adding
several major components:

	#. Symmetric Rank One (SR1): SR1, another major type of quasi-Newton methods, allows less stringent step size search and tends to help escape from saddle points faster by taking advantage of negative curvature directions;
	
	#. Stochastic Algorithms: in machine learning, computing with large-scale datasets often involves finite sums with huge number of terms, calling for (mini-batch) stochastic algorithms for reduced per-iteration cost and better scalability; 
	
	#. Conic Programming (CP): semidefinite programming and second-order cone programming, special cases of CP, are abundant in machine learning, e.g., kernel machines;
	
	#. MiniMax Optimization (MMO): MMO is an emerging technique in modern machine learning, e.g., generative adversarial networks (GANs) and multi-agent reinforcement learning.


References
-----------------

*[1] Buyun Liang, Tim Mitchell, and Ju Sun, NCVX: A User-Friendly and Scalable Package for Nonconvex Optimization in Machine Learning, arXiv preprint arXiv:2111.13984 (2021).* Available at https://arxiv.org/abs/2111.13984

*[2] Frank E. Curtis, Tim Mitchell, and Michael L. Overton, A BFGS-SQP method for nonsmooth, nonconvex, constrained optimization and its evaluation using relative minimization profiles, Optimization Methods and Software, 32(1):148-181, 2017.* Available at https://dx.doi.org/10.1080/10556788.2016.1208749


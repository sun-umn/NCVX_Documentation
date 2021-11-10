Introduction
==================

Motivation and Background
----------------------------------

Mathematical optimization is an indispensable modeling and computational tool for all science and 
engineering fields. Over the past decades, researchers have developed numerous foolproof techniques 
and user-friendly software packages to solve convex optimization problems—a subset of optimization 
problems with benign global structures (Boyd et al., 2004; Grant et al., 2008). These software 
packages have substantially lowered the barrier for non-expert practitioners to access and deploy 
these advanced techniques. However, practical problems are often nonconvex, nonsmooth, and constrained, 
and hence unamenable to convex optimization techniques. A notable family of examples is deep learning 
problems—which underpins the ongoing revolutions in AI and countless scientific and applied fields. 
Reliably solving such problems often entails substantial optimization expertise  (Bagirov et al., 2014), 
and practical problems are becoming increasingly more complex and large-scale that outpace what the existing 
software packages can handle. 

The GRANSO package (http://www.timmitchell.com/software/GRANSO/) is the first numerical optimization package that can handle general nonconvex, 
nonsmooth, constrained optimization problems based on MATLAB  (Curtis et al., 2017). The package is very stable and 
produces meaningful results when other carefully crafted solvers fail. However, several 
limitations of GRANSO preclude its potential broad deployment by general users:  

	1. It only allows vector variables but not matrices or tensors, while the latter two are common 
	computational units in modern optimization problems such as machine/deep learning.   

	2. The default MATLAB quadratic programming solver struggles to scale up to medium- to large-scale 
	problems, which is a bottleneck for scalability. 

	3. GRANSO requires deriving analytic subgradients for the objective and constraint functions, which 
	is challenging and even infeasible, especially in deep learning.  

	4. MATLAB that GRANSO is written in is a proprietary programming language and entails considerable 
	license fees for researchers and developers. 

	5. GRANSO is not able to take the full advantage of modern massively parallel hardware.

Thus, we tackled the severe limitations of GRANSO, and built a user-friendly and scalable python numerical optimization package called \texttt{PyGRANSO} by revamping several key components of GRANSO and translating it into Python. Our main contributions are described in the following sections. 

Key Features
------------------

Below are the key features that makes the PyGRANSO package scalable and user-friendly:

	**Tensor Input** PyGRANSO allows the usage of tensor optimization variables, which is represented in a dictionary structure, where the the key is the name of variables (e.g., x_0,x_1), and the corresponding values are the dimension of tensors (e.g., $[3,32,32],[2,2]$).  

	**QP solvers** We replaced the MATLAB builtin quadratic solver with the OSQP package. The OSQP package is a great alternative to MATLAB’s slow quadratic solver,  and has consistently and significantly outperformed popular commercial solvers in terms of speed and scalability. 


	**Automatic Differentiation** We built the package based on PyTorch which allow automated differentiation. This could remove the pain of deriving analytic subgradients and avoid potential calculation and implementation mistakes. 


	**GPU acceleration** PyGRANSO enables highly optimized and parallelizable matrix/tensor computations that take the full advantage of modern massively parallel hardware, e.g., GPUs, by using PyTorch Framework.


	**Modified Core Algorithms** We modified the BFGS-SQP algorithm by enabling re-scaling searching direction and backtracking line search method, which are commonly used in solving deep learning problems.

Current Limitations
----------------------------------
1. Stochastic algorithm not allowed.

2. No validators for some user provided inputs, such as LBFGS settings, nn_model and device.

Update Logs
-----------------
v1.1.0-alpha: Cleaned code, added L-BFGS, updated tutorials and documentation. 

v1.0.2-alpha: Updated installation guides for Linux and windows users.

v1.0.1-alpha: Updated contirbutions, limitations and acknowledgement sections in docs.

v1.0.0-alpha: Initial release of pygranso. Main features: Python translation, autodifferentiation, GPU-support with PyTorch, matrix/tensor inputs, more powerful solver and several new settings to avoid numerical issues in deep learning problem.

References
-----------------

Frank E. Curtis, Tim Mitchell, and Michael L. Overton. "A BFGS-SQP method for nonsmooth, nonconvex, constrained optimization and its evaluation using relative minimization profiles." Optimization Methods and Software 32.1 (2017): 148-181.

Stephen Boyd, Stephen P Boyd, and Lieven Vandenberghe.Convex optimization. Cambridge university press, 2004

Michael Grant, Stephen Boyd, and Yinyu Ye. Cvx:  Matlab software for disciplined convex programming, 2008

Adil Bagirov, Napsu Karmitsa, and Marko M M ̈akel ̈a.Introduction to Nonsmooth Optimization: theory, practice and software. Springer, 2014

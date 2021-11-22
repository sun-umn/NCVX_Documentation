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

	(1) It only allows vector variables but not matrices or tensors, while the latter two are common 
	computational units in modern optimization problems such as machine/deep learning.   

	(2) The default MATLAB quadratic programming solver struggles to scale up to medium- to large-scale 
	problems, which is a bottleneck for scalability. 

	(3) GRANSO requires deriving analytic subgradients for the objective and constraint functions, which 
	is challenging and even infeasible, especially in deep learning.  

	(4) MATLAB that GRANSO is written in is a proprietary programming language and entails considerable 
	license fees for researchers and developers. 	
	
	(5) GRANSO is not able to take the full advantage 
	of modern massively parallel hardware.



Thus, we tackled the severe limitations of GRANSO, and built a user-friendly and scalable python package called NCVX by revamping several key components of GRANSO and translating it into Python. Our main contributions are described in the following sections. 

Key Features
------------------

Below are the key features that makes the NCVX package scalable and user-friendly:

	**Tensor Input** NCVX allows the usage of tensor optimization variables, which is represented in a dictionary structure, where the the key is the name of variables (e.g., x,y), and the corresponding values are the dimension of tensors (e.g., [3,32,32],[2,2]).  

	**QP solvers** We replaced the MATLAB builtin quadratic solver with the OSQP package. The OSQP package is a great alternative to MATLAB’s slow quadratic solver,  and has consistently and significantly outperformed popular commercial solvers in terms of speed and scalability. 

	**Automatic Differentiation** We build the package based on PyTorch which allow automated differentiation. This could remove the pain of deriving analytic subgradients and avoid potential calculation and implementation mistakes. More importantly, 
	the auto-differentiation is crucial when obtaining analytic gradients is almost impossible in deep learning problems with complicated function forms.


	**GPU acceleration** NCVX enables highly optimized and parallelizable matrix/tensor computations that take the full advantage of modern massively parallel hardware, e.g., GPUs, by using PyTorch Framework.

	**Dependencies** NCVX itself and its all dependencies are open-source, thus no proprietary software is required to use it.

Future Plan
----------------------------------
Despite NCVX has many powerful features, we would like to further improve it by adding several useful features:

	1. **SR1** SR1 could help overcome saddle points and condition issues

	2. **Stochastic Algorithm** A stochastic version algorithm will be used in NCVX for better scalability, since the memory constraint is the bottleneck in solving large scale machine/deep learning problems.

	3. **Conic Programming** Semidefinite programming (SDP), which is a special case of conic optimization problem, is important for machine learning, kernel-machines and SVMs.

	4. **Min-Max Optimization** Minimax optimization is an important technique in machine learning problems, such as generative adversarial networks (GAN) and multi-agent reinforce learning.

Update Logs
-----------------
v1.1.1-alpha: Rename the package from "PyGRANSO" to "NCVX"

v1.1.0-alpha: Cleaned code, added L-BFGS, updated tutorials and documentation. 

v1.0.2-alpha: Updated installation guides for Linux and windows users.

v1.0.1-alpha: Updated contirbutions, limitations and acknowledgement sections in docs.

v1.0.0-alpha: Initial release of PyGRANSO. Main features: Python translation, autodifferentiation, GPU-support with PyTorch, matrix/tensor inputs, more powerful solver and several new settings to avoid numerical issues in deep learning problem.

References
-----------------

Frank E. Curtis, Tim Mitchell, and Michael L. Overton. "A BFGS-SQP method for nonsmooth, nonconvex, constrained optimization and its evaluation using relative minimization profiles." Optimization Methods and Software 32.1 (2017): 148-181.

Stephen Boyd, Stephen P Boyd, and Lieven Vandenberghe.Convex optimization. Cambridge university press, 2004

Michael Grant, Stephen Boyd, and Yinyu Ye. Cvx:  Matlab software for disciplined convex programming, 2008

Adil Bagirov, Napsu Karmitsa, and Marko M M ̈akel ̈a.Introduction to Nonsmooth Optimization: theory, practice and software. Springer, 2014

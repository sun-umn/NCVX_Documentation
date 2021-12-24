Steering Parameters
========================

This part only relevant for constrained problems

steering_l1_model
--------------------------------
Boolean value. Default value: True

Determines whether or not the one norm (the standard choice) or the
infinity norm is used for the total violation measure in steering, 
which in turn affects the predicted violation reduction.  
    
steering_ineq_margin
--------------------------------
Non-negative real value. Default value: 1e-6

Sets the margin of feasibility for problems that only have 
inequality constraints.  For such problems, steering can be 
adaptively enabled instead of applied at every iteration.  When 
the inequality constraints are all at least steering_ineq_margin 
away from being active, steering will be disabled.  Setting
steering_ineq_margin to zero means that steering will only be 
applied when one or more inequality constraints are active ( >= 0)  
while setting steering_ineq_margin to inf means that steering will
be applied on every iteration.
NOTE: this parameter has no effect if equality constraints are 
present and steering will always be enabled every iteration.

steering_maxit
--------------------------------
Positive integer. Default value: 10

If the default steering direction is not predicted to adequately
promote progress towards feasibility, steering_maxit is the max
number of times to iteratively lower the penalty parameter and
recompute a hopefully better search direction which does adequately
promote progress towards feasibility.  Setting this to higher
values may more aggressively lower the penalty parameter per 
NCVX iteration.
    
steering_c_viol
--------------------------------
real value in (0,1). Default value: 0.1

Determines the fraction of predicted violation reduction for a 
search direction to be considered as adequately promoting progress
towards feasibility.  If a search direction's predicted violation 
reduction does not meet this target, the penalty parameter will be 
lowered and a new search direction will be computed.  Setting this 
to higher values may more aggressively lower the penalty parameter 
per NCVX iteration.

steering_c_mu
--------------------------------
real value in (0,1). Default value: 0.9

When steering lowers the penalty parameter in order to compute a 
a search direction which promotes progress towards feasibility, it 
does by progessively lowering the penalty parameter by factors of 
steering_c_mu.  For any given NCVX iteration, the penalty
parameter can be shrunk up to a factor of steering_c_mu to the 
power of steering_maxit.  Setting this to lower values may more 
aggressively lower the penalty parameter per NCVX iteration.


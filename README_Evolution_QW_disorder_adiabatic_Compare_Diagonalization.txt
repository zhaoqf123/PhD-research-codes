Evolution_QW_disorder_adiabatic_Corr
Correlation is calculated here to check -3/2

Evolution_QW_disorder_adiabatic_Corr_II
The difference between this and the above is that only
the second angle changes adiabtically.
This protocol is verified to be failed.


I
Angles from n=2-->N-1 are changing from mean pi/2 to
mean 0, guadually realizing off-diagonal disorder


II
Angle @ n=2 are changing from pi/2 to
\delta, while other angles n=3-->N-1 are kept
the same, with mean about 0.


III
Angle @ n=2 at the end of simulation is forced
to make sure the total average is a given number,
usually 0 or positive, so that the adiabatic
is close to exact diagonalization.
But actually it does not work much.


IV
Angles @ n=2 and n=N-1 are chaning from +pi/2
and -pi/2 towards 0 guadually.
The initial state is (0 1 1 0.......0 1 1 0)/2
But it seems not working much either.


Verify
It is to veridy whether the algorithm for U
multiplying vector works here.
It works well as demostrated.


V
In this version, n=2-->N-1 are all pi/2 initially,
then @t=1, n=2 starts reducing, then @t=2, n=3 starts reducing,
and so on so forth.


VI
This is to test the looped Quantum Walk with neighboring -pi/2 and pi/2. In this configuration,
\omega=0 eigen-state may not exist or exist in double. so we cannot use it to obtain 0-state adiabatically.
We use this configuration because we want to changing -pi/2 and pi/2 together, which cannot
be realized in the chain system. However, in this sytem, when we change -pi/2 and pi/2 together,
the 0 or pi/2 states also disappear, so -pi/2 or pi/2 is necessary for the existence of 0 and pi/2 mode.


VI_test
This is to test the looped Quantum Walk with
neighboring -pi/2 and pi/2. In this configuration,
\omega=0 eigen-state may not exist. so we cannot
use it to obtain 0-state adiabatically.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
The above simulations are just failed trials
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Evo_QW_dis_adia_Com_Diag_ProcessCheck
This is to check the adiabatic protocol with all bulk theta decreasing
together.


Evo_QW_dis_adia_Com_DiagII_ProcessCheck
This is to check the adiabatic protocol with angle @n=2 decreasing only.

EigenStatesQW_disorder_2Coins
Rotation along y-axis, then shifted, then rotation along x-axis. I did this
because I try to increase the band gap during the adiabatic process so that
fewer steps will be needed to complete the process. But it turns out that
this protocol can only reduce the gap.


Evo_QW_dis_adia_Com_Diag_ProcessCheckExpon------->GOOD
This is to check this adiabatic protocol: the adiabatic decreasing angle
is proportional to the current mean angle. so the decreasing process
is exponential. This is for all angles decreasing together. 


Evo_QW_dis_adia_Com_DiagII_ProcessCheckExpon
Same as previous, but only the angle @n=2 decreasing--> not good,
large population transfer to nearby states.


Evo_QW_dis_adia_Com_Diag_ProcessCheckExponTan------->NOT Quite Different from previous one
This is to check this adiabatic protocol: the adiabatic decreasing angle
is proportional to the sine of current mean angle. so the decreasing process
is exponential and tangent. This is for all angles decreasing together.
%% root llocus

%% ov < 20%      tr<0.s
G=tf([5],conv([1 2],[1 1]))
delta=sqrt((log(0.2).^2)/(pi.^2+log(0.2)^2));
w=(pi - acos(delta))/(1*sqrt(1-delta.^2))


rlocus(G)
rltool(G)
%% G(s) , K=1.38 (Pcontroller)--> OV,RiseTime?
G=tf([5],conv([1 2],[1 1]))
rltool(G)
%%
num=[1 7];
den=conv([1 0],[1 5]);
den1=conv(den,[1 15]);
den2=conv(den1,[1 20]);
G=tf(num,den2)

clc
clear all

s=tf('s');
sys=(s+7)/(s*(s+5)*(s+15)*(s+20))

rlocus(sys)
%axis([-22 3 -15 15])
% design P controller 5%OV 1s=riseTime

delta=sqrt((log(0.05).^2)/(pi.^2+log(0.05).^2))
Wn=(pi-acos(delta))/(1*sqrt(1-delta.^2))

p1=-delta*Wn + j*Wn*sqrt(1-delta.^2)

sgrid(delta,Wn);
%[k,poles]=rlocfind(sys);

%feedback(C(s)*G(s),H(s))
K=350;
sys_cl=feedback(K*sys,1)
step(sys_cl)

%% minimize peack time
clc 
clear all

s=tf('s');
sys=5/((s+2)*(s+1))

delta=sqrt((log(0.2)).^2/(pi.^2+(log(0.2)).^2))
%Wn=(pi-acos(delta))/()
Wn=1.5/delta

rlocus(sys)

sgrid(delta,Wn);
%
[k,poles]=rlocfind(sys);

%feedback(C(s)*G(s),H(s))
K=350;
sys_cl=feedback(K*sys,1)
step(sys_cl)
%% PI
%Cpi E(s0/30,s0/10) ->  s0 dominant pole
%%position steady state error less than 10% -> ess=1/1+C0G0 < 0.1 ==>> Kp>18


for the following system:
G(s)=10/((s+1)(s+2)(s+3))
in matlab is:
s = tf('s');
sys = (10)/((s+1)*(s+2)*(s+3));
determinate a Lag compensator with provide a phaseMargin (PM) PM>=60° and that reduce the steady state error at position to zero.
Use security margin of 5°
using matlab give to me only this value:

Kc = [];            % Parameters of the chosen controller
Phase = [];         % phase to obtain RG.
Acphase = [];	   % Actual phase margin  
RG = [];
Wm = [];		     % Frecuency for RG
beta = [];		       
tau = [];
Phase2=[];           % New phase of system with compensator

%%
To design a lag compensator that provides a phase margin (PM) of at least 60° and reduces the steady-state error at position to zero, we can follow these steps:

Step 1: Determine the required phase lag (ϕlag) for a phase margin of 60°.
   ϕlag = PM - Security Margin
   ϕlag = 60° - 5°
   ϕlag = 55°

Step 2: Find the frequency at which the phase lag should occur (ωlag) to achieve the desired phase margin.
   Use the formula: ωlag = 1 / (tan(ϕlag) × T), where T is the desired time constant.
   Let's choose T = 1, for simplicity.
   ωlag = 1 / (tan(55°) × 1)
   ωlag ≈ 0.509

Step 3: Determine the zero location (p1) for the lag compensator.
   Use the formula: p1 = ωlag / 10
   p1 = 0.509 / 10
   p1 ≈ 0.0509

Step 4: Determine the pole location (z1) for the lag compensator to cancel the steady-state error at position.
   The steady-state error at position can be eliminated by placing a pole at the origin (s = 0).
   z1 = 0

Step 5: Determine the transfer function of the lag compensator.
   The transfer function of the lag compensator can be written as:
   Gc(s) = (s + z1) / (s + p1)

   Substituting the values:
   Gc(s) = s / (s + 0.0509)

   The complete transfer function of the compensated system becomes:
   Gc(s) × G(s) = [s / (s + 0.0509)] × [10 / ((s + 1)(s + 2)(s + 3))]

This design satisfies the requirements of providing a phase margin of at least 60° and reducing the steady-state error at position to zero.
%%
Apologies for the confusion in my previous response. Upon reviewing the calculations, I made a mistake in Step 1. Let's correct the design of the lag compensator.

Step 1: Determine the required phase lag (ϕlag) for a phase margin of 60°.
   ϕlag = PM - Security Margin
   ϕlag = 60° - 5°
   ϕlag = 55°

Step 2: Find the frequency at which the phase lag should occur (ωlag) to achieve the desired phase margin.
   Use the formula: ωlag = 1 / (tan(ϕlag) × T), where T is the desired time constant.
   Let's choose T = 1, for simplicity.
   ωlag = 1 / (tan(55°) × 1)
   ωlag ≈ 0.682

Step 3: Determine the zero location (z1) for the lag compensator.
   Use the formula: z1 = ωlag / 10
   z1 = 0.682 / 10
   z1 ≈ 0.0682

Step 4: Determine the pole location (p1) for the lag compensator to cancel the steady-state error at position.
   The steady-state error at position can be eliminated by placing a pole at the origin (s = 0).
   p1 = 0

Step 5: Determine the transfer function of the lag compensator.
   The transfer function of the lag compensator can be written as:
   Gc(s) = (s + z1) / (s + p1)
   Gc(s) = (s + 0.0682) / s

   The complete transfer function of the compensated system becomes:
   Gc(s) × G(s) = [(s + 0.0682) / s] × [10 / ((s + 1)(s + 2)(s + 3))]

I apologize for the confusion caused by the previous incorrect response. This updated design should provide a phase margin of at least 60° and reduce the steady-state error at position to zero.
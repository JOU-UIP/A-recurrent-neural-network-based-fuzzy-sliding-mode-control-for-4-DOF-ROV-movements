%%%%%%%%%%%%%%%%%%%%%%%%%外环控制%%%%%%%%%%%%%%%%%%%%
function [sys, x0, str, ts] = fuzz_ctrl(t, x, u, flag)
switch flag,
    case 0,
        [sys, x0, str, ts] =  mdlInitializeSizes;
    case 3,
        sys = mdlOutputs(t, x, u);
    case {2, 4, 9}
        sys =[];
    otherwise
        error( ['Unhandled flag = ', num2str(flag)] );
end

function [sys, x0, str, ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 0;                                                                                                             
sizes.NumDiscStates = 0;
sizes.NumOutputs = 4;
sizes.NumInputs = 12;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function  sys = mdlOutputs(t, x, u)
global Kp
Kp = diag( [ 20 20 20 20 ] );

Xd = 10*sin(0.1*t);  Yd = 10*cos(0.1*t);  Zd = t;  Psid = pi/4;
dXd = cos(0.1*t);  dYd = -sin(0.1*t);  dZd = 1;  dPsid = 0;
X = u(9);  Y = u(10);  Z = u(11);  Psi = u(12);


nd = [ Xd; Yd; Zd; Psid ];  dnd =[ dXd; dYd; dZd; dPsid ];
ne = [ u(1); u(2); u(3); u(4) ];  int_ne = [ u(5); u(6); u(7); u(8) ];

Sp = ne + Kp*int_ne;
rol = 1;

J = [cos(Psi) -sin(Psi) 0 0;sin(Psi) cos(Psi) 0 0;0 0 1 0;0 0 0 1];                         %雅可比矩阵

v_r = inv(J)*( dnd + Kp*ne ) + inv(J)*rol*Sp;

sys(1) = v_r(1);
sys(2) = v_r(2);
sys(3) = v_r(3);
sys(4) = v_r(4);
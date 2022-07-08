%%%%%%%%%%%%%%%%%%%%%%%%%控制部分%%%%%%%%%%%%%%%%%%%%
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
sizes.NumOutputs = 8;
sizes.NumInputs = 12;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function  sys = mdlOutputs(t, x, u)
global Fai
Fai = [10 0 0 0;
          0 10 0 0;
          0 0 10 0;
          0 0 0 10];
%%%%%%%%%%%%%%%%%%%%%%%%期望位置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xd = u(1);  Yd = u(2);  Zd = u(3);  Psid = u(4);  nd = [Xd Yd Zd Psid]';             %设期望位置为20sint
dXd = cos(0.1*t);  dYd = -sin(0.1*t);  dZd = 1;  dPsid = 0;  dnd = [dXd dYd dZd dPsid]';
ddXd = -0.1*sin(0.1*t);  ddYd = -cos(0.1*t);  ddZd = 0;  ddPsid = 0;  ddnd = [ddXd ddYd ddZd ddPsid]';

%%%%%%%%%%%%%%%%%%%%%%%%实际位置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = u(5);  U = u(6);
Y = u(7);  V = u(8);
Z = u(9);  W = u(10);
Psi = u(11);  R = u(12);
n = [X Y Z Psi]';  dn = [U V W R]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

e = n-nd;  de = dn-dnd;
s = de+Fai*e;

%%%%%%%%%%%%%%%%%%%%%%%%ROV动力学模型%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 10.81; Iz = 0.2;
X_du = -1.0810;  Y_dv = -0.3848;  Z_dw = -0.3848;  N_dr = -0.0075;
Xu = -2.4674;  Yv = -2.4674;  Zw = -2.4674;  Nr = -0.0053014; 
Xu_u = -4.5248;  Yv_v = -4.5248;  Zw_w = -4.5248;  Nr_r = -0.016028;
Wg = 0.16;  B = 0;

M = diag([m-X_du m-Y_dv m-Z_dw Iz-N_dr]);
C = [0 0 0 -(m-Y_dv)*V;0 0 0 -(m-X_du)*U;0 0 0 0;(m-Y_dv)*V -(m-X_du)*U 0 0];
D = -diag([Xu+Xu_u*abs(U) Yv+Yv_v*abs(V) Zw+Zw_w*abs(W) Nr+Nr_r*abs(R)]);
G = [0 0 -(Wg-B) 0]'; 

J = [cos(Psi) -sin(Psi) 0 0;sin(Psi) cos(Psi) 0 0;0 0 1 0;0 0 0 1];                         %雅可比矩阵
dJ = [-sin(Psi) -cos(Psi) 0 0; cos(Psi) -sin(Psi) 0 0; 0 0 0 0; 0 0 0 0];
JT = [inv(J)]';
iJ = inv(J);

M0 = JT*M*iJ;  C0 = JT*(C-M*iJ*dJ)*iJ;  D0 = JT*D*iJ;  G0 = JT*G;
%Model_Uncertianty = [u(13) u(14) u(15) u(16)]';
%%%%%%%%%%%%%%%%%%%%%%%%控制律%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Kd = 15*eye(4);  
Mu = [20 20 20 20];

tol =(C0*dn + D0*dn + G0)+ M0*(Fai*de - ddnd - Kd*s - Mu*sign(s));
f = (C0*dn + D0*dn + G0);

sys(1) = tol(1);
sys(2) = tol(2);
sys(3) = tol(3);
sys(4) = tol(4);
sys(5) = e(1);
sys(6) = e(2);
sys(7) = e(3);
sys(8) = e(4);
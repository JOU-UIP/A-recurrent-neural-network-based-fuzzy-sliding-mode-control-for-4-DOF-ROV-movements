%%%%%%%%%%%%%%%%%%%%%%%%%ROV模型部分%%%%%%%%%%%%%%%%%%%%
function [sys, x0, str, ts] = ROVmodel(t, x, u, flag)
switch flag,
    case 0,
        [sys, x0, str, ts] =  mdlInitializeSizes;
    case 1,
        sys = mdlDerivatives(t, x, u);
    case 3,
        sys = mdlOutputs(t, x, u);
    case {2, 4, 9}
        sys =[];
    otherwise
        error( ['Unhandled flag = ', num2str(flag)] );
end

function [sys, x0, str, ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 8;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 8;
sizes.NumInputs = 12;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [-5 0 -3 0 0 0 pi/2 0];
str = [];
ts = [];

function sys = mdlDerivatives(t, x, u)
tol = [u(1) u(2) u(3) u(4)]';
%%%%%%%%%%%%%%%%%%%%%%%%实际位置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = x(1);  U = x(2);
Y = x(3);  V = x(4);
Z = x(5);  W = x(6);
Psi = x(7); R = x(8);
n = [X Y Z Psi];  dn = [U V W R]'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

J = [cos(Psi) -sin(Psi) 0 0; sin(Psi) cos(Psi) 0 0; 0 0 1 0; 0 0 0 1];                         %雅可比矩阵
dJ = [-sin(Psi) -cos(Psi) 0 0; cos(Psi) -sin(Psi) 0 0; 0 0 0 0; 0 0 0 0];
JT = [inv(J)]';
iJ = inv(J);


M0 = JT*M*iJ;  C0 = JT*(C-M*iJ*dJ)*iJ;  D0 = JT*D*iJ;  G0 = JT*G;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%运动方程求解%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dist = [u(9) u(10) u(11) u(12)]';
S = inv(M0)*(tol - C0*dn - D0*dn - G0 + Dist);

sys(1) = x(2);
sys(2) = S(1);
sys(3) = x(4);
sys(4) = S(2);
sys(5) = x(6);
sys(6) = S(3);
sys(7) = x(8);
sys(8) = S(4);

function  sys = mdlOutputs(t, x, u)

sys(1) = x(1);                                                          %X
sys(2) = x(2);                                                          %U
sys(3) = x(3);
sys(4) = x(4);
sys(5) = x(5);
sys(6) = x(6);
sys(7) = x(7);
sys(8) = x(8);

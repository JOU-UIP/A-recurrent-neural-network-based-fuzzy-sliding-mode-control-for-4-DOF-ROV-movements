%%%%%%%%%%%%%%%%%%%%%%%%%内环控制%%%%%%%%%%%%%%%%%%%%
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
sizes.NumInputs = 16;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function  sys = mdlOutputs(t, x, u)
global Kv
Kv = diag( [10 10 10 10] );
rol2 = 1;

ve = [ u(1); u(2); u(3); u(4) ];  int_ve = [ u(5); u(6); u(7); u(8) ];
dv_r = [ u(9); u(10); u(11); u(12) ];  
U = u(13);  V = u(14);  W = u(15);  R = u(16);  
v = [ U; V; W; R ];

Sv = ve + Kv*int_ve;

%%%%%%%%%%%%%%%%%%%%%%%%ROV动力学模型%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 10.81; Iz = 0.2;
X_du = -1.0810;  Y_dv = -0.3848;  Z_dw = -0.3848;  N_dr = -0.0075;
Xu = -2.4674;  Yv = -2.4674;  Zw = -2.4674;  Nr = -0.0053014; 
Xu_u = -4.5248;  Yv_v = -4.5248;  Zw_w = -4.5248;  Nr_r = -0.016028;
Wg = 0.16;  B = 0;

M = diag([m-X_du m-Y_dv m-Z_dw Iz-N_dr]);
C = [0 0 0 -(m-Y_dv)*V;0 0 0 -(m-X_du)*U;0 0 0 0;(m-Y_dv)*V -(m-X_du)*U 0 0];
D = -diag([Xu+Xu_u*U Yv+Yv_v*V Zw+Zw_w*W Nr+Nr_r*R]);
G = [0 0 -(Wg-B) 0]'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tol = C*v + D*v + M*( dv_r + Kv*ve ) + rol2*2/pi*atan(Sv);

sys(1) = tol(1);
sys(2) = tol(2);
sys(3) = tol(3);
sys(4) = tol(4);
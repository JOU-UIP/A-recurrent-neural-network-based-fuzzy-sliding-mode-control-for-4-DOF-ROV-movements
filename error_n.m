%%%%%%%%%%%%%%%%%%%%%%%%% ‰≥ˆŒª÷√ŒÛ≤Ó%%%%%%%%%%%%%%%%%%%%
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
sizes.NumInputs = 8;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function  sys = mdlOutputs(t, x, u)
Xd = u(1);  Yd = u(2);  Zd = u(3);  Psid = u(4);
X = u(5);  Y = u(6);  Z = u(7);  Psi = u(8);
nd = [ Xd; Yd; Zd; Psid ];  n = [ X; Y; Z; Psi ];
ne = nd - n;

sys(1) = ne(1);
sys(2) = ne(2);
sys(3) = ne(3);
sys(4) = ne(4);
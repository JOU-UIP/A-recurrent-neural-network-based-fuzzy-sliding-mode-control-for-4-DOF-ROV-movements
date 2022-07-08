%%%%%%%%%%%%%%%%%%%%%%%%% ‰≥ˆÀŸ∂»ŒÛ≤Ó%%%%%%%%%%%%%%%%%%%%
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
U_r = u(1);  V_r = u(2);  W_r = u(3);  R_r = u(4);
U = u(5);  V = u(6);  W = u(7);  R = u(8);
v_r = [ U_r; V_r; W_r; R_r ];  
v = [ U; V; W; R ];
ve = v_r - v;

sys(1) = ve(1);
sys(2) = ve(2);
sys(3) = ve(3);
sys(4) = ve(4);

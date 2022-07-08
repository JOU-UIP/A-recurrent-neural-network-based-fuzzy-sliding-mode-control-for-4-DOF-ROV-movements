%%%%%%%%%%%%%%%%%%%%%%%%%ROV∏…»≈%%%%%%%%%%%%%%%%%%%%
function [sys, x0, str, ts] = ROVmodel(t, x, u, flag)
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
sizes.NumInputs = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function  sys = mdlOutputs(t, x, u)
m11 = 9.729; m22 = 6.962; m33 = 6.962; m44 = 0.1925;
Td1 = 0.1*m11 + ( sin(0.1*t)-1 )*rand(1);
Td2 = 0.1*m22 + ( sin(0.1*t)-1 )*rand(1);
Td3 = 0.1*m33 + ( sin(0.1*t)-1 )*rand(1);
Td4 = 0.1*m44 + ( sin(0.1*t)-1 )*rand(1);
sys(1) = Td1;
sys(2) = Td2;
sys(3) = Td3;
sys(4) = Td4;




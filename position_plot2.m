%用于放大
close all;


figure(1);%x
plot(t, x(:,1), 'r', t, x(:,2), '--b', t, x(:,3), '--k',  t,x(:,5), '-.g', t, x(:,4),  ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('x-Position [m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.1, 0.35, 0.2, 0.2]);
plot(t, x(:,1), 'r', t, x(:,2), '--b', t, x(:,3), '--k',  t,x(:,5), '-.g', t, x(:,4),  ':m', 'linewidth', 2), grid; xlim([0, 3]);

figure(2);%y
plot(t, y(:,1), 'r', t, y(:,2), '--b', t, y(:,3), '--k',  t, y(:,5), '-.g', t, y(:,4), ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('y-Position [m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.185, 0.66, 0.2, 0.2]);
plot(t, y(:,1), 'r', t, y(:,2), '--b', t, y(:,3), '--k',  t, y(:,5), '-.g', t, y(:,4), ':m', 'linewidth', 2), grid; xlim([0, 3]);

figure(3);%z
plot(t, z(:,1), 'r', t, z(:,2), '--b', t, z(:,3), '--k',  t, z(:,5), '-.g',t, z(:,4), ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('z-Position [m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.185, 0.66, 0.2, 0.2]);
plot(t, z(:,1), 'r', t, z(:,2), '--b', t, z(:,3), '--k',  t, z(:,5), '-.g',t, z(:,4), ':m', 'linewidth', 2), grid; xlim([0, 0.15]);

figure(4);%psi
plot(t, Psi(:,1), 'r', t, Psi(:,2), '--b', t, Psi(:,3), '--k',  t, Psi(:,5), '-.g',t, Psi(:,4), ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('\Psi-Attitude [m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.2, 0.2, 0.4, 0.3]);
plot(t, Psi(:,1), 'r', t, Psi(:,2), '--b', t, Psi(:,3), '--k',  t, Psi(:,5), '-.g',t, Psi(:,4), ':m', 'linewidth', 1.75), grid; xlim([0, 3]);


figure(5);
plot(t, e(:, 1), '--b', t, e(:, 5), '--k', t, e(:, 13), '-.g', t, e(:, 9), ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('error in x-Position [m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.2, 0.2, 0.4, 0.3]);
plot(t, e(:, 1), '--b', t, e(:, 5), '--k', t, e(:, 13), '-.g', t, e(:, 9),  ':m', 'linewidth', 2), grid; grid; xlim([0, 3]);

figure(6);
plot(t, e(:, 2), '--b', t, e(:, 6), '--k', t, e(:, 14), '-.g', t, e(:, 10),  ':m','linewidth', 1.75), grid; 
xlabel('time(s)'); ylabel('error in y-Position [m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.2, 0.2, 0.4, 0.3]);
plot(t, e(:, 2), '--b', t, e(:, 6), '--k', t, e(:, 14), '-.g', t, e(:, 10),  ':m','linewidth', 2), grid; xlim([0, 3]);

figure(7);
plot(t, e(:, 3), '--b', t, e(:, 7), '--k', t, e(:, 15), '-.g', t, e(:, 11), ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('error in z-Position [m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.2, 0.6, 0.4, 0.3]);
plot(t, e(:, 3), '--b', t, e(:, 7), '--k', t, e(:, 15), '-.g', t, e(:, 11), ':m', 'linewidth', 2), grid; xlim([0, 3]);

figure(8);
plot(t, e(:, 4), '--b', t, e(:, 8), '--k', t, e(:, 16),  '-.g', t,e(:, 12), ':m', 'linewidth', 1.75), grid;
xlabel('time(s)'); ylabel('error in \Psi-Attitude [m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
axes('position', [0.2, 0.2, 0.4, 0.3]);
plot(t, e(:, 4), '--b', t, e(:, 8), '--k', t, e(:, 16),  '-.g', t,e(:, 12), ':m', 'linewidth', 2),grid; xlim([0, 3]);

figure(9);
plot3(x(:,1), y(:,1), z(:,1), 'r', x(:,2), y(:,2), z(:,2), '--b', x(:,3), y(:,3), z(:,3), '--k', x(:,5), y(:,5), z(:,5), '-.g',x(:,4), y(:,4), z(:,4), ':m', -5, -3, 0, '^r', 0.5*(100+10), 10*sin(10), 5+10*sin(10), '^r', 'linewidth', 1.75), grid;
xlabel('x[m]'), ylabel('y[m]'), zlabel('z[m]'),title('Trajectory tracking'); legend('Desired trajectory', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');   
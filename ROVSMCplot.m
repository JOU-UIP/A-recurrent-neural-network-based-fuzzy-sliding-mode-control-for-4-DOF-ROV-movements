   close all;

figure(1);
subplot(221);
plot(t, x(:,1), '--r', t, x(:,2), 'b', t, x(:,3), '--k', t, x(:,5), ':m', t, x(:,4), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('x[m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
subplot(222);
plot(t, y(:,1), '--r', t, y(:,2), 'b', t, y(:,3), '--k', t, y(:,5), ':m', t, y(:,4), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('y[m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
subplot(223);
plot(t, z(:,1), '--r', t, z(:,2), 'b', t, z(:,3), '--k', t, z(:,5), ':m', t, z(:,4), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('z[m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');
subplot(224);
plot(t, Psi(:,1), '--r', t, Psi(:,2), 'b', t, Psi(:,3), '--k', t, Psi(:,5), ':m', t, Psi(:,4), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('\Psi[m]');  legend('Desired position', 'CSMC', 'DSMC', 'BPSMC', 'RFSMC');

figure(2);
plot(t, Dist(:, 1), 'linewidth', 1.5), grid;

figure(4);
subplot(221);
plot(t, tol(:,1), 'b', 'linewidth', 1.5), grid;
xlabel('time(s)'); ylabel('x[N]');  legend('Control input of x');
subplot(222);
plot(t, tol(:,2), 'b', 'linewidth', 1.5), grid;
xlabel('time(s)'); ylabel('y[N]');  legend('Control input of y');
subplot(223);
plot(t, tol(:,3), 'b', 'linewidth', 1.5), grid;
xlabel('time(s)'); ylabel('z[N]');  legend('Control input of z');
subplot(224);
plot(t, tol(:,4), 'b', 'linewidth', 1.5), grid;
xlabel('time(s)'); ylabel('\Psi[N]');  legend('Control input of \psi');

figure(5);
subplot(221);
plot(t, e(:, 1), 'b', t, e(:, 5), '--k', t, e(:, 13), ':m', t, e(:, 9), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('error in x[m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
subplot(222);
plot(t, e(:, 2), 'b', t, e(:, 6), '--k', t, e(:, 14), ':m', t, e(:, 10), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('error in y[m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
subplot(223);
plot(t, e(:, 3), 'b', t, e(:, 7), '--k', t, e(:, 15), ':m', t, e(:, 11), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('error in z[m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');
subplot(224);
plot(t, e(:, 4), 'b', t, e(:, 8), '--k', t, e(:, 16), ':m',t, e(:, 12), '-.g', 'linewidth', 1.25), grid;
xlabel('time(s)'); ylabel('error in \Psi[m]');  legend('CSMC', 'DSMC', 'BPSMC', 'RFSMC');

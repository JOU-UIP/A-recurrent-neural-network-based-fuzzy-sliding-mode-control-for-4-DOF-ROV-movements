
figure(11);
plot(t, tol(:, 1), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-x[N]');  legend('CSMC');

figure(12);
plot(t, tol(:, 2), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-y[N]');  legend('CSMC');

figure(13);
plot(t, tol(:, 3), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-z[N]');  legend('CSMC');

figure(14);
plot(t, tol(:, 4), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-Psi[N]');  legend('CSMC');



figure(21);
plot(t, tol3(:, 1), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-x[N]');  legend('CSMC');

figure(22);
plot(t, tol3(:, 2), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-y[N]');  legend('CSMC');

figure(23);
plot(t, tol3(:, 3), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-z[N]');  legend('CSMC');

figure(24);
plot(t, tol3(:, 4), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-Psi[N]');  legend('CSMC');


figure(31);
plot(t, tol1(:, 1), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-x[N]');  legend('CSMC');

figure(32);
plot(t, tol1(:, 2), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-y[N]');  legend('CSMC');

figure(33);
plot(t, tol1(:, 3), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-z[N]');  legend('CSMC');

figure(34);
plot(t, tol1(:, 4), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-Psi[N]');  legend('CSMC');



figure(41);
plot(t, tol2(:, 1), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-x[N]');  legend('CSMC');

figure(42);
plot(t, tol2(:, 2), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-y[N]');  legend('CSMC');

figure(43);
plot(t, tol2(:, 3), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-z[N]');  legend('CSMC');

figure(44);
plot(t, tol2(:, 4), 'k', 'linewidth', 2.5), grid; xlim([3, 100]);
xlabel('Time(s)'); ylabel('Control input-Psi[N]');  legend('CSMC');
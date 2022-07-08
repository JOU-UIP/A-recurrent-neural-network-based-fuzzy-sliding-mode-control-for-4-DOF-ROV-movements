%%%%%%%%%%%%%%Ä£ºı¿ØÖÆ%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;

a = newfis( 'fuzzy_smc' );

a = addvar( a, 'input', 's', 1/25*[-25, 25] );
a = addmf( a, 'input', 1, 'N', 'trapmf', 1/25*[-25, -25, -3, 0] );
a = addmf( a, 'input', 1, 'Z', 'trimf', 1/25*[-3, 0, 3] );
a = addmf( a, 'input', 1, 'P', 'trapmf', 1/25*[0, 3, 25, 25] );

a = addvar( a, 'output', 'Mu', [-1, 1] );
a = addmf( a, 'output', 1, 'N', 'trapmf', [-1, -1, -0.5, 0] );
a = addmf( a, 'output', 1, 'Z', 'trapmf', [0, 0.1, 0.2, 0.3] );
a = addmf( a, 'output', 1, 'P', 'trapmf', [0, 0.5, 1, 1] );

rulelist = [ 1 3 1 1;
                2 2 1 1;
                3 3 1 1];
            
a = addrule(a, rulelist);
showrule(a);

a1 = setfis( a, 'DefuzzMethod', 'centroid' );
a1 = setfis( a, 'DefuzzMethod', 'lom' );
writefis(a1, 'fsmc');
a2 = readfis('fsmc');
ruleview(a2);

figure(1);  plotmf(a, 'input',1);
figure(2);  plotmf(a, 'output',1);
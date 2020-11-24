%{ 
Name:FUNSHO ADEBARI
Project: Modelling and control of a railway vehicle suspension system
%}

%{ 
Design of an LQR active controller for an Active Suspension System
The simulation of a quarter railway suspension model
%}

clear all

%% Parameters of the system used for the simulation

ms  = 5333;% Sprung Mass (kg) 
mus = 906.5;% Unsprung Mass (kg)
ks  = 430000;% Suspension Stiffness (N/m) 
kus = 2440000;% Wheel stiffness (N/m)
bs  = 20000;% Suspension Inherent Damping coefficient (sec/m)
bus = 40000;% Wheel Inhenrent Damping coefficient (sec/m)


%% System Dynamics for the Active Suspension system.
A = [ 0 1 0 -1 ;
    -ks/ms -bs/ms 0 bs/ms;
      0 0 0 1; 
    ks/mus bs/mus -kus/mus -(bs+bus)/mus];

B = [0  0 ; 
     0 1/ms ; 
    -1  0 ;
    bus/mus -1/mus ];

C = [ 1 0 0 0 ; 
    -ks/ms -bs/ms 0 bs/ms ];


D = [0 0;
     0 0;
     0 0;
     0 0;
     0 0;
     0 1/ms];
%% Controllability
rank(ctrb(A,B))

%% LQR Control law

Q = diag([1760*10^6, 11.6*10^6, 1, 1]);

R = 0.01;

K = lqr( A, B(:,2), Q, R ) 

%% Simulation Initiation/ Time Setting

Sim_Time= 10;

sim('Suspension_model2016a')
% sim('CLEANEDSuspension_model')
%% Plot of Rail Body Viechle Acceleration 
x1 = Acceleration_ACT.time;
y1 = Acceleration_ACT.data;
y2 = Acceleration_PAS.data;

figure (1)
p=plot(x1,y1,'r',x1,y2,'b')
p(1).LineWidth = 1.7;
p(2).LineStyle  = '--';
p(2).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of Sprung mass acceleration') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Acceleration (m/s2)'); 
legend({'Active','Passive'},'FontSize',16,'FontWeight','bold')

print('-f1','Time response of the Sprung mass acceleration','-dpng','-r0')

figure (2)
p=plot(x1,y2,'b')
p(1).LineWidth = 1.7;
grid
title ('\fontsize{17}Time response of Sprung mass acceleration (Passive System)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Acceleration (m/s2)'); 
legend({'Passive'},'FontSize',16,'FontWeight','bold')

print('-f2','Time response of Sprung mass acceleration (Passive System)','-dpng','-r0')
%% Plot of the Suspension Travel 
x2 = Suspension_Travel_ACT.time;
y3 = Suspension_Travel_ACT.data;
y4 = Suspension_Travel_PAS.data;

figure (3)
p=plot(x2,y3,'r',x2,y4,'b')
p(1).LineWidth = 1.7;
p(2).LineStyle  = '--';
p(2).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of the Suspension Travel') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Travel (m)'); 
legend({'Active','Passive'},'FontSize',16,'FontWeight','bold')

print('-f3','Time response of the Suspension Travel','-dpng','-r0')

figure (4)
p=plot(x2,y4,'b')
p(1).LineWidth = 1.7;
grid
title ('\fontsize{17}Time response of the Suspension Travel (Passive System)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Travel (m)'); 
legend({'Passive'},'FontSize',16,'FontWeight','bold')

print('-f4','Time response of the Suspension Travel (Passive System)','-dpng','-r0')
%% Plot of Wheel Deflection
x3 = Deflection_ACT.time;
y5 = Deflection_ACT.data;
y6 = Deflection_PAS.data;

figure (5)
p=plot(x3,y5,'r',x3,y6,'b')
p(1).LineWidth = 1.7;
p(2).LineStyle  = '--';
p(2).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of the Wheel Deflection') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Wheel Deflection (m)'); 
legend({'Active','Passive'},'FontSize',16,'FontWeight','bold')

print('-f5','Time response of the Wheel Deflection','-dpng','-r0')

figure (6)
p=plot(x3,y6,'b')
p(1).LineWidth = 1.7;
grid
title ('\fontsize{17}Time response of the Wheel Deflection (Passive System)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Wheel Deflection (m)'); 
legend({'Passive'},'FontSize',16,'FontWeight','bold')

print('-f6','Time response of the Wheel Deflection (Passive System)','-dpng','-r0')
%% Plots of Body Displacemnets 

% For Passive System
x4 = Displacement_PAS.time;
y7 = Displacement_PAS.data;

figure (7)
p=plot(x4,y7)
p(1).Color  = 'r';
p(1).LineWidth = 1.7
p(2).Color  = 'g';
p(2).LineWidth = 1.7
p(3).Color  = 'b';
grid
title ('\fontsize{17}Time response of the Body Displacements for the Passive System') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Body Displacement (m)'); 
legend({'Sprung mass','Track profile','Unsprung mass'},'FontSize',16,'FontWeight','bold')

print('-f7','Time response of the Body Displacements for the Passive System','-dpng','-r0')
% For Active System
x5 = Displacement_ACT.time;
y8 = Displacement_ACT.data;

figure (8)
p=plot(x5,y8)
p(1).Color  = 'r';
p(2).Color  = 'g';
p(2).LineStyle  = '--';
p(2).LineWidth = 1.7
p(3).Color  = 'b';
grid
title ('\fontsize{17}Time response of the Body Displacements for the Active System') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Displacement (m)');  
legend({'Sprung mass','Track profile','Unsprung mass'},'FontSize',16,'FontWeight','bold')

print('-f8','Time response of the Body Displacements for the Active System','-dpng','-r0')
%% Plot of the Actuator Force
x6 = ACTUATOR_FORCE.time;
y9 = ACTUATOR_FORCE.data;

figure (9)
p=plot(x6,y9,'g')
p(1).LineWidth = 1.7;
grid
title ('\fontsize{17}Time response of the force generated from the actuator') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Force (N)'); 
legend({'Actuator force'},'FontSize',16,'FontWeight','bold')

print('-f9','Time response of the force generated from the actuator','-dpng','-r0')
%% Plot of FILTERED and UNFILTERED Signal 
x7 = FILTERD.time;
y10 = FILTERD.data;
y11= UNFILTERD.data;

figure (10)
p=plot(x7,y10,'r',x7,y11,'b')
p(1).LineStyle  = '--';
p(1).LineWidth = 1.7
p(2).LineWidth = 1.2;
grid
title ('\fontsize{17}Time response of the Rail disturbance Input (RD1)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Disturbance Height(m)'); 
legend({'Filtered','Unfiltered'},'FontSize',16,'FontWeight','bold')

print('-f10','Time response of the Rail disturbance input(RD1)','-dpng','-r0')
%% Plot of Derivative of the FILTERED and UNFILTERED Signal
x8  = FILTERD_DOT.time;
y12 = FILTERD_DOT.data;


figure (11)
p=plot(x8,y12,'g')
p(1).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of the filtered velocity of the Rail Disturbance Input (RD1)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Rail Disturbance Velocity(m/s)'); 
legend({'Filtered response'},'FontSize',16,'FontWeight','bold')

print('-f11','Time response of the filtered velocity of the Rail Disturbance Input (RD1)','-dpng','-r0')

x9 = UNFILTERD_DOT.time;
y13= UNFILTERD_DOT.data;

figure (12)
p=plot(x9,y13,'g')
p(1).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of the unfiltered velocity of the Rail Disturbance Input (RD1)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Rail Disturbance Velocity(m/s)'); 
legend({'Unfiltered response'},'FontSize',16,'FontWeight','bold')

print('-f12','Time response of the unfiltered velocity of the Rail Disturbance Input(RD1)','-dpng','-r0')

figure (13)
subplot(2,1,1);
p=plot(x8,y12,'g')
p(1).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of the filtered velocity of the Rail Disturbance Input (RD1)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Rail Disturbance Velocity(m/s)'); 
legend({'Filtered response'},'FontSize',16,'FontWeight','bold')

subplot(2,1,2);
p=plot(x9,y13,'r')
p(1).LineWidth = 0.8
grid
title ('\fontsize{17}Time response of the unfiltered velocity of the Rail Disturbance Input (RD1)') 
xlabel('\fontsize{20}Time (secs)') 
ylabel('\fontsize{20}Rail Disturbance Velocity(m/s)'); 
legend({'Unfiltered response'},'FontSize',16,'FontWeight','bold')



print('-f13','Time response of the filtered & unfiltered velocity of the Rail Disturbance Input (RD1)','-dpng','-r0')
%% STEP INFORMATION
% Step_Info_of_the_Suspension_Travel_PAS = stepinfo(y4,x2)
% Step_Info_of_the_Suspension_Travel_ACT = stepinfo(y3,x2)
% Step_Info_of_Sprung_mass_acceleration_PAS = stepinfo(y2,x1)
% Step_Info_of_Sprung_mass_acceleration_ACT = stepinfo(y1,x1)
% Step_Info_of_the_Wheel_Deflection_PAS = stepinfo(y6,x3)
% Step_Info_of_the_Wheel_Deflection_ACT = stepinfo(y5,x3)
% Step_Info_of_the_Body_Displacements_PAS = stepinfo(y7,x4)
% Step_Info_of_the_Body_Displacements_ACT = stepinfo(y8,x5)
% Step_Info_of_the_Actuaor_Force = stepinfo(y9,x6)
 
%% BODE Plot
% bode(sys1,'r',sys2,'b--')

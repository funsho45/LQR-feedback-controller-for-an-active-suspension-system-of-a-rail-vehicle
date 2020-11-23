# An LQR feedback controller for an active suspension system of a rail vehicle
Modelling and control of a railway vehicle active suspension system to improve the reduction in vibrations in the vehicle. 

# What is this?
For high-speed railway vehicles, passenger safety is the top priority when boarding a railway vehicle but also ride comfort and the quality of a journey. However, when moving from one location to the next, railway vehicles usually encounter various vibrations and shocks from the tracks, and prolonged exposure to low-frequency vibrations can be harmful and cause health effects for passengers such as discomfort, fatigue and irritation. For actual railway vehicle, the different disturbances and vibrations result in decreased durability of the railway car, which increases maintenance costs and reduces its performance. For the vehicle drivers, low-frequency vibrations are also an issue, but railway handling is also affected by vibrations caused by the railway disturbance, and good handling always demands stiff suspensions in the system to control the vehicle. There is always a compromise between the railway handling of the vehicle and the passengers ride quality when it comes to the conventional suspension system, which is the passive suspension system. To alleviate these problems, this project introduces and an active suspension system with an electrohydraulic actuator to apply a controlled force to control the motion of the railway vehicle body stabilising the system and reducing the vibrations thus, providing a better ride quality for passengers. The control strategy used to control the actuators is a Linear Quadratic Regulator (LQR) feedback controller. 

# Aims and Objectives 

The main aim of this dissertation is to develop a reliable active suspension system for railway vehicle applications that can alienate the harmful low-frequency vibrations caused by railway disturbances and transmitted through the suspension systems and railway vehicle body to the passengers and driver, as well as provide good handling of the vehicle. To achieve this aim, the following objectives must be met:

**1**.	The development of a reliable control strategy for the active suspension system using the LQR method will be laid out, which will also be cost-effective regarding the actuator force. 

**2**.	Develop a state-space model of the suspension system using a quarter model to simulate both the passive and active suspension systems and find appropriate railway vehicle model parameters.

**3**.	Investigate the parameters of the active suspension system that affect the ride comfort and rail handling, which will be it suspension displacement or travel, the railway vehicles body acceleration was sprung mass acceleration and the vehicle’s wheel deflection. The body displacements of the vehicle will also be analysed.

**4**.	Evaluate the performance of both the passive and active suspension system through simulation tests and compare results and analyse the performance change of including an LQR feedback controller.

**5**.	Carry out a robustness assessment to see if the control strategy is robust in different operating conditions such as a different rail disturbance and vehicle parameters such as an increase in the railcar body’s mass.

# Method

The LQR controller designed will enable the active suspension system to dynamically change in different operating conditions compared to the passive suspensions without compromising on the rail handling ability and ride comfort. The electrohydraulic actuator is used for the active suspension system, and an LQR control strategy has been chosen. MATLAB will be used to develop and analyse the state-space model for both the passive and active systems, and a Simulink will be used to create block diagrams and simulate the systems.

## MATLAB/Simulink
MATLAB software will be used to develop the state-space model of the railway suspension system and the LQR controller for the active suspension system; it will also house the model parameters which will be used in conjunction with Simulink. For theoretical calculations, MATLAB is a popular software when it comes to the analysis of experimental data. The MATLAB environment will be of benefit when it comes to analysing the suspension parameters inside the simulation model. The results obtained using MATLAB will be used for comparison and discussion. Simulink is a software package for simulating, analysing and modelling dynamic systems. The software can be utilised to analyse the behaviour of real-world dynamic systems and will be used in this dissertation to analyse the quarter-car model suspension system for the railway vehicle.

## MATHEMATICAL MODEL
When designing a control system, the establishment of the mathematical model of the system is needed. Like most engineering control systems, a mathematical model will typically rely on known laws which will then be derived, Newton second law of motion will be the law focus for the quarter car suspension model. The mathematical model's primary purpose is to provide an equation or equations describing how the system behaves.

## QUARTER CAR MODEL
In order to analyse the parameters related to the suspension system, a simplified quarter car model shown in Figure 10 (a)  was utilised for analysis. The quarter car model was chosen due to it being the most common and straightforward of the vehicle dynamic vibration models, for the analysis of the vertical vibration caused by the railway disturbance. The railway vehicles mass is divided into two, the railway vehicle body which is referred to as the sprung mass and the railway vehicles bogie which is referred to as the unsprung mass. Connected in between the sprung and unsprung and the track are suspension springs and dampers.  Both the transversal and longitudinal deflections considered insignificant in comparison to the vertical deflections of the suspension system. For the passive suspension system, the actuator force will not be considered due to not having a control element shown in **Figure 10 (b)**.

![image](https://user-images.githubusercontent.com/73448401/99986119-b6d27900-2da6-11eb-8435-fbf3132f0c3e.png)

**Figure 10**: A quarter model for the active suspension system (a) and the passive suspension system (b)

Where:

M_s= Represents the railway vehicles body mass or sprung mass.

M_us= Represents the unsprung mass of the railway vehicle including the bogie, wheel and other associated parts

K_s= Represents the suspension systems spring constant for the sprung mass.

K_us= Represents the suspension systems spring constant for the unsprung mass.

B_s= Represents the inherent damping coefficient for the suspension system.

B_us=Represents the inherent damping coefficient for the railway vehicles wheel assembly.

F_c= The active suspensions actuator control force.

Z_s= Represents the railway vehicles (sprung mass) body displacement.

Z_us= Represents the railway vehicles wheel displacement and the unsprung masses displacement

Z_r= Represents the excitation due to the railway disturbance.

### QUARTER RAIL VEHICLE MODEL DESIGN PARAMETERS
The input parameter values of both the passive and active suspension systems for the railcar model which will be used for analysis and produce results are given in **Table 2**.

| Parameters | Values       |
|------------|--------------|
| M_s        | 5333 kg      |
| M_us       | 906.5 kg     |
| K_s        | 430,000 N/m  |
| K_us       | 2,440000 N/m |
| B_s        | 20,000 sec/m |
| B_us       | 40,000 sec/m |

**Table 2**: Quarter rail model design parameters

## EQUATION OF MOTION

The equations of motion considered for both the passive and the active suspension systems are derived using Newton second law of motion. 

![](https://latex.codecogs.com/png.latex?F%3Dma)

Transposed for the acceleration, the equation now becomes:

![](https://latex.codecogs.com/png.latex?a%3DF/m)

So, from the figure above, Newton's law of motion, the dynamic equation of the active suspension system and with the forces acting on the sprung mass, the following equation is given:

![image](https://user-images.githubusercontent.com/73448401/100001126-8e547a00-2dba-11eb-83e9-788698eccd1e.png)

Transposed for the sprung mass acceleration, the equation now becomes:

![image](https://user-images.githubusercontent.com/73448401/100001201-afb56600-2dba-11eb-9cad-d3a30e3f30b1.png)

The forces acting on the unsprung mass are the following:

![image](https://user-images.githubusercontent.com/73448401/100001304-d70c3300-2dba-11eb-9795-56c827f5854c.png)

Transposed for the unsprung mass acceleration, the equation now becomes:

![image](https://user-images.githubusercontent.com/73448401/100001341-edb28a00-2dba-11eb-8381-a715459233f0.png)

## STATE SPACE REPRESENTATION

The general state-space representation is given by the following:

![image](https://user-images.githubusercontent.com/73448401/100001556-3e29e780-2dbb-11eb-87fa-16273d1bc658.png)

Where: 

![image](https://user-images.githubusercontent.com/73448401/100001664-61549700-2dbb-11eb-9e98-3535c461c35d.png)

A state-space model describing the active suspension system will be created using the two equations of motion derived earlier.

Let the state variables representing the system be:

![image](https://user-images.githubusercontent.com/73448401/100001944-c90ae200-2dbb-11eb-8c58-f2b206cf9527.png)

Where:

![image](https://user-images.githubusercontent.com/73448401/100001986-db851b80-2dbb-11eb-93a1-edd2866e5795.png)

The input u into the system will be the railway disturbance velocity Z ̇_r and the actuator input F_c.

The desired outputs y from the system are the suspension travel Z_s-Z_us and the railway vehicles body acceleration Z ̈_s.

Using the equations of motion found in equations 3, 4, 5 and 6, the state-space model of the active suspension system can easily be obtained and written in the form given in equation 7, which will then be written matrix form shown below:

![image](https://user-images.githubusercontent.com/73448401/100002119-0a02f680-2dbc-11eb-900f-c9c6adb3e201.png)

![image](https://user-images.githubusercontent.com/73448401/100002180-1be49980-2dbc-11eb-95a0-f8631c49a811.png)

## STATE-SPACE CONTROLLABILITY

There are many problems when it comes to control systems such as stabilising unstable systems using feedback control, and controllability is an important factor when attempting to deal with these problems. If the system consists of a single control input, u, that can move a system state around in its entire configuration to another state; then the system can be controlled. For a linear time-invariant state system to be controllable, the controllability matrix P must be full rank and equalled the n number of states in the system. 

![image](https://user-images.githubusercontent.com/73448401/100002251-3880d180-2dbc-11eb-973a-445eff8e4a37.png)

Where:

![image](https://user-images.githubusercontent.com/73448401/100002300-4898b100-2dbc-11eb-9bea-2bdaaa3c1840.png)



## FULL STATE VARIABLE FEEDBACK CONTROL
A full state feedback controller, which is also referred to as a pole placement controller, is shown in Figure 11 and is an optimal solution for achieving the desired pole locations of a closed-loop system, as it allows all state variables to be known to the controller all times and available for feedback.

Shown in Figure 11, the state space matrix is the plant with each state variable being fed back to the control input ,u, through the gain K represented by feedback vector, which can be adjusted to reach the desired closed-loop pole values. So, the system input is given by:

![image](https://user-images.githubusercontent.com/73448401/100002695-d4124200-2dbc-11eb-8983-ca938ebe626e.png)

Substituting this into equation 7 will give the state space equation for the closed-loop system:

![image](https://user-images.githubusercontent.com/73448401/100002762-ec825c80-2dbc-11eb-9f9a-b9b48b1ae28c.png)

![image](https://user-images.githubusercontent.com/73448401/100002801-f7d58800-2dbc-11eb-830b-1426b171603d.png)

Figure 11: A full-state feedback block diagram

## LINEAR QUADRATIC REGULATOR (LQR) 

A popular type of state feedback control that provides a systematic way of determining the control gain, K, is the LQR controller. The LQR approach will be used for the controller design for the active suspension system, as it is one of more classic control options for linear MIMO time-invariant systems and is simple enough to design. The advantages of using an LQR controller is that the factors affecting the performance index can be weighted depending on the desired result of the individual. Improving the rail handling ability in the ride comfort of the quarter rail model will be the focus of the LQR approach.

The primary function of an LQR controller is to minimise the cost function, J, the performance index seen in equation 14, and calculate the optimal gain K:

![image](https://user-images.githubusercontent.com/73448401/100002881-218eaf00-2dbd-11eb-9d08-ebfc48406942.png)

Where:

![image](https://user-images.githubusercontent.com/73448401/100002969-497e1280-2dbd-11eb-892b-97937a926d43.png)


The performance index or quadratic cost function J must be minimised by adjusting both the weighting Q and R matrices, where Q is a diagonal positive definite and R is a positive constant. The desired closed-loop performance is then obtained by tuning the weighting matrices, by penalising bad performance by adjusting the Q matrix or penalising actuator effort by adjusting the R matrix until suitable results regarding the cost function are reached for the plant.

Based on equation 11, the feedback regulator and solution and to the performance index in is given by:

![image](https://user-images.githubusercontent.com/73448401/100003103-77635700-2dbd-11eb-902b-12806bd452c8.png)

Meaning that both the A and B matrices must correspond to the actuator control force in the feedback regulator, giving the matrices shown in equation 16:

![image](https://user-images.githubusercontent.com/73448401/100003163-8b0ebd80-2dbd-11eb-81c1-6bb7f948a8fa.png)

## LQR CONTROLLER MATLAB IMPLEMENTATION

Since it has been determined that the A and B matrices are both controllable, an LQR controller can now be designed and be implemented into MATLAB. the system matrix A, the input matrix B, the output matrix C and the feedforward matrix D must first be represented in MATLAB shown below:
```
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
``` 

The controllability of the open-loop system has already been determined so the weighting matrices Q and R of the quadratic performance index can now be tuned for and obtained in MATLAB. The performance measures that were of relative importance and needed more of a focus, were of the states related to the suspension travel and the railway vehicle body acceleration. After trial and error of changing the nonzero elements in the Q matrix and the input weighting of the R matrix, the final weighting matrices Q and R are shown below:

![image](https://user-images.githubusercontent.com/73448401/100003276-b691a800-2dbd-11eb-87b1-1457f75f1663.png)

By entering the Q and R weighting matrices, the feedback gain vector K was obtained using the following MATLAB command:
```
lqr( A, B(:,2), Q, R )

Q = diag([1760*10^6, 11.6*10^6, 1, 1]);

R = 0.01;

K = lqr( A, B(:,2), Q, R )
K =

   1.0e+05 *

    1.7075    0.3637    0.7759    0.0052
```
So, the feedback gain vector obtained is:

![image](https://user-images.githubusercontent.com/73448401/100003356-d6c16700-2dbd-11eb-824f-6113a3305fce.png)













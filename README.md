# An-LQR-feedback-controller-for-an-active-suspension-system-of-a-rail-vehicle
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

█(F=ma #(1) )




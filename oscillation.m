%set initial conditions:
m = 1.; %mass
k = 1.; %spring constant
x = 10.; %displacement
v = 0.; %speed
dt = 0.001; %Euler's method gets innacurate with to big steps. gets slow with too many steps
T = 20.; %total time
t = 0.; %elapsed time
d = 0.2; %damping constant

steps = int64(T/dt);
tref = zeros(1,steps); %needed for plotting in the end
xref = zeros(1,steps);

i = 1;
while t < T
    %solve equation of motion:
    a = -k*x/m-d*v; %spring force provides acceleration
    x = x + v*dt + a*dt*dt/2.;
    v = v + a*dt;
    t = t+dt;
    
    %print current state:
    fprintf('\n%s %.2f\n', 'time elapsed (s):', t);
    fprintf('%s %.3f\n', 'displacement: (m)', x);
    
    %need to have data in the end to plot:
    tref(1,i) = t;
    xref(1,i) = x;
    i = i+1;
end

figure(1)
plot(tref,xref);
title(['simple harmonic motion with damping b = ', num2str(d)]);
xlabel('time (s)');
ylabel('displacement (m)');
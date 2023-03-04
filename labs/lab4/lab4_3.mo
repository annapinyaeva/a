model lab4_3
Real x;
Real y;

initial equation
x = 0.9;
y = -1.9;

equation
der(x) = y;
der(y) = -2*0.9*y-1.9*x+3.3*cos(5*time);

annotation(experiment(StartTime = 0, StopTime = 38, Tolerance = 1e-6, Interval = 0.05));

end lab4_3;
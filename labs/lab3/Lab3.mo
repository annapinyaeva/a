model Lab3
Real a = 0.13;
Real b = 0.51;
Real c = 0.41;
Real h = 0.15;
Real t = time;
Real x;
Real y;
initial equation
x = 202000;
y = 92000;
equation
der(x) = -a*x - b*y + 0.5*sin(t+13);
der(y) = -c*x*y - h*y + 0.5*cos(t+2);
end Lab3;

model projectL3
Real a = 0.08;
Real b = 0.76;
Real c = 0.64;
Real h = 0.07;
Real x;
Real y;
Real t = time;
initial equation
x = 202000;
y = 92000;
equation
der(x) = -a*x - b*y + sin(2*t) +1;
der(y) = -c*x*y - h*y + cos(3*t) +1;
end projectL3;

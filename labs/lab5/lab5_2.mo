model lab5_2

Real a = 0.31;
Real b = 0.054;
Real c = 0.32;
Real d = 0.055;
Real x;
Real y;

initial equation
x = c/d;
y = a/b;
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;

end lab5_2;
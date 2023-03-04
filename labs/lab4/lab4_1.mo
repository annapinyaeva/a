model lab4_1
Real x;
Real y;

initial equation
x = 0.9;
y = -1.9;

equation
der(x) = y;
der(y) = -5.1*x;

end lab4_1;
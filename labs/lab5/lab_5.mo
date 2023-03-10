model lab5_1
Real x (start = 7);
Real y (start = 15);
Real a = 0.31;
Real b = 0.054;
Real c = 0.32;
Real d = 0.055;

equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;

end lab5_1;
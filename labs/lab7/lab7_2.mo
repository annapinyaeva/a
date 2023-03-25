model lab7_2
Real N = 1120;
Real n;


initial equation
n = 19;

equation
der(n) = (0.00003 + 0.62*n)*(N - n);

end lab7_2;
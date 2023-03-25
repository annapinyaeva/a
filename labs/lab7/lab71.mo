model lab71
Real N = 1120;
Real n;

initial equation
n = 19;

equation
der(n) = (0.93 + 0.00003*n)*(N - n);
end lab71;
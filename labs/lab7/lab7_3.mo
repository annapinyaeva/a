model lab7_3
Real N = 1120;
Real n;


initial equation
n = 19;

equation
der(n) = (0.88*cos(time) + 0.77*cos(2*time)*n)*(N - n);

end lab7_3;
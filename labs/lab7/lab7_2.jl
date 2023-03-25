using Plots
using DifferentialEquations

N = 1120
n = 19
max = [-1e6, 0, 0]


function Fun(du, u, p, t)
    n = u
    du[1] = (0.00003 + 0.62*u[1])*(N-u[1])
    if du[1] > max[1]
        max[1] = du[1]
        max[2] = u[1]
        max[3] = t
    end
end

v = [n]
time = (.0,.1)
prob = ODEProblem(Fun, v, time)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
    dpi = 300,
    legend =:topright,
    size=(800, 400))

plot!(
    plt,
    T,
    n,
    label = "График 2",
    color = :red)
scatter!(
    plt[1], 
    [max[3]], 
    [max[2]], 
    color=:red, 
    
    label="t=" * string(max[3]) * " — время")




using Plots
using DifferentialEquations

N = 1120
n = 19


function Fun(du, u, p, t)
    n = u
    du[1] = (0.93 + 0.00003*u[1])*(N-u[1])
end

v = [n]
time = (.0, 30.0)
prob = ODEProblem(Fun, v, time)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
    dpi = 300,
    legend =:topright)

plot!(
    plt,
    T,
    n,
    label = "График 1",
    color = :red)





using DifferentialEquations
using Plots

x0 = 7
y0 = 15

a = 0.31
b = 0.054
c = 0.32
d = 0.055

u0 = [x0, y0]

time = (0.0, 60.0)

function F!(du, u, p, t)
    du[1] = -c * u[1] + d * u[1] * u[2]
    du[2] = a * u[2] - b * u[1] * u[2]
end


prob = ODEProblem(F!, u, time)
sol = solve(prob, dtmax=0.05)

const xx = []
const yy = []
for u in sol.u
    x, y = u
    push!(xx, x)
    push!(yy, y)
end
T = sol.t

plt =plot(
    layout=(1, 2),
    dpi=150,
    grid=:xy,
    gridcolor=:black,
    gridwidth=1,
    size=(800, 400),
    legend=true,
    plot_title="Модель «хищник-жертва»"
)

plot!(
    plt[1],
    T,
    [xx, yy],
    color=[:red :blue],
    xlabel="t",
    ylabel="x(t), y(t)",
    label=["x(t) — число хищников" "y(t) — число жертв"]
)

plot!(
    plt[2],
    yy,
    xx,
    color=[:red],
    xlabel="y(t)",
    ylabel="x(t)",
    label="Зависимость числа хищников (x) от числа жертв (y)"
)








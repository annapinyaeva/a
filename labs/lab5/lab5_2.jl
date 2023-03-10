using DifferentialEquations
using Plots

const a = 0.31
const b = 0.054
const c = 0.32
const d = 0.055
const x0 = a / b
const y0 = c / d

@show x0
@show y0

u0 = [x0, y0]

T = (0.0, 60.0)

function F!(du, u, p, t)
	du[1] = -c * u[1] + d * u[1] * u[2]
	du[2] = a * u[2] - b * u[1] * u[2]
end


prob = ODEProblem(F!, u0, T)
sol = solve(prob, dtmax=0.05)

const xx = []
const yy = []
for u in sol.u
    x, y = u
    push!(xx, x)
    push!(yy, y)
end
time = sol.t

fig = Plots.plot(
	layout=(1, 2),
	dpi=150,
	grid=:xy,
	gridcolor=:black,
	gridwidth=1,
	# aspect_ratio=:equal,
	size=(800, 400),
	legend=:outerbottom,
	plot_title="Модель «хищник-жертва»"
)

Plots.plot!(
	fig[1],
	time,
	[xx, yy],
	color=[:red :blue],
	xlabel="t",
	ylabel="x(t), y(t)",
	label=["x(t) — число хищников" "y(t) — число жертв"]
)

Plots.scatter!(
	fig[2],
	yy,
	xx,
	color=[:blue],
	xlabel="y(t)",
	ylabel="x(t)",
	label="Зависимость числа хищников (x) от числа жертв (y)"
)






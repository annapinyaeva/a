using DifferentialEquations
using Plots; gr()

xx=0.9
yy=-1.9

p1 = [5.1, 0, 0]
p2 = [0.9, 2, 0]
p3 = [0.9, 1.9, 3.3]

function F(du, u, p, t)
    x, y = u
    du[1] = u[2]
    du[2] = -p[1]*u[1] -p[2]*u[2] +p[3]*cos(5*t)
end

prob1 = ODEProblem(F, [xx, yy], (0.0, 38.0), p1)
prob2 = ODEProblem(F, [xx, yy], (0.0, 38.0), p2)
prob3 = ODEProblem(F, [xx, yy], (0.0, 38.0), p3)

sol1 = solve(prob1, dtmax = 0.05)
sol2 = solve(prob2, dtmax = 0.05)
sol3 = solve(prob3, dtmax = 0.05)

X1 = [u[1] for u in sol1.u]
Y1 = [u[2] for u in sol1.u]

X2 = [u[1] for u in sol2.u]
Y2 = [u[2] for u in sol2.u]

X3 = [u[1] for u in sol3.u]
Y3 = [u[2] for u in sol3.u]

#plt1 = plot(dpi = 300, title = "Решение без затуханий и внешней силы", legend = true)
#plot!(plt1, sol1.t, X1, xlabel = "time", ylabel = "X", label = "X points", color = :red)



#plt12 = plot(dpi = 300, title = "Фазовый портрет", legend = true)
#plot!(plt12, X1, Y1, xlabel = "X", ylabel = "Y", label = "Фазовый портрет", color = :red)

#plt2 = plot(dpi = 300, title = "Решение с затуханием и без внешней силы", legend = true)
#plot!(plt2, sol2.t, X1, xlabel = "time", ylabel = "X", label = "X points", color = :red)



#plt22 = plot(dpi = 300, title = "Фазовый портрет 2", legend = true)
#plot!(plt22, X2, Y2, xlabel = "X", ylabel = "Y", label = "Фазовый портрет", color = :red)

#plt3 = plot(dpi = 300, title = "Решение с затуханием и внешней силой", legend = true)
#plot!(plt3, sol3.t, X1, xlabel = "time", ylabel = "X", label = "X points", color = :red)



plt32 = plot(dpi = 300, title = "Фазовый портрет 3", legend = true)
plot!(plt32, X3, Y3, xlabel = "X", ylabel = "Y", label = "Фазовый портрет", color = :red)












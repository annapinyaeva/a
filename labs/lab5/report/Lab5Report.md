---
## Front matter
title: "Лабораторная работа № 5"
subtitle: "Модель хищник-жертва"
author: "Пиняева Анна Андреевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: false
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
    - spelling=modern
    - babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью данной работы является построение модели хищник-жертва.

# Задачи

1. Построить график зависимости численности хищников от численности жертв
2. Построить график зависимости численности хищников и численности жертв от времени
3. Найти стационарное состояние системы

# Теоретическое введение

- Модель Лотки—Вольтерры [1] — модель взаимодействия двух видов типа «хищник — жертва», названная в честь её авторов, которые предложили модельные уравнения независимо друг от друга. Такие уравнения можно использовать для моделирования систем «хищник — жертва», «паразит — хозяин», конкуренции и других видов взаимодействия между двумя видами.

Данная двувидовая модель основывается на
следующих предположениях [2]:

1. Численность популяции жертв x и хищников y зависят только от времени
(модель не учитывает пространственное распределение популяции на
занимаемой территории)
2. В отсутствии взаимодействия численность видов изменяется по модели
Мальтуса, при этом число жертв увеличивается, а число хищников падает
3. Естественная смертность жертвы и естественная рождаемость хищника
считаются несущественными
4. Эффект насыщения численности обеих популяций не учитывается
5. Скорость роста численности жертв уменьшается пропорционально
численности хищников

# Задание

!["Вариант 29"](https://sun9-6.userapi.com/impg/DDCE34kFK2DDyBonfUCqRHvxm87tkH1JNIHxuQ/wGeLWWmn5UI.jpg?size=1494x676&quality=95&sign=358640fc52327f86e38f98e4426d249a&type=album)

# Выполнение лабораторной работы

## Построение математической модели. Решение с помощью программ

### Julia

Код программы для построения графика зависимости изменения численности хищников от изменения численности жертв и график зависимости численности хищников и численности жертв от времени:

```
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
```

### Результаты работы кода на Julia

График зависимости изменения численности хищников от изменения численности жертв и график зависимости численности хищников и численности жертв от времени на языке Julia (рис.1)


!["Рис.1 график зависимости изменения численности хищников от изменения численности жертв и график зависимости численности хищников и численности жертв от времени на языке Julia"](https://sun9-42.userapi.com/impg/2WAZB7q3a3h0HpvMFSro_xfDjTPK0Mx3jKjncw/2sA46F4uZ2g.jpg?size=2134x836&quality=95&sign=b6d1e738d24dc11e627a9cc7ac8f2f6a&type=album)

### Julia

Код программы для построения графика зависимости численности хищников и численности жертв от времени в стационарной системе:

```
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

```

### Результаты работы кода на Julia

Результат работы программы для построения графика зависимости численности хищников и численности жертв от времени в стационарной системе: (рис.1)


!["Рис.2 графика зависимости численности хищников и численности жертв от времени в стационарной системе на языке Julia"](https://sun9-13.userapi.com/impg/9gt-on0lBWgtG3odvEBf5VWqpVbubGg3wNGc_w/8SebXtKogz4.jpg?size=2134x836&quality=95&sign=6e02d21b3458b61d1de717df3887d58a&type=album)

## OpenModelica

Код программы для построения графика зависимости изменения численности хищников от изменения численности жертв и график зависимости численности хищников и численности жертв от времени:
```
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
```

Код программы для построения графика зависимости численности хищников и численности жертв от времени в стационарной системе:
```
model lab5_2

Real a = 0.31;
Real b = 0.054;
Real c = 0.32;
Real d = 0.055;
Real x;
Real y;

initial equation
x = c/d;
y = a/b;
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;

end lab5_2;
```

### Результаты работы кода на OpenModelica

Первый случай: 

График зависимости изменения численности хищников от изменения численности жертв (рис.3)


!["Рис.3 Результаты работы кода на OpenModelica"](https://sun9-79.userapi.com/impg/F5wYknHeXQKn0heKUwd4PGngCAqMQ4trkq7ihg/hsQDdnYSw1M.jpg?size=2234x1100&quality=95&sign=4abf56c8328036a057b602501ff65ada&type=album)


График зависимости численности хищников и численности жертв от времени (рис. 4)
!["Рис.4 Результаты работы кода на OpenModelica"](https://sun9-56.userapi.com/impg/3dtDpdrCWr-0Oh0SaQquGwplWhq9-hojaOUbmQ/8yf6mQBHovE.jpg?size=2234x1100&quality=95&sign=c8d1d23ef6adafb6627b2062f07d3767&type=album)

Второй случай: 

График зависимости численности хищников и численности жертв от времени в стационарной системе (рис.5)


!["Рис.5 Результаты работы кода на OpenModelica"](https://sun9-78.userapi.com/impg/6UgidhWsggxr7KOtW992DLfB7QgB6TRX5PYO9g/GVvho6vXpiE.jpg?size=2234x1100&quality=95&sign=f2f36db899cbfbdb589665a0c3d72dc0&type=album)




# Выводы

В итоге проделанной работы мы построили график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв на языках Julia и OpenModelica. Построение модели хищник-жертва на языке OpenModelica занимает меньше строк, чем аналогичное построение на Julia.

# Список литературы{.unnumbered}

[1] Модель Лотки-Вольтерры. Википедия: https://ru.wikipedia.org/wiki/%D0%9C%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C_%D0%9B%D0%BE%D1%82%D0%BA%D0%B8_%E2%80%94_%D0%92%D0%BE%D0%BB%D1%8C%D1%82%D0%B5%D1%80%D1%80%D1%8B

[2] Руководство к лабоарторной работе: https://esystem.rudn.ru/pluginfile.php/1971660/mod_resource/content/2/%D0%9B%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%20%E2%84%96%204.pdf


---
## Front matter
title: "Отчёт по лабораторной работе №4


Математическое моделирование"
subtitle: "Модель гармонических колебаний. Вариант №29"
author: "Выполнила: Пиняева Анна Андреевна, 


НФИбд-02-20, 1032202458"



## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Docx output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
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
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Изучить понятие гармонического осциллятора, построить фазовый портрет и найти решение уравнения гармонического осциллятора.

# Теоретическое введение

- Гармонический осциллятор [1] — система, которая при смещении из положения равновесия испытывает действие возвращающей силы F, пропорциональной смещению x.

- Гармоническое колебание [2] - колебание, в процессе которого величины, характеризующие движение (смещение, скорость, ускорение и др.), изменяются по закону синуса или косинуса (гармоническому закону).

Движение грузика на пружинке, маятника, заряда в электрическом контуре, а также эволюция во времени многих систем в физике, химии, биологии и других науках при определенных предположениях можно описать одним и тем же дифференциальным уравнением, которое в теории колебаний выступает в качестве основной модели. Эта модель называется линейным гармоническим осциллятором.
Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2=0$$

где $x$ - переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), $\gamma$ - параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega_0$ - собственная частота колебаний.
Это уравнение есть линейное однородное дифференциальное  уравнение второго порядка и оно является примером линейной динамической системы.

При отсутствии потерь в системе ( $\gamma=0$ ) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени.
$$\ddot{x}+\omega_0^2x=0$$

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида
 
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	\dot{x(t_0)}=y_0
 \end{cases}
$$

Уравнение второго порядка можно представить в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	x=y
	\\   
	y=-\omega_0^2x
 \end{cases}
$$

Начальные условия для системы примут вид:
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	y(t_0)=y_0
 \end{cases}
$$

Независимые	переменные	$x, y$	определяют	пространство,	в	котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.

Значение фазовых координат $x, y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным 
начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.

# Задачи

1. Разобраться в понятии гармонического осциллятора

2. Ознакомиться с уравнением свободных колебаний гармонического осциллятора

3. Построить фазовый портрет гармонического осциллятора и решение уравнения на языках Julia и Open Modelica гармонического осциллятора для следующих случаев:

- Колебания гармонического осциллятора без затуханий и без действий внешней силы

- Колебания гармонического осциллятора c затуханием и без действий внешней силы

- Колебания гармонического осциллятора c затуханием и под действием внешней силы

# Задание

Вариант 29:

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $\ddot{x}+5.1x=0$;
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы $\ddot{x}+0.9\dot{x}+29x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы $\ddot{x}+0.9\dot{x}+1.9x=3.3cos(5t)$

На интервале $t\in [0;38]$ (шаг $0.05$) с начальными условиями $x_0=-0.9, y_0=-1.9$.

# Выполнение лабораторной работы

## Построение математической модели. Решение с помощью программ

### Julia

Код программы для всех случаев:

```
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

```

### Результаты работы кода на Julia

Колебания гармонического осциллятора без затуханий и без действий внешней силы (рис.1-2)


!["Рис.1 Решение уравнения для колебания гармонического осциллятора без затуханий и без действий внешней силы на языке Julia"](https://sun9-77.userapi.com/impg/N1vOh9m81wqSpURDmaI_JkBhZ9MGDQFhv9nf0Q/RJCSNnObaL0.jpg?size=1714x864&quality=95&sign=9892d5b24470adf1c5b74dd265d8ed7d&type=album)


!["Рис.2 Фазовый потрет для колебания гармонического осциллятора без затуханий и без действий внешней силы на языке Julia"](https://sun9-78.userapi.com/impg/eB0I5pdD-Abcw6G04DdJkIfSs6Q8PSBFRp70PQ/Zoqvbgh5-uA.jpg?size=1481x818&quality=95&sign=bd1a69713c117e92ed4c367b3e8942b3&type=album)


Колебания гармонического осциллятора c затуханием и без действий внешней силы (рис.3-4)

!["Рис.3 Решение уравнения для колебания гармонического осциллятора c затуханием и без действий внешней силы на языке Julia"](https://sun9-10.userapi.com/impg/qrYlHcfxdGxyufND96VVz-RHzUgmNibTSzqtIQ/5XMYPif5jn0.jpg?size=1714x864&quality=95&sign=cd3b075478a07f54f68c19bcfd4f6323&type=album)

!["Рис.4 Фазовый потрет для колебания гармонического осциллятора c затуханием и без действий внешней силы на языке Julia"](https://sun9-53.userapi.com/impg/OAJT99ownkeONZuNepaAAfg1Wxmm4gDVB-Uz_w/gzM0Ah5CTeo.jpg?size=1714x864&quality=95&sign=46a369f2a15737456293640326ae0c44&type=album)



Колебания гармонического осциллятора c затуханием и под действием внешней силы (рис.5-6)

!["Рис.5 Решение уравнения для колебания гармонического осциллятора cc затуханием и под действием внешней силы на языке Julia"](https://sun9-41.userapi.com/impg/70KJJ5XCiwvdZRZ8KRawQbdU4sB-3luDnMig4g/6xuMWz3IEvE.jpg?size=1714x864&quality=95&sign=cc6041203458e587daa0bfe6ba9f535a&type=album)

!["Рис.6 Фазовый потрет для колебания гармонического осциллятора c затуханием и под действием внешней силы на языке Julia"](https://sun9-47.userapi.com/impg/xbx0-_CFT-qndkLwP13_U9rROIwJ5HIOB1Q1Ww/Bq9NBERADyU.jpg?size=1714x864&quality=95&sign=ab8db630a0aa2b8ec2981ba520fcb581&type=album)


## OpenModelica

Код программы для первого случая:

```
model lab4_1
Real x;
Real y;

initial equation
x = 0.9;
y = -1.9;

equation
der(x) = y;
der(y) = -5.1*x;

end lab4_1;
```

Код программы для второго случая:

```
model lab4_2
Real x;
Real y;

initial equation
x = 0.9;
y = -1.9;

equation
der(x) = y;
der(y) = -2*0.9*y-2*x;

annotation(experiment(StartTime = 0, StopTime = 38, Tolerance = 1e-6, Interval = 0.05));

end lab4_2;
```

Код программы для третьего случая:

```
model lab4_3
Real x;
Real y;

initial equation
x = 0.9;
y = -1.9;

equation
der(x) = y;
der(y) = -2*0.9*y-1.9*x+3.3*cos(5*time);

annotation(experiment(StartTime = 0, StopTime = 38, Tolerance = 1e-6, Interval = 0.05));

end lab4_3;
```

### Результаты работы кода на OpenModelica

Первый случай: 

Колебания гармонического осциллятора без затуханий и без действий внешней силы (рис.7-8)


!["Рис.7 Решение уравнения для колебания гармонического осциллятора без затуханий и без действий внешней силы на языке Open Modelica"](https://sun9-46.userapi.com/impg/bxVontWOH_O9PwuuGdmT_vjnTEtFJb04uWPPEQ/bB75nsD7Bq0.jpg?size=2560x1600&quality=95&sign=ef3034992ada2b38d1d05d209e8168b1&type=album)

!["Рис.6 Фазовый портрет для колебания гармонического осциллятора без затуханий и без действий внешней силы на языке Open Modelica"](https://sun9-43.userapi.com/impg/UAb6m11KEHYd5X6vzjsgUCPIXKOwFufbQ_Fb7w/9jyQ8-dblu4.jpg?size=2560x1600&quality=95&sign=1ac850986bb674bd35228923b570fd3c&type=album)

Второй случай:

Колебания гармонического осциллятора c затуханием и без действий внешней силы (рис.9-10)


!["Рис.9 Решение уравнения для колебания гармонического осциллятора c затуханием и без действий внешней силы на языке Open Modelica"](https://sun9-32.userapi.com/impg/6IVnBi6Bhj9zQSu55xDS0SaO1-QFXjdqd22y7A/wOQ8ENraL3k.jpg?size=2560x1600&quality=95&sign=c93968e5252f1e4d60fa3f03869fcd59&type=album)

!["Рис.10 Фазовый потрет для колебания гармонического осциллятора c затуханием и без действий внешней силы на языке Open Modelica"](https://sun9-17.userapi.com/impg/qx7DmjRW7bNfbkDIPDE0_1oBnp6RkblDdrk2sw/Wjq0vDK7hxM.jpg?size=2560x1600&quality=95&sign=d458073644086b6cc56be9c844890ebe&type=album)


Третий случай:

Колебания гармонического осциллятора c затуханием и под действием внешней силы (рис.11-12)


!["Рис.11 Решение уравнения для колебания гармонического осциллятора cc затуханием и под действием внешней силы на языке Open Modelica"](https://sun9-72.userapi.com/impg/js_WZ0Sv7xcCY-dpuEvq6E_6jb2FLzc682mYWw/RlD20wWI6yk.jpg?size=2560x1600&quality=95&sign=43d2fec98374016f7d6a5135869695af&type=album)

!["Рис.12 Фазовый потрет для колебания гармонического осциллятора c затуханием и под действием внешней силы на языке Open Modelica"](https://sun9-48.userapi.com/impg/RzPO3WktmN6AS1Usl4zlorduMOLuAx2Ewz-n0w/py0zrh_G-ro.jpg?size=2560x1600&quality=95&sign=87ad386994d55f5d0af2c666c26959a3&type=album)


# Анализ полученных результатов. Сравнение языков.

В итоге проделанной работы мы построили по три модели (включающих в себя два графика) на языках Julia и OpenModelica. Построение моделей колебания на языке OpenModelica занимает меньше строк, чем аналогичное построение на Julia.

# Вывод

В ходе выполнения лабораторной работы были построены решения уравнения гармонического осциллятора и фазовые портреты гармонических колебаний без затухания, с затуханием и при действии внешней силы на языках Julia и Open Modelica.

# Список литературы. Библиография

[1] Документация по Julia: https://docs.julialang.org/en/v1/

[2] Документация по OpenModelica: https://openmodelica.org/

[3] Решение дифференциальных уравнений: https://www.wolframalpha.com/

[4] Бутиков И. Е. Собственные колебания линейного осциллятора. 2011.

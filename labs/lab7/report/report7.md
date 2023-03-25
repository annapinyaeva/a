---
## Front matter
title: "Лабораторная работа № 7"
subtitle: "Эффективность рекламы"
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

Целью данной работы является построение построение графиков распространения рекламы.


# Теоретическое введение

Модель рекламной кампании описывается следующими величинами.
Считаем, что $$ dn/dt $$ - скорость изменения со временем числа потребителей[1],
узнавших о товаре и готовых его купить, t - время, прошедшее с начала рекламной кампании, n(t) - число уже информированных клиентов. Эта величина
пропорциональна числу покупателей, еще не знающих о нем, это описывается
следующим образом: $$ a1(t)(N-n(t)),$$ где N
платежеспособных покупателей, $$ a1(t) > 0 $$ общее число потенциальных характеризует интенсивность
рекламной кампании (зависит от затрат на рекламу в данный момент времени)[2].
Помимо этого, узнавшие о товаре потребители также распространяют полученную информацию среди потенциальных покупателей, не знающих о нем (в этом случае работает т.н. сарафанное радио). Этот вклад в рекламу описывается величиной $$ a2(t)n(t)(N-n(t)) $$, эта величина увеличивается с увеличением потребителей
узнавших о товаре. Математическая модель распространения рекламы описывается уравнением:
$$ dn/dt = (a1(t)*a2(t)n(t))(N-n(t)) $$


# Задание

!["Вариант 29"](https://sun9-52.userapi.com/impg/tGm5sMTr86cfZIhTR35J_km3IGX9ryUKoLCgfQ/Qfwv06HeE-Q.jpg?size=1662x716&quality=95&sign=34b9835f222cde48670608e95475a28d&type=album)


# Выполнение лабораторной работы

## Построение математической модели. Решение с помощью программ

## Julia

Первый случай:

```
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


```
### Результаты работы кода на Julia

Получим график для первого случая (рис.1)


!["Рис.1 График распространения рекламы для первого случая на языке Julia"](https://sun9-16.userapi.com/impg/mF0cM-xj_V9jLwXJq5AuenQDQBohYiBP3KSGjQ/ZI8Hr-mugG0.jpg?size=1442x814&quality=95&sign=202d68457b22b085e2f0742391653db2&type=album)

## Julia

Второй случай:

```
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


```
### Результаты работы кода на Julia

По аналогии с предыдущим построением получим график для второго случая, а так же момент времени, в который скорость распространения рекламы будет иметь максимальное значение (рис.2)


!["Рис.2 График распространения рекламы для второго случая на языке Julia"](https://sun9-65.userapi.com/impg/7c5Rn-1hmh553zp7Vh_gyFlx_Tccm2oW64dwow/xoKwe1o0Xf4.jpg?size=1662x814&quality=95&sign=92a572545ad8fcf47653b38fb554fdff&type=album)

## Julia

Третий случай:

```
using Plots
using DifferentialEquations

N = 1120
n = 19


function Fun(du, u, p, t)
    n = u
    du[1] = (0.88 * cos(t) + 0.77*cos(2*t)*u[1])*(N-u[1])
end

v = [n]
time = (.0, .1)
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
    label = "График 3",
    color = :red)

```
### Результаты работы кода на Julia

По аналогии с предыдущим построением получим график для третьего случая (рис.3)


!["Рис.3 График распространения рекламы для третьего случая на языке Julia"](https://sun9-62.userapi.com/impg/hifU4cIocKHk0w6-670q3TOabmUnHPRLaQXSIA/84jlYwls-sg.jpg?size=1662x814&quality=95&sign=11e1a8c490b14f07db397edb3b4caaeb&type=album)

## OpenModelica

Первый случай: 

```
model lab71
Real N = 1120;
Real n;
Real a1 = 0.93;
Real a2 = 0.00003;

initial equation
n = 19;

equation
der(n) = (a1 + a2*n)*(N - n);
end lab71;

```
### Результаты работы кода на OpenModelica

Получим график для первого случая (рис.4)


!["Рис.4 График распространения рекламы для первого случая на языке OpenModelica"](https://sun9-35.userapi.com/impg/1AiZC0gT5mmUY-Rw7KudvjVssLnMlcQQlkAOZw/0O7gukfAbxM.jpg?size=1418x854&quality=95&sign=97d4a7e6fad8a9e659e03e57bb6402d0&type=album)


## OpenModelica

Второй случай:

```
model lab7_2
Real N = 1120;
Real n;
Real a1 = 0.00003;
Real a2 = 0.062;

initial equation
n = 19;

equation
der(n) = (a1 + a2*n)*(N - n);

end lab7_2;

```
### Результаты работы кода на OpenModelica

По аналогии с предыдущим построением получим график для второго случая, а так же момент времени, в который скорость распространения рекламы будет иметь максимальное значение (рис.5)


!["Рис.5 График распространения рекламы для второго случая на языке OpenModelica"](https://sun9-62.userapi.com/impg/kMa-vQaYbOJUrk1-MgDgonJu21U2ZJ1F3MxxLg/2dZA_Uyk6Y4.jpg?size=1724x854&quality=95&sign=9fbf1095606b20da7f6eba1e4875352d&type=album)


## OpenModelica

Третий случай:

```
model lab7_3
Real N = 1120;
Real n;


initial equation
n = 19;

equation
der(n) = (0.88*cos(time) + 0.77*cos(2*time)*n)*(N - n);

end lab7_3;

```

### Результаты работы кода на OpenModelica
По аналогии с предыдущим построением получим график для третьего случая (рис.6)


!["Рис.6 График распространения рекламы для третьего случая на языке OpenModelica"](https://sun9-33.userapi.com/impg/eEPNNrMqiZKgiGthE9_Z-wfGSB-LmG-VFZTasA/sWQ4gUeGs1w.jpg?size=1724x854&quality=95&sign=054406f8998bae046a941e9c7becb337&type=album)

# Выводы

В ходе проделанной работы были построены графики распространения рекламы для трех случаев. Код на языке Julia оказался длиннее, однако для вычисления момента времени, в который скорость распространения рекламы будет иметь максимальное значение этот язык подходит лучше всего, т.к. на языке OpenModelica это сделать невозможно.

# Список литературы{.unnumbered}

[1] Модели эффективности рекламы и ее воздействие на потребителя: http://mediaalmanah.ru/files/56/2013_3_4_shchepiloba.pdf

[2] Руководство к лабоарторной работе: https://esystem.rudn.ru/pluginfile.php/1971668/mod_resource/content/2/Лабораторная%20работа%20№%206.pdf




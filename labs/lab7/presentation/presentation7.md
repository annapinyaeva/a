---
## Front matter
lang: ru-RU
title: Лабораторная работа № 7
author:
  - Пиняева Анна Андреевна
group:
  - НФИбд-02-20, 1032202458
date: 2023, Москва

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---


# Цель

Целью данной работы является построение построение графиков распространения рекламы.

# Задание

!["Вариант 29"](https://sun9-52.userapi.com/impg/tGm5sMTr86cfZIhTR35J_km3IGX9ryUKoLCgfQ/Qfwv06HeE-Q.jpg?size=1662x716&quality=95&sign=34b9835f222cde48670608e95475a28d&type=album)


# Выполнение лабораторной работы
# Julia (первый случай)
Описание переменных 
```
using Plots
using DifferentialEquations

N = 1120
n = 19
```
# Julia (первый случай)

Функция построения графиков:
```
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
```
# Julia (первый случай)

Построение графиков:

```
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

# Результаты работы кода на Julia

!["Рис.1 График распространения рекламы для первого случая на языке Julia"](https://sun9-16.userapi.com/impg/mF0cM-xj_V9jLwXJq5AuenQDQBohYiBP3KSGjQ/ZI8Hr-mugG0.jpg?size=1442x814&quality=95&sign=202d68457b22b085e2f0742391653db2&type=album)

# Julia (второй случай)
По аналогии с первым случаем описываются переменные и функция (меняются только коэффициенты а1 и а2). Так же в функцию добавляется метод для вычисления момента времени, в который скорость распространения рекламы будет иметь максимальное значение


```
function Fun(du, u, p, t)
    n = u
    du[1] = (0.00003 + 0.62*u[1])*(N-u[1])
    if du[1] > max[1]
        max[1] = du[1]
        max[2] = u[1]
        max[3] = t
    end
end
```
# Результаты работы кода на Julia

!["Рис.2 График распространения рекламы для второго случая на языке Julia"](https://sun9-65.userapi.com/impg/7c5Rn-1hmh553zp7Vh_gyFlx_Tccm2oW64dwow/xoKwe1o0Xf4.jpg?size=1662x814&quality=95&sign=92a572545ad8fcf47653b38fb554fdff&type=album)

# Julia (третий случай)
По аналогии с предыдущими случаями получается код для третьего случая (меняются только коэффициенты а1 и а2) 

# Результаты работы кода на Julia

!["Рис.3 График распространения рекламы для третьего случая на языке Julia"](https://sun9-62.userapi.com/impg/hifU4cIocKHk0w6-670q3TOabmUnHPRLaQXSIA/84jlYwls-sg.jpg?size=1662x814&quality=95&sign=11e1a8c490b14f07db397edb3b4caaeb&type=album)

# OpenModelica (первый случай)
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

# Результаты работы кода на OpenModelica

!["Рис.4 График распространения рекламы для первого случая на языке OpenModelica"](https://sun9-35.userapi.com/impg/1AiZC0gT5mmUY-Rw7KudvjVssLnMlcQQlkAOZw/0O7gukfAbxM.jpg?size=1418x854&quality=95&sign=97d4a7e6fad8a9e659e03e57bb6402d0&type=album)

# OpenModelica (второй случай)

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
# Результаты работы кода на OpenModelica

!["Рис.5 График распространения рекламы для второго случая на языке OpenModelica"](https://sun9-62.userapi.com/impg/kMa-vQaYbOJUrk1-MgDgonJu21U2ZJ1F3MxxLg/2dZA_Uyk6Y4.jpg?size=1724x854&quality=95&sign=9fbf1095606b20da7f6eba1e4875352d&type=album)


# OpenModelica (третий случай)

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

# Результаты работы кода на OpenModelica

!["Рис.6 График распространения рекламы для третьего случая на языке OpenModelica"](https://sun9-33.userapi.com/impg/eEPNNrMqiZKgiGthE9_Z-wfGSB-LmG-VFZTasA/sWQ4gUeGs1w.jpg?size=1724x854&quality=95&sign=054406f8998bae046a941e9c7becb337&type=album)

# Вывод

В ходе проделанной работы были построены графики распространения рекламы для трех случаев. Код на языке Julia оказался длиннее, однако для вычисления момента времени, в который скорость распространения рекламы будет иметь максимальное значение этот язык подходит лучше всего, т.к. на языке OpenModelica это сделать невозможно.



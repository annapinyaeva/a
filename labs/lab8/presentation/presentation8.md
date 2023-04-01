---
## Front matter
lang: ru-RU
title: Лабораторная работа № 8
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


# Цель работы

Цель данной работы:
1. Построение графика изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 1.
2. Построение графика изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 2.

# Задание

![](https://sun9-60.userapi.com/impg/VltuNsdm7KMdL1Ek0VRXUEY722vXeFJtDPqFtA/8baAJ2AkHHg.jpg?size=1090x664&quality=95&sign=c306f70fa1d89d979c60ba5b0e79983f&type=album)
![](https://sun9-68.userapi.com/impg/jddxckh8XRb8kZ7mjSni1MgGhhbCAbrULVQydA/7cPGH2A4Du4.jpg?size=1090x1112&quality=95&sign=4ec6ce47c594b61763572eecc107c359&type=album)
!["Вариант 29"](https://sun9-3.userapi.com/impg/UDOMZqJUjXlUkxzwh9AerRHvdD58Tv0WMBEtYQ/eW5ddMF3WOE.jpg?size=1090x588&quality=95&sign=13dce6c7cf08a7e8a212a30512286b4e&type=album)


# Выполнение лабораторной работы
# Julia (первый случай)
Описание переменных 
```
using DifferentialEquations
using Plots

p_cr = 33
N = 83
q = 1
tau1 = 27
tau2 = 24
p1 = 11.3
p2 = 12.5

a1 = p_cr/(tau1*tau1*p1*p1*N*q)
a2 = p_cr/(tau2*tau2*p2*p2*N*q)
b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q) 
c1 = (p_cr-p1)/(tau1*p1)
c2 = (p_cr-p2)/(tau2*p2)

```
# Julia (первый случай)

Функция построения графиков:
```
function Fun(du, u, p, t)
    M1, M2 = u
    du[1] = u[1]-b/c1*u[1]*u[2]-a1/c1*u[1]*u[1]
    du[2] = c2/c1*u[2]-b/c1*u[1]*u[2]-a2/c1*u[2]*u[2]
end

v = [8.5, 9.1]
time = (0.0, 30.0)
prob = ODEProblem(Fun, v, time)
sol = solve(prob, dtmax = 0.05)
M1 = [u[1] for u in sol.u]
M2 = [u[2] for u in sol.u]
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
    M1,
    label = "M1",
    color = :red)

plot!(
    plt,
    T,
    M2,
    label = "M2",
    color = :blue)

```

# Результаты работы кода на Julia

!["Рис.1 График изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 1 на языке Julia"](https://sun9-41.userapi.com/impg/cqJXOVHzTYtnvgcvTKdzs_w2Uqd3kcl0ZcmwHw/kLh_nSDQY9c.jpg?size=1684x806&quality=95&sign=02a4f24f51e9037558449c1527232ba7&type=album)

# Julia (второй случай)
По аналогии с первым случаем описываются переменные. Меняется только функция.


```
function Fun(du, u, p, t)
    M1, M2 = u
    du[1] = u[1]-(b/c1+0.00019)*u[1]*u[2]-a1/c1*u[1]*u[1]
    du[2] = c2/c1*u[2]-b/c1*u[1]*u[2]-a2/c1*u[2]*u[2]
end
```
# Результаты работы кода на Julia

!["Рис.2 График изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 2 на языке Julia"](https://sun1-86.userapi.com/impg/A49ZBMFwhqzRGd379buq8iUob3CWHS4XefMrJw/gqI81y4J5vY.jpg?size=1684x806&quality=95&sign=b4e198b03f32f0313c481f29e8516624&type=album)


# OpenModelica (первый случай)
```
model lab8_1
Real M1;
Real M2;
Real p_cr = 33;
Real N = 83;
Real q = 1;
Real tau1 = 27;
Real tau2 = 24;
Real p1 = 11.3;
Real p2 = 12.5;
Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
Real b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q); 
Real c1 = (p_cr-p1)/(tau1*p1);
Real c2 = (p_cr-p2)/(tau2*p2);
initial equation
M1 = 8.5;
M2 = 9.1;
equation
der(M1) = M1-b/c1*M1*M2-a1/c1*M1*M1;
der(M2) = c2/c1*M2-b/c1*M1*M2-a2/c1*M2*M2;
end lab8_1;
```

# Результаты работы кода на OpenModelica

!["Рис.3 График изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 1 на языке OpenModelica"](https://sun9-47.userapi.com/impg/V0zOZJWoiBpV0pklMRIbfF7RdwVVNPl8laclog/tMgINYBQId8.jpg?size=1684x806&quality=95&sign=e7c1e5096982fdd920c9caa7c17efb06&type=album)


# OpenModelica (второй случай)

```
model lab8_2
Real M1;
Real M2;
Real p_cr = 33;
Real N = 83;
Real q = 1;
Real tau1 = 27;
Real tau2 = 24;
Real p1 = 11.3;
Real p2 = 12.5;
Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
Real b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q); 
Real c1 = (p_cr-p1)/(tau1*p1);
Real c2 = (p_cr-p2)/(tau2*p2);
initial equation
M1 = 8.5;
M2 = 9.1;
equation
der(M1) = M1-(b/c1+0.00019)*M1*M2-a1/c1*M1*M1;
der(M2) = c2/c1*M2-b/c1*M1*M2-a2/c1*M2*M2;

end lab8_2;

```

# Результаты работы кода на OpenModelica

!["Рис.4 График изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 2 на языке OpenModelica"](https://sun9-46.userapi.com/impg/O5O1L8UdCVJ5yGqQ8vtTvE_7iLBZkyF8ZDYBuQ/vFbicnxaG5I.jpg?size=1684x806&quality=95&sign=51600bf6485c3930dc6c31a5f90cc810&type=album)




# Выводы

В ходе проделанной работы были построены:
1. График изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 1.
2. График изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 2.
На языке Julia реализация кожа объемнее, чем на языке OpenModelica.



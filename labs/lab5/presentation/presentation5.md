---
## Front matter
lang: ru-RU
title: Лабораторная работа № 5
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


## Цели

Целью данной работы является построение модели хищник-жертва.

## Задачи

1. Построить график зависимости численности хищников от численности жертв

2. Построить график зависимости численности хищников и численности жертв от времени

3. Найти стационарное состояние системы

# Задание

!["Вариант 29"](https://sun9-6.userapi.com/impg/DDCE34kFK2DDyBonfUCqRHvxm87tkH1JNIHxuQ/wGeLWWmn5UI.jpg?size=1494x676&quality=95&sign=358640fc52327f86e38f98e4426d249a&type=album)


# Ход работы

## Результаты работы кода на Julia

График зависимости изменения численности хищников от изменения численности жертв и график зависимости численности хищников и численности жертв от времени на языке Julia (рис.1)


!["Рис.1 график зависимости изменения численности хищников от изменения численности жертв и график зависимости численности хищников и численности жертв от времени на языке Julia"](https://sun9-42.userapi.com/impg/2WAZB7q3a3h0HpvMFSro_xfDjTPK0Mx3jKjncw/2sA46F4uZ2g.jpg?size=2134x836&quality=95&sign=b6d1e738d24dc11e627a9cc7ac8f2f6a&type=album)

## Результаты работы кода на Julia

Результат работы программы для построения графика зависимости численности хищников и численности жертв от времени в стационарной системе: (рис.1)


!["Рис.2 графика зависимости численности хищников и численности жертв от времени в стационарной системе на языке Julia"](https://sun9-13.userapi.com/impg/9gt-on0lBWgtG3odvEBf5VWqpVbubGg3wNGc_w/8SebXtKogz4.jpg?size=2134x836&quality=95&sign=6e02d21b3458b61d1de717df3887d58a&type=album)

## Результаты работы кода на OpenModelica

###Первый случай: 

График зависимости изменения численности хищников от изменения численности жертв (рис.3)


!["Рис.3 Результаты работы кода на OpenModelica"](https://sun9-79.userapi.com/impg/F5wYknHeXQKn0heKUwd4PGngCAqMQ4trkq7ihg/hsQDdnYSw1M.jpg?size=2234x1100&quality=95&sign=4abf56c8328036a057b602501ff65ada&type=album)


График зависимости численности хищников и численности жертв от времени (рис. 4)
!["Рис.4 Результаты работы кода на OpenModelica"](https://sun9-56.userapi.com/impg/3dtDpdrCWr-0Oh0SaQquGwplWhq9-hojaOUbmQ/8yf6mQBHovE.jpg?size=2234x1100&quality=95&sign=c8d1d23ef6adafb6627b2062f07d3767&type=album)

###Второй случай: 

График зависимости численности хищников и численности жертв от времени в стационарной системе (рис.5)


!["Рис.5 Результаты работы кода на OpenModelica"](https://sun9-78.userapi.com/impg/6UgidhWsggxr7KOtW992DLfB7QgB6TRX5PYO9g/GVvho6vXpiE.jpg?size=2234x1100&quality=95&sign=f2f36db899cbfbdb589665a0c3d72dc0&type=album)



# Выводы

В итоге проделанной работы мы построили график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв на языках Julia и OpenModelica. Построение модели хищник-жертва на языке openModelica занимает меньше строк, чем аналогичное построение на Julia.



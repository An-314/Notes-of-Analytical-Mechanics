#import "@preview/scripst:1.1.1": *

= Hamilton原理与变分方法

== Hamilton原理与变分方法

=== Hamilton原理

对于$n$个粒子的保守系统，有Lagrange量
$
  L = T - V
$
其中$T$是动能，$V$是势能。

#theorem(subname: [Hamilton原理])[
  在$t_0$到$t_1$间隔内，一个保守的力学体系，有Lagrange量$L(q_i, dot(q_i), t)$，其受到的约束是完整的、保守的，其有确定的初末位置$q_i (t_0)$和$q_i (t_1)$，则实际运动轨迹$q_i (t)$使作用量
  $
    S= integral_(t_0)^(t_1) L(q_i, dot(q_i), t) dd(t)
  $
  取极值。
]
Hamilton和Newton运动定律、D'Alembert原理、Lagrange方程是等价的，它们都可以做为力学的第一性原理。

#example(subname: [地面上运动的质点])[
  Lagrange量为
  $
    L = T - V = 1/2 m dot(vb(r))^2 - m g z
  $
  从$A$点到$B$点的作用量为
  $
    S = integral_(t_A)^(t_B) (1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) - m g z) dd(t)
  $
  由Hamilton原理，变分$delta S = 0$，就可以得到质点的运动方程。
]

== Euler方程

先考虑一个自由度的问题
$
  I[y] = integral_(x_1)^(x_2) f(y, y', x) dd(x)
$
其端点$y(x_1) = y_1, y(x_2) = y_2$是固定的。寻找$y=y(x)$使得$I[y]$取极值。

#definition(subname: [泛函])[
  在函数空间上定义的映射$F: V -> RR$叫做泛函。

  在我们要求极值的$I[y]$中，$V$是所有在$[x_1, x_2]$上连续可微的函数构成的空间，$I[y]$是定义在$V$上的泛函。

  泛函极值问题是变分法的核心问题。
]
- 泛函和符合函数的区别在于，前者的自变量是函数，后者的自变量是数值。

先考虑一般函数的极值问题，设$g(x)$在$x$处有极值，则$g'(x) = 0$，且
$
  Delta g(x) = g(x + Delta x) - g(x) = g''(x) Delta x^2 + o(Delta x^2)
$
在极值附近只有二阶小量。对泛函也类似，通过差值给出。如果函数$y=y(x)$在$x$处的*等时变分*为$delta y$
$
  delta y = delta y(x)
$
对于等时变分，可以求导
$
  delta y' = delta (dv(y, x)) = dv(delta y, x)
$
则泛函$I[y]$的变分为
$
  delta I[y] & = I[y + delta y] - I[y] \
             & = integral_(x_1)^(x_2) (f(y + delta y, y' + delta y', x) - f(y, y', x)) dd(x) \
             & = integral_(x_1)^(x_2) (pdv(f, y) delta y + pdv(f, y') delta y' + o(delta y, delta y')) dd(x) \
             & = integral_(x_1)^(x_2) (pdv(f, y) delta y + pdv(f, y') dv(delta y, x)) dd(x) + o(delta y, delta y')
$
利用分部积分
$
  integral_(x_1)^(x_2) pdv(f, y') dv(delta y, x) dd(x) = eval((pdv(f, y') delta y))_(x_1)^(x_2) - integral_(x_1)^(x_2) dv(, x)pdv(f, y') delta y dd(x)
$
由于端点固定，$delta y(x_1) = delta y(x_2) = 0$，所以
$
  delta I[y] & = integral_(x_1)^(x_2) (pdv(f, y) - dv(, x)pdv(f, y')) delta y dd(x) + o(delta y, delta y')
$
泛函极值要求变分的一阶小量为零，所以
$
                                                          delta I[y] & = 0 \
  integral_(x_1)^(x_2) (pdv(f, y) - dv(, x)pdv(f, y')) delta y dd(x) & = 0
$
由于$delta y$是任意的，故
$
  pdv(f, y) - dv(, x)pdv(f, y') = 0
$
这就是Euler方程。

#theorem(subname: [Euler方程])[
  设泛函
  $
    I[y] = integral_(x_1)^(x_2) f(y, y', x) dd(x)
  $
  其中端点$y(x_1) = y_1, y(x_2) = y_2$是固定的，则使$I[y]$取极值的函数$y=y(x)$满足Euler方程
  $
    pdv(f, y) - dv(, x)pdv(f, y') = 0
  $
]

这个方程和Lagrange方程形式上是一样的，如果我们把$y$看作广义坐标，$x$看作时间$t$，$f$看作Lagrange量$L$，则Euler方程就是Lagrange方程。

为了简化表示，我们引入变分算符
$
  (delta F)/(delta y) = pdv(F, y) - dv(, x)pdv(F, y')
$
如果泛函不含有$y'$，则$(delta F)/(delta y) = pdv(F, y)$，相当于普通函数的偏导数。泛函极值问题可以看作
$
  (delta I)/(delta y) = 0
$

#example(subname: [最速降线])[
  在重力场中，求一条曲线，使得质点从$A$点到$B$点所需时间最短。

  设曲线方程为$y=y(x)$，则质点在曲线上任意一点的速度为$v = sqrt(2 g (-y))$，质点经过$dd(s)$距离所用的时间为
  $
    dd(t) = dd(s)/v = (sqrt(1 + y'^2) dd(x))/sqrt(2 g (-y))
  $
  则从$A$到$B$的时间为
  $
    t_(A B) = integral_(x_A)^(x_B) sqrt((1 + y'^2)/(2 g (-y))) dd(x)
  $
  这是一个泛函极值问题，令
  $
    f(y, y', x) = sqrt((1 + y'^2)/(-y))
  $
  则Euler方程为
  $
    pdv(f, y) - dv(, x)pdv(f, y') = 0
  $
  解得
  $
    c sqrt(- y (1 + y'^2)) = 1
  $
  整理有
  $
    dd(x) = plus.minus sqrt((c^2 y)/(1 - c^2 y)) dd(y)
  $
  令$h = 1/c^2$，则
  $
    x = plus.minus (sqrt(y (h - y)) + h arccos(sqrt(1 + y/h))) + "const"
  $
  令
  $
    phi/2 = arccos(sqrt(1 + y/h))
  $
  则
  $
    x & = plus.minus h (phi - sin(phi)) \
    y & = - h (1 - cos(phi))
  $
  这就是最速降线、旋轮线的方程。

  之所以叫旋轮线，是因为它是一个半径为$h$的圆沿$x$轴滚动时，圆上一点的轨迹。
]

#example(subname: [最速降线的进一步讨论])[
  事实上我们刚才知道了二维中的情况，现在考虑三维中的情况。


  时间的作用量为
  $
    t = integral_(x_A)^(x_B) F(y, y', z, z', x) dd(x)
  $
  其中
  $
    F(y, y', z, z', x) = sqrt((1 + y'^2 + z'^2)/( (-y)))
  $
  泛函极值条件为
  $
    (delta t)/(delta y) = 0, (delta t)/(delta z) = 0
  $
  由Euler方程，有
  $
    pdv(F, y) - dv(, x)pdv(F, y') = 0\
    pdv(F, z) - dv(, x)pdv(F, z') = 0
  $
  $z$是循环坐标，因为
  $
    pdv(F, z) = 0
  $
  从而循环积分为
  $
    dv(, x)pdv(F, z') = 0\
    z'/(sqrt((-y)(1 + y'^2 + z'^2))) = c_1
  $
  $F$不含$x$，有能量积分
  $
    y' pdv(F, y') + z' pdv(F, z') - F = c_2\
    (1)/(sqrt((-y)(1 + y'^2 + z'^2))) = c_2
  $
  解得
  $
    z' = (c_1/c_2), z = (c_1/c_2) x + c_3
  $
  而对于$A$在原点，$B$点处$z=0$，就有
  $
    z = 0
  $
  在运动过程中$z$恒为零，质点仍然在垂直于地面的平面内运动，最速降线仍然是旋轮线。结果与二维情况相同。
]

=== Hamilton原理和Lagrange方程

对于三个自由度的泛函变分极值问题
$
  delta S = delta integral_(t_A)^(t_B) L dd(t) = 0
$
其中端点$vb(r)(A), vb(r)(B)$是固定的。由Euler方程，有
$
  pdv(L, x) - dv(, t)pdv(L, dot(x)) = 0\
  pdv(L, y) - dv(, t)pdv(L, dot(y)) = 0\
  pdv(L, z) - dv(, t)pdv(L, dot(z)) = 0
$
这就是地面上自由运动的质点的Lagrange方程。

代入Lagrange量
$
  L = T - V = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) - m g z
$
就可以得到质点的运动方程。

后面我们会给出更一般Lagrange方程的证明。

事实上量子力学中的Feynman路径积分方法，就是基于Hamilton原理的。

== 泛函的条件极值问题以及高维泛函和高阶导数的泛函极值问题

=== 条件泛函极值问题

同样地，我们考虑多元函数的条件极值问题。设在$G(x,y)=0$的约束下，函数$F(x,y)$有极值。先Taylor展开
$
  Delta F & = F(x + Delta x, y + Delta y) - F(x, y) \
          & = pdv(F, x) Delta x + pdv(F, y) Delta y + o(Delta x, Delta y) \
  Delta G & = G(x + Delta x, y + Delta y) - G(x, y) \
          & = pdv(G, x) Delta x + pdv(G, y) Delta y + o(Delta x, Delta y)
$
求极值时不能简单要求
$
  pdv(F, x) = pdv(F, y) = 0
$
两个变量的增量$Delta x, Delta y$不是独立的，故此用$lambda$引入Lagrange乘子，考虑无约束的函数
$
  L = F(x,y) + lambda G(x,y)
$
对$L$求极值时，需满足
$
  pdv(L, x) = pdv(L, y) = 0
$
和约束条件$G(x,y)=0$，从而有
$
  pdv(F, x) + lambda pdv(G, x) = 0\
  pdv(F, y) + lambda pdv(G, y) = 0\
  G(x,y) = 0
$
这就是条件极值问题的Lagrange乘子法。

回到泛函的条件极值问题，设在约束条件
$
  G(y,z,x) = 0
$
下，泛函
$
  I[y,z] = integral_(x_1)^(x_2) F(y, y', z, z', x) dd(x)
$
有极值。引入Lagrange乘子$lambda(x)$，考虑无约束的泛函
$
  I[y,z] = integral_(x_1)^(x_2) (F(y, y', z, z', x) + lambda(x) G(y, z, x)) dd(x)
$
对$I[y,z]$求极值，需满足
$
  delta I[y,z] = integral_(x_1)^(x_2) (((delta F)/(delta y) + (delta (lambda G))/(delta y)) delta y + ((delta F)/(delta z) + (delta (lambda G))/(delta z)) delta z) dd(x)= 0
$
和约束条件$G(y,z,x)=0$，从而有
$
  (delta F)/(delta y) + (delta (lambda G))/(delta y) = 0\
  (delta F)/(delta z) + (delta (lambda G))/(delta z) = 0\
  G(y,z,x) = 0
$
如果$lambda = lambda(x)$
$
  pdv(F, y) - dv(, x)pdv(F, y') + lambda pdv(G, y) = 0\
  pdv(F, z) - dv(, x)pdv(F, z') + lambda pdv(G, z) = 0\
  G(y,z,x) = 0
$
这就是泛函的条件极值问题的Lagrange乘子法。

#example(subname: [面积给定正则曲线的周长的极值])[
  $
    S = integral.cont y dd(x) = "const"
  $
  其周长是
  $
    L = integral.cont sqrt(1 + y'^2) dd(x)
  $
  #theorem(subname: [Green公式])[
    对于闭合曲线$C$，有
    $
      integral.cont (P dd(x) + Q dd(y)) = integral.double_(D) (pdv(Q, x) - pdv(P, y)) dd(x) dd(y)
    $
    其中$D$是曲线$C$所围成的区域。
  ]
  由Green公式，有
  $
    S = integral.cont y dd(x) = integral.double_(D) dd(x) dd(y) = "const"
  $
  这是一个条件泛函极值问题
  $
    I[y] = integral.cont (sqrt(1 + y'^2) + lambda y) dd(x) - lambda S
  $
  $
    F = sqrt(1 + y'^2) + lambda y
  $
  由Euler方程，有
  $
    pdv(F, y) - dv(, x)pdv(F, y') = 0
  $
  即
  $
    lambda - dv(, x)(y'/(sqrt(1 + y'^2))) = 0
  $
  整理得
  $
    (y'/(sqrt(1 + y'^2))) = lambda x + "const"
  $
  令$lambda = 1/r$，则
  $
    (y'/(sqrt(1 + y'^2))) = (x/r) + "const"
  $
  整理得
  $
    (x - x_0)^2 + (y - y_0)^2 = r^2
  $
  这就是圆的方程，故在面积给定的条件下，周长最小的曲线是圆。
]

== 力学中的应用

=== Hamilton原理的数学表示

#theorem(subname: [])[
  完整、理想约束的保守力学体系，其作用量总是取极值，即变分为零：
  $
    delta S = delta integral_(t_0)^(t_1) L(q_i, dot(q_i), t) dd(t) = 0
  $
]

=== 完整系

对于$N$个质点，$k$个完整约束，自由度为$s = 3N - k$。设$s$个广义坐标为$q_1, q_2, ..., q_s$，从$A$到$B$的作用量为
$
  S = integral_(t_A)^(t_B) L(q_i (t), dot(q_i) (t), t) dd(t)
$
其中$L = T - V$，$T$是动能，$V$是势能。Hamilton原理要求
$
  delta S = 0
$
即
$
  delta S = integral_(t_A)^(t_B) sum_(i=1)^s ((delta L)/(delta q_i) delta q_i) dd(t) = 0
$
由于$delta q_i$互相独立，有
$
  (delta L)/(delta q_i) = 0
$
即
$
  pdv(L, q_i) - dv(, t)pdv(L, dot(q_i)) = 0
$
这就是完整约束下的Lagrange方程。所以说*Hamilton原理和Lagrange方程是等价的*。

对于完整约束的变分极值问题，也可以约束条件的Lagrange乘子法来处理。设约束条件为
$
  G_j (q_i, t) = 0, j = 1, 2, ..., k
$
引入Lagrange乘子$lambda_j (t)$，考虑无约束的作用量


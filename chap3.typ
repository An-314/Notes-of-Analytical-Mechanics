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
Hamilton和Newton运动定律、D'Alembert原理、Lagrange方程是等价的，它们都可以做为*力学的第一性原理*。

#example(subname: [地面上运动的质点], lab: "ex3.1")[
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
泛函和符合函数的区别在于，前者的自变量是函数，后者的自变量是数值。

先考虑一般函数的极值问题，设$g(x)$在$x$处有极值，则$g'(x) = 0$，且
$
  Delta g(x) = g(x + Delta x) - g(x) = g''(x) Delta x^2 + o(Delta x^2)
$
在极值附近只有二阶小量。*对泛函也类似，通过差值给出。*

如果函数$y=y(x)$在$x$处的*等时变分*为$delta y$
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
  delta I[y] & = 0 => integral_(x_1)^(x_2) (pdv(f, y) - dv(, x)pdv(f, y')) delta y dd(x) & = 0
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

这个方程和Lagrange方程形式上是一样的，如果我们把$y$看作广义坐标，$x$看作时间$t$，$f$看作Lagrange量$L$，则Euler方程就是Lagrange方程。由于其形式一致性，循环积分和能量积分也都对Euler方程成立。

为了简化表示，我们引入*变分算符*
#definition(subname: [变分算符])[
  变分算符作用在函数$f$上，定义为
  $
    (delta f)/(delta y) = pdv(f, y) - dv(, x)pdv(f, y')
  $
  如果泛函不含有$y'$，则$(delta f)/(delta y) = pdv(f, y)$，相当于普通函数的偏导数。泛函极值问题可以看作
  $
    (delta f)/(delta y) = 0
  $
]

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

#example(subname: [两点之间线段最短])[
  两点间曲线方程
  $
    cases(
      y = y(x),
      z = z(x)
    )
  $
  则两点间曲线长度
  $
    S = integral_(x_1)^(x_2) sqrt(1 + y'^2 + z'^2) dd(x), F = sqrt(1 + y'^2 + z'^2)
  $
  使得曲线长度最短的条件是满足
  $
    (delta F)/(delta y) = 0, (delta F)/(delta z) = 0
  $
  即
  $
    pdv(F, y) - dv(, x)pdv(F, y') = 0\
    pdv(F, z) - dv(, x)pdv(F, z') = 0
  $
  而$F$不含$x,y,z$，类似能量积分，有
  $
    y' pdv(F, y') + z' pdv(F, z') - F = c_0 => - 1/sqrt(1 + y'^2 + z'^2) = c_0
  $
  以及循环积分
  $
    pdv(F, y') = c_1 => y' / sqrt(1 + y'^2 + z'^2) = c_1\
    pdv(F, z') = c_2 => z' / sqrt(1 + y'^2 + z'^2) = c_2
  $
  结合起来就有
  $
    y' = - c_1/c_0, z' = - c_2/c_0
  $
  斜率恒为常数，故两点间曲线是直线。
]
在Euclidean空间中，最短路径是直线。

如果在一个弯曲空间，两点间不一定是直线最短。如在球面，两点间最短线是在通过两点的大圆上(是一段圆弧)。这种弯曲空间(包括平直空间)上与两点间最短距离相对应的曲线叫测地线。测地线与坐标系选择无关，它是由测地线所在空间的内禀性质决定的。测地线与坐标系选择无关，它是由测地线所在空间的内禀性质决定的。

Newton力学描述引力场中运动的质点时，认为在引力作用下质点加速运动，而广义相对论的基本思想是认为引力场使空间和时间(时间是时空中的一个维数)弯曲(弯曲程度可用引力场强弱定量表示)，质点在这个弯曲时空沿测地线作惯性运动。

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

#example(subname: [地面上的质点运动方程])[
  @ex3.1 中代入Lagrange量
  $
    L = T - V = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) - m g z
  $
  就可以得到质点的运动方程。
  $
    pdv(L, x) - dv(, t)pdv(L, dot(x)) = 0 => m dot.double(x) = 0\
    pdv(L, y) - dv(, t)pdv(L, dot(y)) = 0 => m dot.double(y) = 0\
    pdv(L, z) - dv(, t)pdv(L, dot(z)) = 0 => m dot.double(z) = - m g
  $
  这就是质点在重力场中的运动方程，给出了抛物线运动。
]

#newpara()

后面我们会给出更一般Lagrange方程的证明。

Hamilton原理指的是在任何一个局域，作用量都是取极值的，这就抛开了力学定律的具体形式，只关注系统的整体行为。事实上量子力学中的Feynman路径积分方法，就是基于Hamilton原理的。

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
这就是条件极值问题的*Lagrange乘子法*。

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

=== 高维泛函极值问题

考虑二维泛函
$
  I[z] = integral.double_S F(z, pdv(z, x), pdv(z, y), x, y) dd(x) dd(y)
$
若$z(x,y)$在曲面$S$的边界$Gamma$上固定不变，则此泛函极值同样可以通过上式的变分为0得到。记$z_x = pdv(z, x), z_y = pdv(z, y)$，则有
$
  delta I[z] = integral.double_S (pdv(F, z) delta z + pdv(F, z_x) delta z_x + pdv(F, z_y) delta z_y) dd(x) dd(y)
$
利用Green公式可知
$
  integral.double_S (pdv(, x) (pdv(F, z_x) delta z) + pdv(, y) (pdv(F, z_y) delta z)) dd(x) dd(y) = integral.cont_Gamma (-pdv(F, z_y) dd(x) + pdv(F, z_x) dd(y)) = 0 \ (eval((delta z))_Gamma = 0)
$
且有
$
  pdv(delta z, x) = delta pdv(z, x) = delta z_x
$
则
$
  integral.double_S (pdv(F, z_x) pdv(delta z, x) + pdv(F, z_y) pdv(delta z, y) + (pdv(, x) pdv(F, z_x) + pdv(, y) pdv(F, z_y)) delta z) dd(x) dd(y) = 0
$
即
$
  integral.double_S (pdv(F, z_x) pdv(delta z, x) + pdv(F, z_y) pdv(delta z, y)) dd(x) dd(y) = - integral.double_S (pdv(, x) pdv(F, z_x) + pdv(, y) pdv(F, z_y)) delta z dd(x) dd(y)
$
回到变分的式子
$
  delta I[z] = integral.double_S (pdv(F, z) delta z - pdv(, x) pdv(F, z_x) - pdv(, y) pdv(F, z_y)) delta z dd(x) dd(y) = 0
$
变分极值给出
$
  pdv(F, z) - pdv(, x) pdv(F, z_x) - pdv(, y) pdv(F, z_y) = 0
$

== 力学中的应用

=== Hamilton原理的数学表示

#theorem(subname: [])[
  完整、理想约束的保守力学体系，其作用量总是取极值，即变分为零：
  $
    delta S = delta integral_(t_0)^(t_1) L(q_i, dot(q_i), t) dd(t) = 0
  $
]
如果把虚功原理和D'Alembert原理统称为微分变分原理，那么Hamilton原理就是一种基于泛函变分的积分变分原理。

=== 完整系

对于$N$个质点，$k$个完整约束，自由度为$s = 3N - k$。设$s$个广义坐标为$q_1, q_2, ..., q_s$，从$A$到$B$的作用量为
$
  S[q_1, q_2, ..., q_s] = integral_(t_A)^(t_B) L(q_i (t), dot(q_i) (t), t) dd(t)
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
$
  S[q_1,q_2, ... ,q_(3N)] = integral_(t_A)^(t_B) L(q_i, dot(q_i), t) dd(t)
$
引入$k$个与时间相关的Lagrange乘子$lambda_j = lambda_j (t)$，考虑无约束的作用量
$
  S = integral_(t_A)^(t_B) (L + sum_(j=1)^k lambda_j G_j) dd(t)
$
由于是完整约束，约束不含广义速度$dot(q_i)$，故对$dot(q_i)$求偏导时，约束项为零，有
$
  (delta(lambda_j G_j))/(delta q_i) = lambda_j pdv(G_j, q_i)
$
极值方程变成
$
  integral_(t_A)^(t_B) (pdv(L, q_i) - dv(, t)pdv(L, dot(q_i)) + sum_(j=1)^k lambda_j pdv(G_j, q_i)) delta q_i dd(t) = 0, i = 1, 2, ..., 3N
$
其中只有$s=3N-k$个独立变量($q_(k+1), ..., q_(3N)$)，$k$个$lambda_j$未定，可以选取$lambda_j$使得，前$k$个满足
$
  (delta L)/(delta q_i) + sum_(j=1)^k lambda_j pdv(G_j, q_i) = 0, i = 1, 2, ..., k
$
这样极值条件为
$
  sum_(i=k+1)^(3N) integral_(t_A)^(t_B) ((delta L)/(delta q_i) + sum_(j=1)^k lambda_j pdv(G_j, q_i)) delta q_i dd(t) = 0
$
由于$q_i$独立，有
$
  (delta L)/(delta q_i) + sum_(j=1)^k lambda_j pdv(G_j, q_i) = 0, i = k+1, k+2, ..., 3N
$
结合前述$lambda_j$的限制，有
$
  (delta L)/(delta q_i) + sum_(j=1)^k lambda_j pdv(G_j, q_i) = 0, i = 1, 2, ..., 3N
$
这就是完整约束下的Lagrange方程。


#example(subname: [单摆])[
  对于单摆摆长为$l$，质量为$m$，广义坐标取摆角$theta$，则
  $
    L = 1/2 m l^2 dot(theta)^2 + m g l cos(theta)
  $
  自由度为1，选$theta$为广义坐标，利用Lagrange方程
  $
    pdv(L, theta) - dv(, t)pdv(L, dot(theta)) = - m l^2 dot.double(theta) - m g l sin theta = 0\
    => dot.double(theta) + g/l sin theta = 0
  $
  #newpara()
  另一方面，我们也可以考虑约束
  $
    G(x,y) = sqrt(x^2 + y^2) - l = 0
  $
  $
    L = 1/2 m (dot(x)^2 + dot(y)^2) - m g y
  $
  由Lagrange乘子法，有
  $
    pdv(L, x) - dv(, t)pdv(L, dot(x)) + lambda pdv(G, x) = 0\
    pdv(L, y) - dv(, t)pdv(L, dot(y)) + lambda pdv(G, y) = 0\
    G(x,y) = 0
  $
  则有
  $
    - m dot.double(x) + lambda x/l = 0\
    - m g - m dot.double(y) + lambda y/l = 0\
    sqrt(x^2 + y^2) = l
  $
  进一步代入
  $
    x = l sin theta, y = l cos theta
  $
  就可以得到上面的方程
  #newpara()
  最后用Newton定律，张力为$T$
  $
    - T x/l = m dot.double(x)\
    - T y/l - m g = m dot.double(y)\
    sqrt(x^2 + y^2) = l
  $
  就可以知道事实上$lambda = - T$。

  *Lagrange乘子事实上与约束力相关。*
]

现在我们说明Lagrange乘子事实上与约束力相关。

先前我们推导Lagrange方程有
$
  dv(, t) pdv(T, dot(q)_i) - pdv(T, q_i) = Q_i
$
其中$Q_i$是广义力，如果其有势$Q_j = - pdv(V, q_j)$，我们就把它放进去
$
  L = T - V
$
事实上如果还有不是保守力的广义力$Q_i^"nc"$，则
$
  dv(, t) pdv(L, dot(q)_i) - pdv(L, q_i) = Q_i^"nc" = sum_j lambda_j pdv(G_j, q_i)
$
事实上该广义力就是约束力，最后一个等号是完整系Lagrange乘子法的结论。如果不考虑约束条件，而是直接将$G_j$相关的力作为主动力。

考虑广义力的虚功
$
  sum_j Q_j delta q_j & = sum_j sum_i lambda_j pdv(G_j, q_i) delta q_i \
                      & = sum_j lambda_j delta G_j = 0
$
因此$G_i$的完整约束是理想约束。

Lagrange方程适用于保守系，即主动力为有势力的情况。

== 关于变分法和Hamilton原理的讨论

=== 端点不固定

$
  I[y] = integral_(x_1)^(x_2) F(y, dot(y), x) dd(x)
$
我们当时使用分部积分
$
  integral_(x_1)^(x_2) pdv(F, dot(y)) dot(delta y) dd(x) = [pdv(F, dot(y)) delta y]_(x_1)^(x_2) - integral_(x_1)^(x_2) dv(, x)pdv(F, dot(y)) delta y dd(x)
$
如果端点不固定，但是
$
  pdv(F, dot(y)) = 0
$
也可以使用Euler-Lagrange方程
$
  pdv(F, y) - dv(, x)pdv(F, dot(y)) = 0
$

=== 高阶、高维变分问题

我们在上面进行了讨论。

=== Hamilton原理

Hamilton原理和以前学过的与之等价的(即可以相互推导得到的)原理或方程，均可取作力学第一性原理。但Hamilton原理具有如下独特的优点。
- 从整体考查体系的运动规律，挑出真实运动。这是积分形式的变分原理的优点。
- 具有直观紧凑的形式$delta S = 0$。
- Hamilton原理着眼于作用量，便于推广到光学、电磁场理论、量子理论。事实上Hamilton原理已成为现代物理学理论中的第一性原理。
- 积分形式的变分原理有其他不同形式，其中以Hamilton原理最为简单方便。

作为第一性原理是不用也是不可能证明的。其正确性是用由它推导出的结论和实验进行比较得到检验。由于在经典力学中已经有直接得到实验检验的Newton运动定律，从而知道，与Newton动力学方程等价的Hamilton作用量表达式中应有$L = T-V$，因而Hamilton原理似乎是可以推出来的。其实这是一种错觉。

事实上在一些现代物理的领域(例如量子场论)，在建立理论的过程中，难以从已有的实验事实直观地归纳出定律或运动方程。它往往采用以下步骤：根据物理学理论的若干实验检验过的基本要求(如对称性等)和来自相关实验事实的启示，构造出Lagrange量，然后由Hamilton原理导出运动方程，通过从运动方程得到的结果和实验比较，来检验理论的正确与否。如果理论与实验有距离，再分析存在的问题，修改Lagrange量，从而由Hamilton原理导出的运动方程也得到修改。如此不断提高认识，改进理论。

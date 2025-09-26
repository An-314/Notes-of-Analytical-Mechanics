#import "@preview/scripst:1.1.1": *

= Lagrange方程

== 完整系

=== 约束

Newton力学中需要考虑约束和约束力的问题。

#example(subname: [摆球系统的约束])[
  例如小球和轻杆组成的系统，满足Newton方程
  $
    - m g vb(k) + vb(R) = m dv(vb(x), t, 2)\
  $
  #figure(
    image("pic/2.0.svg", width: 30%),
    numbering: none,
  )
  有约束
  $
    x^2 + y^2 + z^2 = l^2\
  $
  从而只有两个自由度$theta, phi$。
]

#definition(subname: [约束])[
  对于$N$个粒子的*约束*
  $
    f_j (vb(r)_1, vb(r)_2, ..., vb(r)_N, dv(vb(r)_1, t), dv(vb(r)_2, t), ..., dv(vb(r)_N, t), t) = 0, j = 1, 2, ..., k
  $
  如果约束不显含速度，则称为*完整约束*，否则称为*非完整约束*
  $
    f_j (vb(r)_1, vb(r)_2, ..., vb(r)_N, t) = 0, j = 1, 2, ..., k
  $
]
完整约束可以减少系统的自由度。全是完整约束的系统称为*完整系*，否则称为*非完整系*。

约束中不显含时间的称为*稳定约束*，否则称为*非稳定约束*。

原本$3N$个约束自由度，经过$k$个约束后，剩下$3N-k$个自由度。

还有一类用不等式表示的约束，称为*可解约束*，因为在不等号成立的条件下不形成约束；而只有等号成立时才形成约束，所以等式约束是*不可解约束*。可解约束可以分段处理而解除。

=== 广义坐标

#definition(subname: [广义坐标])[
  一个力学体系中，$k$个约束使原来$3N$个坐标不再独立，引入*广义坐标*$q_1, q_2, ..., q_s, s=3N-k$互相独立，使得
  $
    vb(r)_i = vb(r)_i (q_1, q_2, ..., q_s, t), i = 1, 2, ..., N
  $

  若为完整系，则不显含$t$
  $
    vb(r)_i = vb(r)_i (q_1, q_2, ..., q_s), i = 1, 2, ..., N
  $
]

#example(subname: [摆球系统的广义坐标])[
  例如刚才的摆球系统
  $
    mat(x; y; z) = l mat(sin theta cos phi; sin theta sin phi; cos theta)
  $
  其中广义坐标就是$theta, phi$。
]

#newpara()

在完整系中
$
  dot(vb(r)_i) = dv(vb(r)_i, t) = sum_j pdv(vb(r)_i, q_j) dv(q_j, t) + pdv(vb(r)_i, t) = sum_j pdv(vb(r)_i, q_j) dot(q)_i + pdv(vb(r)_i, t)
$
这是速度与广义速度的关系。

#proposition(subname: [速度与广义速度的关系])[
  在完整系中，粒子$i$的速度与广义速度的关系为
  $
    dot(vb(r)_i) = sum_j pdv(vb(r)_i, q_j) dot(q)_j + pdv(vb(r)_i, t)
  $
]

从而
$
  pdv(dot(vb(r)_i), q_k) & = sum_j pdv(vb(r)_i, q_j, q_k) dot(q)_j + pdv(vb(r)_i, t, q_k) \
                         & = sum_j pdv(, p_j) (pdv(vb(r)_i, q_k)) dot(q)_j + pdv(, t) (pdv(vb(r)_i, q_k)) \
                         & = dv(, t) (pdv(vb(r)_i, q_k))
$
以及
$
  pdv(dot(vb(r)_i), dot(q)_k) = pdv(vb(r)_i, q_k)
$

== 虚功原理

=== 虚位移

#definition(subname: [虚位移])[
  在时刻$t$，力学体系处于某一位置，若将体系从该位置*虚*地移动到另一个位置，而不考虑时间的变化，这种位移称为*虚位移*，记为$delta vb(r)_i$。满足约束
  $
    f_j (vb(r)_1 + delta vb(r)_1, vb(r)_2 + delta vb(r)_2, ..., vb(r)_N + delta vb(r)_N, t) = 0, j = 1, 2, ..., k
  $
]
这和实位移不同，实位移是随着时间变化的
$
  f_j (vb(r)_1 + dd(vb(r)_1), vb(r)_2 + dd(vb(r)_2), ..., vb(r)_N + dd(vb(r)_N), t + dd(t)) = 0, j = 1, 2, ..., k
$
在稳定约束下，实位移是虚位移中的一种；非稳定约束下，实位移和虚位移是不同的。虚位移是等时变更。

与微分关系的区别在于
$
  delta f = sum_i grad_(vb(r)_i) f dot delta vb(r)_i
$
$
  dd(f) = sum_i grad_(vb(r)_i) f dot dd(vb(r)_i) + pdv(f, t) dd(t)
$
从而有
$
  delta vb(r)_i = sum_j pdv(vb(r)_i, q_j) delta q_j
$
$
  delta dv(q_i, t) = dv(delta q_i, t)
$

=== 理想约束

在系统受到约束时，运动情况和自由系统不同，引起这种改变的是约束作用的约束力。

#definition(subname: [理想约束])[
  如果约束力$vb(R)_i$与任意虚位移$delta vb(r)_i$的*总虚功*为零
  $
    sum_i vb(R)_i dot delta vb(r)_i = 0
  $
  则称该约束为*理想约束*，否则称为*非理想约束*。
]
这些约束可以在方程组解除，称为可解约束。

#example(subname: [理想约束的例子])[
  1. 刚性约束：$vb(r)_i - vb(r)_j = "const"$，约束力为内力，$vb(R)_i = - vb(R)_j$，总虚功为零。
  2. 光滑面约束：约束力垂直于接触面，虚位移在切面上，总虚功为零。
  3. 滑轮和绳子约束：绳子张力沿绳子方向，虚位移垂直于绳子方向，总虚功为零。
]

#example(subname: [球和光滑面的系统], lab: "ex2.1")[
  一个球$m$放在被半径为$R$的柱截掉的置于光滑面上的长方体块上，如图所示
  #figure(
    image("pic/2.1.svg", width: 20%),
    numbering: none,
  )
  稳定约束为
  $
    R^2 = (x- X)^2 + (y - h)^2\
    (Y = 0)
  $
  则有
  $
    sum_i vb(R)_i dot delta vb(r)_i & = vb(R)_M dot delta vb(X) + vb(N)_M dot delta vb(r)_M + vb(N)_m dot delta vb(r)_m \
                                    & = 0 + vb(N)_M dot delta(vb(r)_M - vb(r)_m) = 0
  $
  则为理想约束。
]

=== 虚功原理

#theorem(subname: [虚功原理])[
  对于静止平衡质点体系，若约束为理想约束，外力为$vb(F)_i$、约束力为$vb(R)_i$，则
  $
    sum_i (vb(F)_i + vb(R)_i) dot delta vb(r)_i = 0\
    delta W = sum_i vb(F)_i dot delta vb(r)_i = 0
  $
]
不再包含约束力。

#example(subname: [杆的平衡])[
  一匀质杆质量为$M$，长为$L$，一端固定在光滑水平面上，地面水平施加一水平力$F$，求杆与竖直方向夹角$theta$。
  #figure(
    image("pic/2.2.svg", width: 20%),
    numbering: none,
  )
  $
    delta W = M g delta y + F delta x = 0\
    (1/2 M g cos theta - F sin theta) L delta theta = 0\
  $
  $
    F = 1/2 M g cot theta
  $
  事实上这个过程等价于力矩为零。
]

$
  sum_i vb(F)_i dot delta vb(r)_i & = sum_i vb(F)_i dot sum_j pdv(vb(r)_i, q_j) delta q_j \
                                  & = sum_j (sum_i vb(F)_i dot pdv(vb(r)_i, q_j)) delta q_j = 0 \
                                  & = sum_j Q_j delta q_j
$

=== 广义力

#definition(subname: [广义力])[
  对于质点$i$受力$vb(F)_i$，引入*广义坐标*$q_j$，则与$q_j$对应的*广义力*为
  $
    Q_j = sum_i vb(F)_i dot pdv(vb(r)_i, q_j)
  $
]
而虚功原理要求$delta W = sum_j Q_j delta q_j = 0$，$delta q_j$互相独立，因此$Q_j = 0$。

从而就有
#theorem(subname: [广义力与静平衡])[
  受到理想约束的质点体系处于静平衡的条件是：广义力$Q_j = 0$。
]

== D'Alembert原理

虚功原理是针对静止平衡的质点体系，D'Alembert原理将其推广到运动的质点体系。

Newton动力学方程为
$
  vb(F)_i + vb(R)_i = m_i dot.double(vb(r)_i)
$
有
$
  sum_i vb(F)_i dot delta vb(r)_i = sum_i m_i dot.double(vb(r)_i) dot delta vb(r)_i
$

#theorem(subname: [D'Alembert原理])[
  对于*受理想约束*的质点体系，外力为$vb(F)_i$、约束力为$vb(R)_i$，则
  $
    sum_i (vb(F)_i - m_i dot.double(vb(r)_i)) dot delta vb(r)_i = 0\
    delta W = sum_i m_i dot.double(vb(r)_i) dot delta vb(r)_i
  $
  其中$- m_i dot.double(vb(r)_i)$称为*D'Alembert惯性力*。
]

#example(subname: [球和光滑面的系统])[
  考虑 @ex2.1 的系统，利用D'Alembert原理有
  $
    - M g vu(j) dot delta vb(r)_M - m g vu(j) dot delta vb(r)_m = M dot.double(vb(r))_M dot delta vb(r)_M + m dot.double(vb(r))_m dot delta vb(r)_m
  $
  其中
  $
    vb(r)_M = X vu(x)\
    vb(r)_m = x vu(x) + y vu(y)
  $
  就有
  $
    - m g delta y = M dot.double(X) delta X + m (dot.double(x) delta x + dot.double(y) delta y)
  $
  现在寻找广义坐标，考虑到
  $
    x = X - R sin theta\
    y = h - R cos theta
  $
  就有广义坐标$(X, theta)$，以及下面的微分关系
  $
    delta x = delta X - R cos theta delta theta\
    delta y = R sin theta delta theta\
    dot.double(x) = dot.double(X) + R sin theta dot(theta)^2 - R cos theta dot.double(theta)\
    dot.double(y) = R cos theta dot(theta)^2 + R sin theta dot.double(theta)
  $
  D'Alembert原理变为
  $
    - m g R sin theta delta theta = \ M dot.double(X) delta X + m (( dot.double(X) + R sin theta dot(theta)^2 - R cos theta dot.double(theta)) (delta X - R cos theta delta theta) + (R cos theta dot(theta)^2 + R sin theta dot.double(theta)) (R sin theta delta theta))
  $
  $
    ((M+m) dot.double(X) - m R cos theta dot.double(theta) + m R sin theta dot(theta)^2) delta X \ + (m R^2 dot.double(theta) - m g R cos theta + m R sin theta dot.double(X)) delta theta = 0
  $
  得到广义力
  $
    Q_X = (M+m) dot.double(X) - m R cos theta dot.double(theta) + m R sin theta dot(theta)^2 = 0\
    Q_theta = m R^2 dot.double(theta) - m g R cos theta + m R sin theta dot.double(X) = 0
  $
  这两式就是该系统的运动方程
  $
    mat(M+m, - m R cos theta; -m R cos theta, m R^2) mat(dot.double(X); dot.double(theta)) + mat(m R sin theta dot(theta)^2; m g R cos theta) = mat(0; 0)
  $
]

#example(subname: [转动的杆与小球], lab: "ex2.2")[
  对于杆上的小球，杆以任意角速度$omega$绕固定轴以夹角$alpha$转动。
  $
    x = q sin alpha cos omega t\
    y = q sin alpha sin omega t\
    z = q cos alpha
  $
  D'Alembert原理为
  $
    - m g vb(g) dot delta vb(r) = m dot.double(vb(r)) dot delta vb(r) \
  $
  其中
  $
    dot(x) & = dot(q) sin alpha cos omega t - omega q sin alpha sin omega t \
    dot.double(x) & = dot.double(q) sin alpha cos omega t - 2 omega dot(q) sin alpha sin omega t - omega^2 q sin alpha cos omega t \
  $
  代入方程有
  $
    dot.double(q) - omega^2 q sin^2 alpha + g cos alpha = 0\
  $
]

== Lagrange方程

对于$N$个质点体系，受到$k$个约束，有$q_1,...,q_s$个广义坐标
$
  delta vb(r)_i = sum_j pdv(vb(r)_i, q_j) delta q_j\
$
有D'Alembert原理
$
  sum_i vb(F)_i dot delta vb(r)_i &= sum_j pdv(vb(r)_i, q_j) delta q_j = sum_j Q_j delta q_j\
  &= sum_i m_i dot.double(vb(r)_i) dot sum_j pdv(vb(r)_i, q_j) delta q_j = sum_j (sum_i m_i dot.double(vb(r)_i) pdv(vb(r)_i, q_j)) delta q_j
$
这就意味着广义力
$
  Q_j = sum_i m_i dot.double(vb(r)_i) pdv(vb(r)_i, q_j)
$
利用Lagrange关系
$
  dv(, t) pdv(vb(r)_i, q_j) = pdv(dot(vb(r)_i), q_j)\
  pdv(vb(r)_i, q_j) = pdv(dot(vb(r)_i), dot(q)_j)
$
$
  Q_j = sum_i m_i dot.double(vb(r)_i) pdv(vb(r)_i, q_j) &= dv(, t) (sum_i m_i dot(vb(r)_i) pdv(dot(vb(r))_i, dot(q_j))) - 2 m_i dot(vb(r)_i) pdv(dot(vb(r))_i, q_j) \
  &= dv(, t) (sum_i m_i/2 pdv(dot(vb(r))_i^2, dot(q_j))) - sum_i m_i/2 pdv(dot(vb(r))_i^2, q_j) \
  &= dv(, t) pdv(T, dot(q_j)) - pdv(T, q_j)
$
其中动能
$
             T & = sum_i 1/2 m_i dot(vb(r))_i^2 \
  dot(vb(r)_i) & = sum_j pdv(vb(r)_i, q_j) dot(q)_j + pdv(vb(r)_i, t)
$
动能分为三项
$
    T & = T_0 + T_1 + T_2 \
  T_0 & = sum_i 1/2 m_i (pdv(vb(r)_i, t))^2 \
  T_1 & = sum_i sum_j m_i pdv(vb(r)_i, t) dot pdv(vb(r)_i, q_j) dot(q)_j \
  T_2 & = sum_i sum_j sum_k 1/2 m_i pdv(vb(r)_i, q_j) pdv(vb(r)_i, q_k) dot(q)_j dot(q)_k \
$
其中$T_0$与时间有关，$T_1$与时间和广义速度线性相关，$T_2$与广义速度平方相关。得到Lagrange方程
#theorem(subname: [Lagrange方程])[
  对于受理想约束的质点体系，动能为$T$，广义力为$Q_j$，则有
  $
    dv(, t) pdv(T, dot(q_j)) - pdv(T, q_j) = Q_j
  $
]
该式由D'Alembert原理直接导出，适用于理想约束和完整约束的系统。与Newton方程等价，但不含约束力。

而对于有势力
$
  vb(F)_i & = - grad_(vb(r)_i) U(vb(r)_1, vb(r)_2, ..., vb(r)_N) \
      Q_j & = sum_i vb(F)_i dot pdv(vb(r)_i, q_j) = - pdv(U, q_j)
$
代入Lagrange方程
$
  dv(, t) pdv(T, dot(q_j)) - pdv(T, q_j) + pdv(U, q_j) = 0\
  dv(, t) pdv(T, dot(q_j)) - pdv((T - U), q_j) = 0
$
对于完整系，$vb(r)_i$不显含$dot(q)_j$，因此
$
  pdv(V, dot(q)_j) = sum_j grad_(vb(r)_i) V dot pdv(vb(r)_i, q_j) = 0
$
得到Euler-Lagrange方程
#theorem(subname: [Euler-Lagrange方程])[
  对于受理想约束的保守质点体系，动能为$T$，势能为$U$，则有
  $
    dv(, t) pdv(L, dot(q_j)) - pdv(L, q_j) = 0\
  $
  其中$L = T - U$为*Lagrange量*。
]
如果一个系统除了有势力还有非有势力，则其他力以广义力的形式加入方程右边
$
  dv(, t) pdv(L, dot(q_j)) - pdv(L, q_j) = Q_j^"非"
$

#example(subname: [转动的杆与小球])[
  回到 @ex2.2 的系统，利用Lagrange方程来求解
  $
    L & = T - V = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) - m g z \
      & = 1/2 m (dot(q)^2 + omega^2 q^2 sin^2 alpha) - m g q cos alpha \
  $
  由Lagrange方程
  $
    dv(, t) (m dot(q)) - (m omega^2 q sin^2 alpha - m g cos alpha) = 0\
  $
  得到
  $
    dot.double(q) - omega^2 q sin^2 alpha + g cos alpha = 0
  $
]

#example(subname: [一维谐振子])[
  质量为$m$的质点在一维谐振子势场中运动，势能为
  $
    U = 1/2 k x^2
  $
  则Lagrange量为
  $
    L = T - U = 1/2 m dot(x)^2 - 1/2 k x^2
  $
  Lagrange方程为
  $
    dv(, t) pdv(L, dot(x)) - pdv(L, x) = 0\
    m dot.double(x) + k x = 0
  $
]

#example(subname: [LC振荡电路])[
  电感能量为
  $
    1/2 L I^2 = 1/2 L dot(Q)^2
  $
  电容能量为
  $
    Q^2 / 2C
  $
  则Lagrange量为
  $
    L = T - U = 1/2 L dot(Q)^2 - Q^2 / 2C
  $
  Lagrange方程为
  $
    dv(, t) pdv(L, dot(Q)) - pdv(L, Q) = 0\
    dot.double(Q) + Q /(L C) = 0
  $
  #note[
    在机械系统中，机械能为动能和势能之和；在电磁系统中，总能量为电能和磁能之和，而Lagrange量为磁能减去电能。
  ]
]

== Lagrange方程的解法

Lagrange方程是$s$个二阶微分方程组成的方程组
$
  dv(, t) pdv(L, dot(q_j)) - pdv(L, q_j) = Q_j^"非", j = 1, 2, ..., s
$

=== 循环坐标、循环积分

考虑
$
  L = L(q_1, q_2, ..., q_s, dot(q)_1, dot(q)_2, ..., dot(q)_s, t)
$
如果$L$不显含某个广义坐标$q_i$，则称$q_i$为*循环坐标*。

#definition(subname: [正则共轭动量])[
  对于广义坐标$q_i$，定义与其对应的*正则共轭动量* / 广义动量为
  $
    p_i = pdv(L, dot(q)_i)
  $
]
Lagrange方程为
$
  dv(, t) p_i - pdv(L, q_i) = 0
$
对于循环坐标$q_i$，有
$
  pdv(L, q_i) = 0
$
因此
$
  dv(, t) p_i = pdv(L, q_i) = 0
$
这意味着$p_i$是*守恒量*，称为*循环积分*，是Lagrange方程的第一积分，其物理意义是动量守恒。

#example(subname: [中心力场中质点])[
  在球坐标系小段距离平方为
  $
    dd(s)^2 = dd(r)^2 + r^2 dd(theta)^2 + r^2 sin^2 theta dd(phi)^2
  $
  Lagrange量为
  $
    L = T - U = 1/2 m (dot(r)^2 + r^2 dot(theta)^2 + r^2 sin^2 theta dot(phi)^2) - V(r)
  $
  $phi$就是循环坐标，对应的守恒量为
  $
    p_phi = pdv(L, dot(phi)) = m r^2 sin^2 theta dot(phi)
  $
  这是角动量的$z$分量。
]

=== 能量积分

如果Lagrange量不显含时间$t$，则称系统为*孤立系统*
$
  pdv(L, t) = 0
$
就有
$
  dv(L, t) &= sum_i pdv(L, q_i) dot(q)_i + sum_i pdv(L, dot(q)_i) dot.double(q)_i + pdv(L, t) = sum_i (dv(, t) (pdv(L, dot(q)_i)) dot(q)_i + pdv(L, dot(q_i)) dv(, t) dot(q)_i)\
  &= sum_i dv(, t) (pdv(L, dot(q)_i) dot(q)_i) = 0
$
从而
$
  dv(, t) (sum_i pdv(L, dot(q)_i) dot(q)_i - L) = 0
$
即
$
  H = sum_i pdv(L, dot(q)_i) dot(q)_i - L = sum_i p_i dot(q)_i - L
$
为守恒量，事实上$H$就是Hamilton量。

$V$不显含$dot(q)_i$有
$
  sum_i pdv(U, dot(q)_i) dot(q)_i - L &= sum_i pdv(T, dot(q)_i) dot(q)_i - L \
  &= sum_i pdv(T_0, dot(q)_i) dot(q)_i + sum_i pdv(T_1, dot(q)_i) dot(q)_i + sum_i pdv(T_2, dot(q)_i) dot(q)_i - (T - V)\
  &= T_1 + 2 T_2 - (T_0 + T_1 + T_2) + V = T_2 - T_0 + V\
$
对于*稳定约束*的*完整系*，$T_0 = 0, T_1 = 0$，因此
$
  E = T + V
$
*广义能量*守恒。

#note(subname: [关于共轭的讨论])[
  事实上上面的讨论是在说$L$与时间无关的情况下，时间的共轭量为Hamilton量。

  *共轭*指的是 Legendre 对偶：对速度进行 Legendre 变换
  $
    H(q_i, p_i, t) = sum_i p_i dot(q)_i - L(q_i, dot(q)_i, t)
  $
  事实上相空间上的一形式$theta = sum_i p_i dd(q)_i$就是由Legendre变换得到的。Lagrange力学通过Legendre变换“升维”到相空间后自然形成的几何结构是辛结构。

  *辛几何*中，在*相空间*上坐标由位置$q_i$和动量$p_i$组成，$2s$维相空间$(q_i, p_i)$上有自然的辛结构，Hamilton量$H$生成Hamilton流，从而系统的运动可以看作是相空间中的一条曲线。

  定义典范一形式与辛二形式：
  $
    theta = sum_i p_i dd(q)_i\
    omega = dd(theta) = sum_i dd(p)_i and dd(q)_i
  $
  $omega$是闭的非退化2-形式，即$dd(omega) = 0$。$(p_i,q_i)$是*典范坐标*，$omega$称为*辛结构*。相空间$(q_i, p_i)$是一个*辛流形*。
]

#note(subname: [关于守恒的讨论])[
  Hamilton方程是说
  $
    dot(q)_i = pdv(H, p_i), dot(p)_i = - pdv(H, q_i)
  $
  定义$X_H$为Hamilton向量场
  $
    X_H = sum_i (pdv(H, p_i) pdv(, q_i) - pdv(H, q_i) pdv(, p_i))
  $
  就有内积算子，将2-形式降为1-形式
  $
    i_(X_H) omega = - dd(H) = - sum_i (pdv(H, p_i) dd(p)_i + pdv(H, q_i) dd(q)_i)
  $
  其中
  $
    i_(X_H) omega (Y) = omega(X_H, Y) = {X_H, Y}
  $

  Poisson括号是相空间中两个广义变量的一个重要结构，定义为
  $
    {f, g} = sum_i (pdv(f, q_i) pdv(g, p_i) - pdv(f, p_i) pdv(g, q_i))
  $
  其中$f, g$是相空间中的两个函数。Poisson括号满足反对称性、双线性、Leibniz法则和Jacobi恒等式。有基本正则关系
  $
    {q_i, q_j} = 0, {p_i, p_j} = 0, {q_i, p_j} = delta_(i j)
  $
  #newpara()

  对于任意的可观测量$f$，Hamilton方程可以写成
  $
    dot(f) = {f, H} + pdv(f, t)
  $
  如果$f$不显含时间，则
  $
    dot(f) = {f, H}
  $

  #newpara()

  辛变换、典范变换、正则变换是指保持辛结构$omega$不变的变换，也是保持泊松括号结构不变的变换。若该变换是系统的对称性，应当不改变动力学，即不改变Hamilton量$H$，则称该变换为*典范对称变换*。

  Hamilton函数$G$对应一个Hamilton向量场$X_G$，定义为
  $
    i_(X_G) omega = - dd(G)
  $
  其中$i_(X_G)$是内积算子，任一函数$G$可以通过泊松括号生成*无穷小变换*：
  $
    delta f = epsilon {f, G}
  $
  若$G$为守恒量，则它生成的变换是系统的对称变换，这就是沿着向量场的无穷小流。

  事实上Poisson括号本身就满足反对称性和Jacobi恒等式，因此Poisson括号本身就是一个Lie代数。而其每个函数$G$生成的群
  $
    e^(epsilon_X_G)
  $
  也是一个*1参数Lie群*，这样的流组成的群称为*辛群*。

  Noether 定理说明了守恒量与对称变换之间的联系：每一个连续对称变换都对应一个守恒量，反之亦然。

  Hamilton函数和Hamilton量的区别在于，Hamilton函数是任意的相空间函数，而Hamilton量是系统的能量函数，是动力学的生成元。这就有点像量子力学中的Hamilton算符和能量本征值的区别。

  例如上面的循环坐标$q_i$，其Hamilton函数$G=q_i$，则
  $
    delta f = epsilon {f, q_i} = - epsilon pdv(f, p_i)
  $
  这就是动量的平移变换，是系统的对称性，因此$p_i$是守恒量。

  以及对于时间不显含的系统，其Hamilton函数$G=H$，则
  $
    delta f = epsilon {f, H} = epsilon dot(f)
  $
  这就是时间平移变换，是系统的对称性，因此$H$是守恒量。
]

#newpara()


=== Routh函数

对循环座标$q_i$，引入Routh函数
$
  R_i & = L(q_1, q_2, ..., q_(i-1), q_(i+1), ..., q_s, dot(q)_1, dot(q)_2, ..., dot(q)_(i-1), dot(q)_(i), dot(q)_(i+1), ..., dot(q)_s, p_i, t) - p_i dot(q)_i
$
此时$p_i$为常数，Routh函数不显含$q_i$，因此实现了降阶
$
  dd(R_i) & = dd(L) - p_i dd(dot(q)_i) \
          & = sum_(j != i) (pdv(L, q_j) dd(q)_j + pdv(L, dot(q)_j) dd(dot(q)_j)) + pdv(R_i, t) dd(t)
$
降阶后的Routh函数满足原来的Lagrange方程
$
  dv(, t) pdv(R_i, dot(q)_j) - pdv(R_i, q_j) = 0, j != i
$

== 关于Lagrange方程的讨论

=== 点变换

对于广义坐标${q_i}$，Lagrange量为$L(q_i, dot(q)_i, t)$，有Lagrange方程
$
  dv(, t) pdv(L, dot(q)_j) - pdv(L, q_j) = 0
$
有另一套广义坐标${Q_i}$
$
  q_i = q_i (Q_1, Q_2, ..., Q_s, t)\
$
是*点变换*
$
  L(Q_i, dot(Q)_i, t) = overline(L)(Q_i, dot(Q)_i, t) = L(q_i (Q_j, t), sum_j pdv(q_i, Q_j) dot(Q)_j + pdv(q_i, t), t) \
$
也有其Lagrange方程
$
  dv(, t) pdv(overline(L), dot(Q)_j) - pdv(overline(L), Q_j) = 0
$
事实上
$
  dv(, t) pdv(overline(L), dot(Q)_j) & = dv(, t) sum_i (pdv(L, dot(q)_i) pdv(dot(q)_i, dot(Q)_j) + pdv(L, q_i) pdv(q_i, dot(Q)_j)) = dv(, t) sum_i pdv(L, dot(q)_i) pdv(dot(q)_i, dot(Q)_j) \
  &= dv(, t) sum_i pdv(L, dot(q)_i) pdv(q_i, Q_j) \
  &= sum_j (dv(, t) (pdv(L, dot(q)_i)) pdv(q_i, Q_j) + pdv(L, dot(q)_i) pdv(dot(q)_i, Q_j)) \
  &= sum_j (pdv(L, q_i) pdv(q_i, Q_j) + pdv(L, dot(q)_i) pdv(dot(q)_i, Q_j)) \
  &= pdv(overline(L), Q_j)
$

=== Lagrange方程的通解

相差一个广义坐标和时间的任意函数
$
  f(q,t)
$
的全导数的Lagrange量
$
  L_1 = L + dv(f, t) = L + sum_i pdv(f, q_i) dot(q)_i + pdv(f, t)
$
也满足Lagrange方程
$
  pdv(, dot(q)_j) dv(f, t) = pdv(f, q_j)\
  dv(, t) pdv(f, q_j) = pdv(, q_j) dv(f, t)
$
从而
$
  dv(, t) pdv(, dot(q)_j) dv(f, t) - pdv(, q_j) dv(f, t) = 0
$
这就意味着Lagrange量并不是唯一的。

=== 标度变换

对于Lagrange量$L(q_i, dot(q)_i, t)$，考虑标度变换
$
  q'_i = alpha q_i, t' = beta t
$
$
  L'(q'_i, dot(q')_i, t') = L(q_i, dot(q)_i, t) = L(q'_i / alpha, beta / alpha dot(q')_i, beta t)
$
则有
$
  dv(, t') pdv(L', dot(q')_j) - pdv(L', q'_j) = 0
$

=== 广义势函数

我们只考虑了势能和速度无关的情况，现在考虑势能与速度有关的情况，广义势函数
$
  V = V(q_i, dot(q)_i, t)
$
广义力为
$
  Q_i = dv(, t) pdv(V, dot(q)_i) - pdv(V, q_i)
$
Lagrange方程为
$
  dv(, t) pdv(L, dot(q)_i) - pdv(L, q_i) = 0
$
仍然成立。

#example(subname: [广义势函数])[
  对于电磁场$vb(E),vb(B)$以及粒子$m,q$，有受力
  $
    vb(F) & = q (vb(E) + vb(v) times vb(B)) = m dot(vb(v)) \
  $
  考虑磁矢量势和电标量势
  $
    vb(B) = curl vb(A)\
    vb(E) = - grad phi - pdv(vb(A), t)
  $
  从而
  $
    vb(F) = - q (grad phi + pdv(vb(A), t)) + q vb(v) times (curl vb(A))\
  $
  考虑到
  $
    grad (vb(A) dot vb(B)) = vb(A) times (curl vb(B)) + vb(B) times (curl vb(A)) + (vb(A) dot grad) vb(B) + (vb(B) dot grad) vb(A)
  $
  就有
  $
    vb(v) times (curl vb(A)) = grad (vb(A) dot vb(v)) - (vb(v) dot grad) vb(A)
  $
  因此
  $
    vb(F) & = - q (grad phi + pdv(vb(A), t)) + q (grad (vb(A) dot vb(v)) - (vb(v) dot grad) vb(A)) \
          & = - q grad (phi - vb(A) dot vb(v)) - q (pdv(vb(A), t) + (vb(v) dot grad) vb(A))
  $
  有
  $
    F_i & = - q pdv(, x_i)(phi - vb(A) dot vb(v)) - q (pdv(A_i, t) + (vb(v) dot grad) A_i) \
        & = - q pdv(, x_i)(phi - sum_i dot(x)_i A_i) - q(pdv(A_i, t) + sum_j pdv(A_i, x_j) dot(x)_j) \
        & = - q pdv(, x_i)(phi - sum_i dot(x)_i A_i) - q dv(A_i, t) \
        & = - pdv(V, x_i) + dv(, t) pdv(V, dot(x)_i)
  $
  对于广义势函数
  $
    V = q (phi - vb(A) dot vb(v))\
  $
  有Lagrange量
  $
    L = T - V = 1/2 m dot(vb(x))^2 - q (phi - vb(A) dot vb(v))\
  $
  Lagrange方程为
  $
    dv(, t) pdv(L, dot(x)_i) - pdv(L, x_i) = 0
  $
  $
    m dot.double(vb(x)) = - q (grad phi + pdv(vb(A), t)) + q vb(v) times (curl vb(A))
  $
  这就是带电粒子在电磁场中的运动方程。
]

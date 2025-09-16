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

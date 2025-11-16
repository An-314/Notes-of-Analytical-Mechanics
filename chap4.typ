#import "@preview/scripst:1.1.1": *

= 有心力

有心力问题一般由两体问题给出。相互作用势为$V = V(r)$，其中$r = abs(vb(r)_2 - vb(r)_1)$是两质点间距离。

== 对称性与不变量

设两体的质量为$m_1, m_2$，Kepler问题的Lagrange量为
$
  L(vb(r)_1, dot(vb(r)_1), vb(r)_2, dot(vb(r)_2),t) = 1/2 m_1 dot(vb(r))_1^2 + 1/2 m_2 dot(vb(r))_2^2 - V(abs(vb(r)_2 - vb(r)_1))
$

=== 空间平移对称性

考虑任意平移变换
$
  vb(r)_1 -> vb(r)_1 + vb(a), vb(r)_2 -> vb(r)_2 + vb(a)
$
其中$vb(a)$是任意常矢量，表示空间平移。由于势能只依赖于两点间距离$r$，故势能不变，动能也不变，Lagrange量不变，即
$
  L(vb(r)_1 + vb(a), dot(vb(r)_1), vb(r)_2 + vb(a), dot(vb(r)_2),t) = L(vb(r)_1, dot(vb(r)_1), vb(r)_2, dot(vb(r)_2),t)
$
Lagrange量具有平移不变性$RR^3$。

如果$vb(a) -> delta vb(a)$，$delta vb(a)$是无穷小量，就是一个*无穷小变换*。

相应的无穷小变换不变性就是
$
  L(vb(r)_1 + delta vb(a), dot(vb(r)_1), vb(r)_2 + delta vb(a), dot(vb(r)_2),t) &= L(vb(r)_1, dot(vb(r)_1), vb(r)_2, dot(vb(r)_2),t)\
  &= L(vb(r)_1, dot(vb(r)_1), vb(r)_2, dot(vb(r)_2),t) + delta vb(a) dot (grad_1 + grad_2) L
$
就有
$
  (grad_1 + grad_2) L = 0
$
由于正则共轭动量定义为
$
  p = pdv(L, dot(q))
$
根据Lagrange方程，有
$
  pdv(L, x_1) = dv(p_(1x), t), pdv(L, y_1) = dv(p_(1y), t), pdv(L, z_1) = dv(p_(1z), t),\
  pdv(L, x_2) = dv(p_(2x), t), pdv(L, y_2) = dv(p_(2y), t), pdv(L, z_2) = dv(p_(2z), t)
$
就有
$
  grad_1 L = dv(, t) vb(p)_1, grad_2 L = dv(, t) vb(p)_2
$
从而有
$
  dv(, t) (vb(p)_1 + vb(p)_2) = 0
$
即总动量守恒。

这说明，平移不变性对应着动量守恒。

=== 转动对称性

引入质心坐标和相对坐标
$
  vb(R)_"cm" = (m_1 vb(r)_1 + m_2 vb(r)_2)/(m_1 + m_2)
$
$
  vb(r) = vb(r)_2 - vb(r)_1
$
从而Lagrange量可以写成质心运动和相对运动的形式：
$
  L = 1/2 M dot(vb(R))_"cm"^2 + 1/2 m dot(vb(r))^2 - V(abs(vb(r)))
$
其中总质量$M = m_1 + m_2$，约化质量$m = (m_1 m_2)/(m_1 + m_2)$。

其中$vb(R)_"cm"$是循环坐标，故其正则共轭动量
$
  vb(P)_"cm" = pdv(L, dot(vb(R))_"cm") = M dot(vb(R))_"cm"
$
守恒。质心动量是总动量，与上面平移对称性导致的总动量守恒一致。

总动量不变也意味着若在质心系考虑问题，可以考虑等效的Lagrange量，只包含相对坐标和约化质量：
$
  L = 1/2 m dot(vb(r))^2 - V(abs(vb(r)))
$
此时两体问题化为一体问题，约化质量$m$的质点在势能$V(r)$中运动。

相互作用为有心力的孤立的两体系统，Lagrange量具有球对称性，或转动不变性$"SO"(3)$。设旧坐标系$S$通过绕原点转动得一新坐标系$S'$。显然，在这种变换下，其径矢不变，即
$
  vb(r) = x vu(i) + y vu(j) + z vu(k) = x' vu(i)' + y' vu(j)' + z' vu(k)'
$
有坐标变换
$
  mat(x'; y'; z') = mat(vu(i) dot vu(i)', vu(j) dot vu(i)', vu(k) dot vu(i)'; vu(i) dot vu(j)', vu(j) dot vu(j)', vu(k) dot vu(j)'; vu(i) dot vu(k)', vu(j) dot vu(k)', vu(k) dot vu(k)') mat(x; y; z)
$
例如绕$vu(k)$旋转无穷小角度$delta theta$则
$
  mat(x'; y'; z') = mat(cos delta theta, sin delta theta, 0; - sin delta theta, cos delta theta, 0; 0, 0, 1) mat(x; y; z) = mat(1, delta theta, 0; - delta theta, 1, 0; 0, 0, 1) mat(x; y; z)
$
从而Lagrange量关于无穷小转动角度$delta theta$不变，即
$
  L(x', y', z', dot(x'), dot(y'), dot(z')) &= L(x, y, z, dot(x), dot(y), dot(z))\
  &= L(x, y, z, dot(x), dot(y), dot(z)) - (x pdv(L, y) - y pdv(L, x) + dot(x) pdv(L, dot(y)) - dot(y) pdv(L, dot(x))) delta theta
$
其中动量
$
  p_x = pdv(L, dot(x)), p_y = pdv(L, dot(y))
$
从而
$
  dv(, t) (x p_y - y p_x) = dv(, t) (vb(r) times vb(p))_z =dv(, t) l_z = 0
$
这就是角动量$z$分量守恒。同理有角动量的$x,y$分量守恒。

这说明，转动不变性对应着角动量守恒。

=== 时间平移不变性

考虑无穷小时间平移变换
$
  t -> t + delta t
$
Kepler系统的Lagrange量关于时间平移不变，即
$
  L(vb(r)_1, dot(vb(r)_1), vb(r)_2, dot(vb(r)_2), t) = L(vb(r)_1, dot(vb(r)_1), vb(r)_2, dot(vb(r)_2), t + delta t)
$
则有时间平移不变性$RR$，即
$
  pdv(L, t) = 0
$
从而有能量守恒，即Hamilton量守恒：
$
  H = sum_i p_i dot(q)_i - L
$
满足
$
  dv(H, t) = - pdv(L, t) = 0
$
这说明，时间平移不变性对应着广义能量守恒。

注意时间平移对称性和时间反演对称性不是同一个概念。时间反演对称性是指系统在时间反向（$t -> -t$）下的对称性，通常与守恒量和系统的可逆性有关。

== Noether定理

数学家诺特最早发现，一个对称性或不变性，必对应一个运动积分或守恒量。如上面的平移对称性对应动量守恒，转动对称性对应角动量守恒，时间平移对称性对应能量守恒。

给一个无穷小变换，以此为生成元，构造其对应的守恒量，对应一个Lie代数的元素。

#theorem(subname: [Noether定理])[
  自由度为$k$的体系，Lagrange量为
  $
    L = L(q_1, q_2, ..., q_k, dot(q)_1, dot(q)_2, ..., dot(q)_k, t)
  $
  如果Lagrange量关于某个*连续的对称变换*下不变，就一定存在相应的守恒量。
]

下面给出证明
#proof[
  设有$n$对称变换，每个对称变换对应某个参数$s_i$的连续变化，连续变换${q_i} -> {Q_i}$
  $
    Q_i = Q_i (s_1, s_2, ..., s_n, t)
  $
  且有
  $
    eval(Q_i)_(s_1 , s_2, ..., s_n -> 0) = q_i
  $
  在$s_i=0$附近，考虑无穷小变换$delta s_i$，导致广义坐标的无穷小变化为
  $
    Q_i = q_i + sum_j delta s_j eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0)
  $
  系统的Lagrange量关于该变换不变，即
  $
    L(Q_1, Q_2, ..., Q_k, dot(Q)_1, dot(Q)_2, ..., dot(Q)_k, t) = L(q_1, q_2, ..., q_k, dot(q)_1, dot(q)_2, ..., dot(q)_k, t)
  $
  左式Taylor展开得
  $
    L(q_1, q_2, ..., q_k, dot(q)_1, dot(q)_2, ..., dot(q)_k, t) \
    + sum_j sum_i (pdv(L, q_i) eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0) + pdv(L, dot(q)_i) eval(pdv(dot(Q)_i, s_j))_(s_1 , s_2, ..., s_n = 0)) delta s_j
  $
  从而有
  $
    sum_i (pdv(L, q_i) eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0) + pdv(L, dot(q)_i) eval(pdv(dot(Q)_i, s_j))_(s_1 , s_2, ..., s_n = 0)) = 0
  $
  且
  $
    dv(, t) pdv(Q_i, s_j) & = sum_k pdv(, s_k) pdv(Q_i, s_j) dot(s)_k + pdv(, t) pdv(Q_i, s_j) = pdv(, s_j) (sum_k pdv(Q_i, s_k) dot(s)_k + pdv(Q_i, t)) = pdv(dot(Q_i), s_j)
  $
  考虑
  $
    p_i = pdv(L, dot(q)_i), dot(p)_i = dv(, t) pdv(L, dot(q)_i) = pdv(L, q_i)
  $
  代入有
  $
    dv(, t) sum_i pdv(L, dot(q)_i) eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0) = 0\
    sum_i p_i eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0) = "const"
  $
  其中$eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0)$是无穷小变换的生成元。

  这就证明了系统Lagrange量在$n$个连续变换参数$s_i$对应的对称变换下不变，就存在$n$个守恒量
  $
    sum_i p_i eval(pdv(Q_i, s_j))_(s_1 , s_2, ..., s_n = 0) = "const"
  $
]

#example(subname: [])[
  一个带电粒子质量为$m$，电荷为$e$，在匀强磁场
  $
    vb(B) = B vu(k)
  $
  中运动
  + 证明：对任意绕$vu(k)$轴的旋转，系统的Lagrange量保持不变，进而证明角动量的$z$分量守恒。
  + 证明：系统有平移不变性，进而证明动量守恒。
  + 求解轨迹
]

#solution[
  考虑其势能
  $
    V = e(phi - vb(v) dot vb(A)), curl vb(A) = vb(B)
  $
  磁场
  $
    vb(B) = mat(0; 0; B) = mat(pdv(A_z, y) - pdv(A_y, z); pdv(A_x, z) - pdv(A_z, x); pdv(A_y, x) - pdv(A_x, y))
  $
  其一个解为Landau规范
  $
    vb(A) = mat(0; x B; 0)
  $
  给出Lagrange量
  $
    L = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) - e dot(y) x B
  $
  事实上选取对称规范
  $
    vb(A) = 1/2 vb(B) times vb(r)
  $
  会得到
  $
    L = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) + e/2 (x dot(y) - y dot(x)) B
  $
  两种规范下的Lagrange量形式不同，但描述的是同一个物理系统，最后得到的物理结论是一致的。我们使用Landau规范。

  + 考虑变换
    $
      mat(x'; y'; z') = mat(x + delta theta y; y - delta theta x; z) => mat(x; y; z) = mat(x' - delta theta y'; y' + delta theta x'; z')
    $
    就有
    $
      L(q, dot(q)) & = L'(q', dot(q)') \
                   & = 1/2 m (dot(x)'^2 + dot(y)'^2 + dot(z)'^2) - e B dot(y)' x' - e B delta theta (x' dot(x)' - y' dot(y)') \
                   & = L(q', dot(q')) - 1/2 e B delta theta dv(, t) eval((x'^2 - y'^2))_(theta -> 0)
    $
    即
    $
      L'(q', dot(q)') = L(q, dot(q)) = L(q', dot(q')) + dv(, t) f(q', t)\
      f(q', t) = - 1/2 e B delta theta (x'^2 - y'^2)
    $
    Taylor展开得
    $
      L(q', dot(q')) & = L(q, dot(q)) + sum_i delta q_i pdv(L, q_i) + sum_i delta dot(q)_i pdv(L, dot(q)_i) \
      & = L(q, dot(q)) + delta theta sum_i (pdv(L, q_i) eval(pdv(Q_i, theta))_(theta -> 0) + pdv(L, dot(q)_i) eval(pdv(dot(Q)_i, theta))_(theta -> 0))
    $
    以及
    $
      L(q', dot(q')) & = L(q, dot(q)) -dv(, t) f(q', t) \
    $
    对比有
    $
      sum_i (pdv(L, q_i) eval(pdv(Q_i, theta))_(theta -> 0) + pdv(L, dot(q)_i) eval(pdv(dot(Q)_i, theta))_(theta -> 0)) + dv(, t) f(q', t) = 0
    $
    其中
    $
      p_x = pdv(L, dot(x)) = m dot(x) , p_y = pdv(L, dot(y)) = m dot(y) - e B x, p_z = pdv(L, dot(z)) = m dot(z)\
      eval(pdv(x', theta)) = y , eval(pdv(y', theta)) = - x , eval(pdv(z', theta)) = 0
    $
    最终得到
    $
      sum_i p_i eval(pdv(Q_i, theta))_(theta -> 0) + f(q', t) & = m dot(x) y - (m dot(y) - e B x) x - 1/2 e B (x^2 - y^2) \
                                                              & = m (x dot(y) - y dot(x)) + e B (x^2 + y^2)/2 \
                                                              & = l_z + 1/2 e B (x^2 + y^2) = "const"
    $
    #note[
      事实上这里Lagrange量并不严格不变，而是多了一个时间导数项，但形式一致，仍然可以应用Noether定理。
    ]

  + 考虑变换
    $
      mat(x'; y'; z') = mat(x + delta a_x; y + delta a_y; z + delta a_z) => mat(x; y; z) = mat(x' - delta a_x; y' - delta a_y; z' - delta a_z)
    $
    就有
    $
      L(q, dot(q)) & = L'(q', dot(q)') \
                   & = 1/2 m (dot(x)'^2 + dot(y)'^2 + dot(z)'^2) - e B dot(y)' (x' - delta a_x) \
                   & = L(q', dot(q')) + e B dot(y)' delta a_x
    $
    有
    $
      L(q', dot(q)') = L(q, dot(q)) = L(q', dot(q')) + dv(, t) f(q', t)\
      f(q', t) = e B y' delta a_x
    $
    从而有
    $
      sum_i (pdv(L, q_i) eval(pdv(Q_i, a_x))_(a_x -> 0) + pdv(L, dot(q)_i) eval(pdv(dot(Q)_i, a_x))_(a_x -> 0)) + dv(, t) f(q', t) = 0
    $
    且
    $
      eval(pdv(f, a_x))_(a_x -> 0) = e B y
    $
    从而有
    $
      p_x + e B y = m dot(x) + e B y = "const" = p_(x 0)\
      p_y = m dot(y) - e B x = "const" = p_(y 0)\
      p_z = m dot(z) = "const" = p_(z 0)
    $
    有能量守恒
    $
      pdv(L, dot(q)_i) dot(q)_i - L = E = dot(x) p_x + dot(y) p_y + dot(z) p_z - L = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) = "const"
    $
    就是动能守恒。

  + 我们先前推出了
    $
      m (x dot(y) - y dot(x)) + e B (x^2 + y^2)/2 = "const"
    $
    代入$p_(x 0), p_(y 0)$有
    $
      (p_(x 0) - e B y) y - (p_(y 0) + e B x) x + e B (x^2 + y^2)/2 = "const"\
      p_(x_0) y - x p_(y_0) - e B/2 (x^2 + y^2) = "const"
    $
    这就是圆的方程，粒子在$x-y$平面内做圆周运动，圆心坐标为
    $
      x_"c" = - p_(y 0)/(e B), y_"c" = p_(x 0)/(e B)
    $
    而$z$方向是匀速直线运动，轨迹是螺旋线。
]

== 运动方程

=== 轨道稳定性

两题问题化为单体问题后，具有转动对称性，即角动量守恒。这意味着轨道在一个平面内运动。

选取相对坐标系的$x-y$平面，则Lagrange量为
$
  L = 1/2 m (dot(r)^2 + r^2 dot(theta)^2) - V(r)
$
Lagrange方程给出
$
  dv(, t) pdv(L, dot(r)) - pdv(L, r) = 0 => m dot.double(r) - m r dot(theta)^2 + pdv(V, r) = 0\
  dv(, t) pdv(L, dot(theta)) - pdv(L, theta) = 0 => dv(, t) (m r^2 dot(theta)) = 0
$
即
$
  dot.double(r) - r dot(theta)^2 = - 1/m pdv(V, r) = F(r)/m,\
  m r^2 dot(theta) = l = "const"
$
有能量积分
$
  E = p_r dot(r) + p_theta dot(theta) - L = 1/2 m dot(r)^2 + l^2/(2 m r^2) + V(r) = 1/2 m dot(r)^2 + V_"eff" (r)
$
且有
$
  m dot.double(r) = - dv(V_"eff", r)
$
其中有效势
$
  V_"eff" (r) = l^2/(2 m r^2) + V(r)
$

#newpara()

#proposition(subname: [轨道稳定性条件])[
  要求轨道稳定在$vb(r)_0$附近的有限区域，有效势能应该满足
  $
    V'_"eff" (r_0) = 0, V''_"eff" (r_0) > 0
  $
]

#newpara()

如果有心是函数是以下齐次形式
$
  V(r) = - k r^n
$
从而
$
  - n k r_0^(n-1) - l^2/(m r_0^3) = 0,\
  - n (n - 1) k r_0^(n-2) + (3 l^2)/(m r_0^4) = (n+2) l^2/(m r_0^4) > 0
$
就有
$
  n > -2
$
后面J.Bertrand给出更强的条件，要求所有有心力轨道都是闭合的，结果是$n = -1, 2$，即Kepler问题和简谐振子问题。

事实上
$
  dot.double(r) = dv(dot(r), t) = dv(dot(r), r) dv(r, t) = 1/2 dv(dot(r)^2, r)
$
能量积分的确是
$
  m dot.double(r) = - dv(V_"eff", r)
$
的积分。

=== 运动轨迹方程

$
  dv(theta, t) = dot(theta) = l/(m r^2)
$
轨道方程是$r(theta)$，有
$
  dv(r, t) = dv(r, theta) dv(theta, t) = l/(m r^2) dv(r, theta)
$
令
$
  u = 1/r
$
就有
$
  dv(r, t) = - l/m dv(u, theta)
$
继续求导
$
  dv(r, t, 2) = - l/m dv(u, theta, 2) dv(theta, t) = - l^2/(m^2) u^2 dv(u, theta, 2)
$
代入运动方程
$
  dot.double(r) - l^2/(m^2 r^3) = F(r)/m
$
得到*Binet方程*
$
  l^2/m u^2 (dv(u, theta, 2) + u) = - F(1/u)
$

#theorem(subname: [Binet方程])[
  有心力系统的轨道方程满足Binet方程
  $
    dv(u, theta, 2) + u = - (m)/(l^2 u^2) F(1/u)
  $
]

#newpara()

当然，这里计算出来的轨道不是真是轨道，是相对坐标轨道。在质心系的两题问题的真实轨道还需要继续变换
$
  vb(r)_1 = - m/m_1 vb(r), vb(r)_2 = m/m_2 vb(r)
$
才能得到。

== 运动轨道

=== 平方反比力

万有引力或者Coulomb力都是平方反比力
$
  F(r) = - k/r^2, k > 0
$
带入Binet方程
$
  dv(u, theta, 2) + u = (k m)/l^2 = 1/p
$
上式是谐振子方程，解为
$
  u(theta) = 1/p + A cos(theta - theta_0)
$
不妨选择极轴方向使得$theta_0 = 0$，则
$
  1/r = 1/p + A cos(theta) => r = p/(1 + epsilon cos(theta))
$
其中$epsilon = A p$是离心率。

这是圆锥曲线，不同偏心率$epsilon$对应不同轨道形状：
#align(center)[#three-line-table[
  | 偏心率$epsilon$ | 轨道形状         |
  |------------------|------------------|
  | $epsilon = 0$ | 圆 |
  | $0 < epsilon < 1$ | 椭圆 |
  | $epsilon = 1$ | 抛物线 |
  | $epsilon > 1$ | 双曲线 |
]]

#newpara()

在近日点
$
  r_"min" = p/(1 + epsilon)
$
没有径向速度，能量为
$
  E = 1/2 m (dot(r)^2 + r^2 dot(theta)^2) + V(r) = l^2/(2 m r_"min"^2) - k/r_"min"
$
得到偏心率
$
  epsilon = sqrt(1 + (2 E l^2)/(m k^2))
$
可以得到，能量、角动量和轨道形状的关系：
#align(center)[#three-line-table[
  | 能量$E$         | 轨道形状         |
  |------------------|------------------|
  | $E < 0$ | 被限制到有限区域 |
  | $E = - (k^2 m)/(2 l^2)$ | 圆轨道 |
  | $- (k^2 m)/(2 l^2) < E < 0$ | 椭圆轨道 |
  | $E = 0$ | 抛物线轨道 |
  | $E > 0$ | 双曲线轨道 |
]]


=== 一般有心力情况

相互作用势能对平方反比有所偏离
$
  V(r) = - k/r + alpha/r^2
$
Binet方程变为
$
  dv(u, theta, 2) + u = (k m)/l^2 - (2 alpha m)/l^2 u= - m/l^2 (k - 2 alpha u)
$
从而
$
  dv(u, theta, 2) + beta^2 u = (k m)/l^2, beta^2 = 1 + (2 alpha m)/l^2
$
解为
$
  u(theta) = (k m)/(beta^2 l^2) + A cos(beta (theta - theta_0))
$
不妨选择极轴方向使得$theta_0 = 0$，则
$
  1/r = (k m)/(beta^2 l^2) + A cos(beta theta) => r = p/(1 + epsilon cos(beta theta))
$
其中$beta = sqrt(1 + (2 alpha m)/l^2)$，$p = beta^2 l^2/(k m)$，$epsilon = sqrt(1 + (2 E beta^2 l^2)/(m k^2))$。当$alpha$足够小时，这是一个近日点进动的椭圆轨道。

#note(subname: [水星近日点进动])[
  水星事实上的近日点进动可以用上述模型解释，考虑到太阳的引力场并非完全是一个点质量，而是有一定的偏离，导致有效势能中出现了$r^2$项，从而导致轨道的近日点进动。
  $
    V(r) = -G integral (m rho(vb(R)) dd(V(vb(R))))/(abs(vb(r) - vb(R)))
  $
  在$r >> R$有
  $
    1/abs(vb(r) - vb(R)) = 1/r (1 + (vb(r) dot vb(R))/r^2 + (3 (vb(r) dot vb(R))^2 - r^2 R^2)/(2 r^4) + ...)
  $
  从而
  $
    V(r) = - G m/r (integral rho V + vu(r)/r dot integral vb(R) rho dd(V) + 1/(2r^2) vu(r) dot integral (3 vb(R) dot vb(R) - R^2) dot vu(r) rho dd(V) + ...)
  $
  第二项为偶极矩项，第三项为四极矩项。定义
  $
    vb(p) = (integral vb(R) rho dd(V))/M
  $
  $
    Q = integral ((3 vb(R) dot vb(R) - R^2) rho dd(V))/M
  $
  则有
  $
    V(r) = - G M m/r (1 + (vu(r) dot vb(p))/r^2 + 1/(2 r^2) (vu(r) dot Q dot vu(r))/r^2 + ...)
  $
  由于太阳的质量分布近似球对称，故偶极矩项可以忽略，四极矩项是主要贡献项。考虑有四极矩的Binet方程
  $
    dv(u, theta, 2) + u = 1/p (1 + gamma u^2)
  $
  该方程的解可以用*摄动/微扰方法求解*，得到近日点进动。但该结果和实际结果并不完全符合， 后面Einstein的广义相对论给出了完美的解释。
]

#newpara()

更一般的情况下，对有心力系统的更一般方法是，利用能量守恒和角动量守恒，得到积分形式的解。

$
  E = 1/2 m dot(r)^2 + l^2/(2 m r^2) + V(r)
$
有
$
  dot(r) = sqrt(2/m (E - V_"eff"))
$
$
  dot(theta) = l/(m r^2)
$
从而有
$
  dd(t) = dd(r)/(sqrt(2/m (E - V_"eff"))))
$
就得到
$
  t = integral (dd(r)/(sqrt(2/m (E - V_"eff")))) + "const"\
$
且有
$
  dd(theta) = l/(m r^2) dd(t) = (l dd(r))/(r^2 sqrt(2 m (E - V_"eff")))
$
给出轨迹方程
$
  theta = integral ((l dd(r))/(r^2 sqrt(2 m (E - V_"eff")))) + "const"\
$

== 散射截面

两体问题中，如果相互作用是斥力或者弱吸引力，粒子不会被束缚在一起，而是发生*散射*过程。

散射截面(cross section)是近代物理中非常重要的物理概念，在研究光-电子、电子-分子、中子-中子、电子-核子、核子-核子等相互作用时，它是不可缺少的。

散射截面一般在量子力学框架下研究，但经典近似比较直观，所以，本节在经典意义下讨论散射截面的概念。

=== 散射截面定义

#definition(subname: [立体角])[
  设有一个单位球面，其面积为$4 pi$。在该球面上取一小块面积$dd(S)$，则该面积所对应的立体角为
  $
    dd(Omega) = dd(S)/r^2
  $
  其中$r$是球面半径。立体角的单位是*球面度*(steradian, sr)。整个球面的立体角为
  $
    Omega_"total" = 4 pi "sr"
  $
  $
    dd(Omega) = sin theta dd(theta) dd(phi)
  $
]

立体角可以理解为从某一点出发，覆盖某个区域所张开的角度大小。

光强是单位时间穿过单位横截面的能量流密度，单位是$"W"/"m"^2$。类似地，散射截面是单位时间穿过单位立体角的粒子数，单位是$"m"^2$。

#definition(subname: [微分散射界面])[
  设有入射粒子流，其粒子数通量密度为$I$，单位是$1/("m"^2 "s")$。经过散射中心后，在立体角$dd(Omega)$范围内散射出的粒子数通量密度为$dd(N)$，则微分散射截面定义为
  $
    dd(sigma) = "单位时间内(因相互作用)进入立体角"dd(Omega)"内的散射粒子数"/"入射强度" = dd(N)/(I dd(Omega))
  $
  单位是$"m"^2$。一般粒子流的入射强度是指单位时间内穿过单位面积的粒子数目，为$I$。
]

对于轴对称散射
$
  dd(Omega) = 2 pi sin phi dd(phi)
$
当一个入射粒子与另一个静止粒子发生散射时，入射粒子在远处速度方向的延长线到散射中心的距离称为碰撞参数(impact parameter)，有时也叫瞄准距离。若碰撞参数处于$rho tilde rho + dd(rho)$的入射粒子散射到$phi tilde phi + dd(phi)$的立体角范围内，则有
$
  I 2pi rho dd(rho) = dd(N) = I 2 pi sigma(phi) sin phi dd(phi)
$
散射截面总是大于零，所以有
$
  sigma = rho/(sin phi) abs(dv(rho, phi))
$
总的散射截面为
$
  sigma_"tot" = integral sigma(phi) dd(Omega) = integral_0^pi 2 pi sigma(phi) sin phi dd(phi)
$

=== Rutherford散射截面

历史上，Rutherford利用$alpha$粒子轰击金箔，通过分析散射截面了解到原子内部结构。$alpha$粒子与金核之间的相互作用为Coulomb平方反比斥力。更一般地考虑
$
  F = - k/r^2
$
其中$k>0$是引力，$k<0$是斥力。Binet方程为
$
  dv(u, theta, 2) + u = - (m)/(l^2) F(1/u) = (k m)/l^2
$
此时解可写成以下形式
$
  u = A cos theta + B sin theta + 1/p
$
其中
$
  p = l^2/(k m)
$
因散射粒子来自远处，其碰撞参数或瞄准距离为$rho$。容易看出从远处人射时，$theta -> pi$时，$r -> oo$
$
  A = 1/p
$
又以散射点为原点，横向为$x$轴，纵向为$y$轴，则
$
  y = r sin theta = (sin theta)/(1/p(1 + cos theta) + B sin theta)
$
而$theta->pi$时，$y-> rho$，从而
$
  B = 1/(rho)
$
就得到了
$
  1/r = 1/p(1 + cos theta) + 1/rho sin theta
$
散射角$phi$在$r->oo$时有$theta->phi$，其中$phi$是入射方向与散射方向的夹角，从而有
$
  1/p (1 + cos phi) + 1/rho sin phi = 0
$
求得
$
  1/rho = - (1 + cos phi)/(p sin phi) = - 1/p cot phi/2
$
设粒子在远处速率为$v_oo$则有
$
  l = m v_oo rho\
  1/p = (m k)/(l^2) = (k)/(m v_oo^2 rho^2)
$
有
$
  rho = - (k)/(m v_oo^2) cot phi/2
$
求得微分散射截面为
$
  sigma(phi) = rho/(sin phi) abs(dv(rho, phi)) = (k/(m v_oo^2))^2 (cot phi/2)/(sin phi) abs(dv(cot phi/2, phi)) = (k/(2 m v_oo^2))^2 csc^4 phi/2
$
这就是著名的Rutherford散射截面公式。

#theorem(subname: [Rutherford散射截面])[
  Coulomb斥力作用下的经典散射截面为
  $
    sigma(phi) = (k/(2 m v_oo^2))^2 csc^4 phi/2
  $
  其中$k$是Coulomb力常数，$m$是入射粒子质量，$v_oo$是入射粒子远处速度。
]

如果对上式进行积分，试图计算总散射截面时会遇到积分发散问题，这主要是因为Coulomb力是长程力的缘故。实际应用时，核电荷总是被周围电子屏蔽，考虑屏蔽效应就不会出现发散问题。

有了Rutherford散射截面公式，就可以通过实验测量散射粒子在不同角度的分布情况，进而反推出入射粒子与靶核之间的相互作用力，从而了解原子核的结构。Rutherford正是通过这种方法发现了原子核的存在。后面就据此提出了Rutherford原子模型，即原子中有一个带正电的原子核，电子围绕原子核运动。

=== 一般有心力场中的散射

对于一般有心力场中的散射问题，粒子从无限远处入射，经过近日点(离中心最近位置)，再出射到无限远。散射角
$
  delta = pi - 2 phi
$
其中$phi$是粒子从无限远处入射到近日点或从近日点出射到无限远扫过的角度。我们前面得到了$theta$的积分公式
$
  theta = integral (l dd(r))/(r^2 sqrt(2 m (E - V_"eff"))) + "const"\
$
就有
$
  phi = (pi - delta)/2 = integral_(r_"min")^(oo) (l dd(r))/(r^2 sqrt(2 m (E - V_"eff")))
$
由于$l = m v_oo rho$，所以上式就建立了$rho$和$phi$之间的联系。

== 实验室系和质心系

通常实验值都是在实验室系测量的数据，而两体散射的公式中用的都是相对坐标，为了方便实验和理论的比较，需要将相对坐标系的公式转化为实验室系下的形式。

在质心系，*两粒子速度总是反向的*，因此散射角实际是粒子入射时相对速度与粒子散射远离的相对速度之间的夹角，而相对速度与坐标系选择无关，所以说相对坐标系下的散射角实际上就是质心系的散射角。

这样问题就化为如何寻找*质心系的散射角和实验室系散射角之间的关系*。

轴对称情况下微分散射截面是散射角的函数，只要散射角之间的关系确定，两个系之间的散射截面的关系也就确定了。

设入射粒子以$v_oo$水平入射，则质心速度沿水平方向
$
  V = (m_1 v_oo)/(m_1 + m_2)
$
出射粒子速度在质心系与实验室系的关系为
$
  vb(v)_1 = vb(V) + vb(v)'_1\
$
即
$
  v_1 sin phi_1 = v'_1 sin theta\
  v_1 cos phi_1 = V + v'_1 cos theta
$
其中$phi_1$为入射粒子在实验室系的散射角，$theta$为质心系的散射角。有
$
  tan phi_1 = (v'_1 sin theta)/(V + v'_1 cos theta) = (sin theta)/(cos theta + (m_1)/(m_2))
$
其中用到了
$
  V = m/m_2 v_oo, v'_1 = m/m_1 v_oo
$
锁定某一固定小区域,散射到该区域的粒子数在实验室系为
$
  I sigma_1(phi_1) dd(Omega)_1 = I sigma(theta) dd(Omega)
$
从而
$
  sigma_1(phi_1) dd(Omega)_1 = sigma(theta) dd(Omega)\
  sigma_1(phi_1) = (sin theta)/(sin phi_1) abs(dv(theta, phi_1)) sigma(theta)
$
散射截面可用不同坐标系的坐标表示。
- $m_1<<m_2, phi_1 = theta$
  $
    sigma_1(phi_1) = sigma(theta)
  $
- $m_1 = m_2, phi_1 = theta/2$
  $
    sigma_1(phi_1) = 4 sigma(2 phi_1) cos phi_1
  $
- 全同粒子(identical particals)情形，$m_1 = m_2$，但无法区分入射粒子和靶粒子，此时$theta$的散射截面是$sigma(theta) + sigma(pi - theta)$，从而
  $
    sigma_"identical" (phi) = sigma_1(phi) + sigma_1(pi - phi) = 4 (sigma(2 phi) + sigma(2 (pi - phi)))cos phi
  $
  以相同粒子的散射为例，比如电子-电子散射，Rutherford散射截面为
  $
    sigma_"identical" (phi) = (k/(m v_oo^2))^2 (1/(sin^4 phi) + 1/(cos^4 phi)) cos phi
  $

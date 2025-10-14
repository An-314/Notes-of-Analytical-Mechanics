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
    L = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) + e dot(y) x B
  $
  事实上选取对称规范
  $
    vb(A) = 1/2 vb(B) times vb(r)
  $
  会得到
  $
    L = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2) + e/2 (x dot(y) - y dot(x)) B
  $
  两种规范下的Lagrange量形式不同，但描述的是同一个物理系统，最后得到的物理结论是一致的。
]

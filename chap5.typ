#import "@preview/scripst:1.1.1": *

= 微振动

== 一维微振动

=== 简谐振动

作简谐振动的质点即*谐振子*(simple harmonic oscillation,SHO)。

考虑一维运动，粒子的势能形式为$V=V(q)$。对于其平衡点$q_0$，有
$
  eval(pdv(V, q))_(q=q_0) = 0
$
在$q_0$附近做泰勒展开，有
$
  V(q) = V(q_0) + 1/2 eval(pdv(V, q, 2))_(q=q_0) (q - q_0)^2 + ...
$
粒子稳定平衡条件为
$
  eval(pdv(V, q, 2))_(q=q_0) > 0
$
当势能函数$V(q)$在$q_0$附近呈现出一个向上的抛物线形状时，质点在平衡位置附近会做简谐振动。取到二阶项近似，有
$
  L = 1/2 m dot(q)^2 - 1/2 V''(q_0) (q - q_0)^2
$
不妨设$q_0 = 0$，则Lagrange方程为
$
  m dot.double(q) + V''(0) q = 0\
  dot.double(q) + omega_0^2 q = 0
$
其中
$
  omega_0 = sqrt(V''(0)/m)
$
这就是一个二阶常微分齐次的简谐振动方程，其通解为
$
  q(t) = A cos(omega_0 t + phi)
$
其中$A$和$phi$由初始条件决定。

如果把$(q,dot(q))$看作二维相空间中的一个点，那么质点的运动轨迹就是一个椭圆
$
  q^2/(2E/V''(0)) + dot(q)^2/(2E/m) = 1
$

=== 阻尼振动

通常阻尼项正比于速度，引入常量$2 beta > 0$，则阻尼振动(damped,vibration)方程为
$
  dot.double(q) + 2 beta dot(q) + omega_0^2 q = 0
$
设解的形式为
$
  q = e^(alpha t)
$
其中
$
  alpha = - beta plus.minus i sqrt(omega_0^2 - beta^2)
$

- 欠阻尼(under damping)：$beta < omega_0$，解为
  $
    omega = sqrt(omega_0^2 - beta^2)\
    q(t) = A e^(- beta t) cos(omega t + phi)
  $
- 临界阻尼(critical damping)：$beta = omega_0$，解为
  $
    lambda_plus.minus = - beta = - omega_0\
    q(t) = C(1 + D t) e^(- beta t)
  $
- 过阻尼(over damping)：$beta > omega_0$，解为
  $
    lambda_plus.minus = - beta plus.minus sqrt(beta^2 - omega_0^2) < 0\
    q(t) = A e^(lambda_plus t) + B e^(lambda_minus t)
  $
  只有衰减而无振荡

欠阻尼振动的能量损耗率：对欠阻尼情形，振动能量近似地有
$
  E prop e^(- 2 beta t)
$
就有
$
  dot(E)/E = - 2 beta
$
显然能量损失率与阻尼正相关。引入
$
  Q = omega_0/(2 beta)
$
就是通常所说的振动系统的品质因数，此时$Q$越大，损耗越小。

== 强迫振动和非齐次常系数微分方程的解法

对于阻尼振动系统，提供外驱动力，则振动方程化为
$
  dot.double(q) + 2 beta dot(q) + omega_0^2 q = F(t)
$
这是二阶线性非齐次方程(inhomogeneous)，解的形式为
$
  q(t) = q_h(t) + q_p(t)
$
其中$q_h(t)$是对应齐次方程的通解，$q_p(t)$是非齐次方程的一个特解(particular solution)。

时间长了以后，$q_h$由于指数衰减因子的作用，解都趋于零，因此通解称为瞬态(transient)解。问题只需求$q_p$，这个特解有时也叫稳态(steady state)解。

常见的一类问题是驱动力为周期力形式，此时最简单的解法是利用Fourier级数展开，将驱动力展开为多个谐波之和，然后对每个谐波分别求解，最后将各谐波的特解相加得到总的特解。

=== Fourier级数法

如果$F(t)$是周期为$T$的函数，它的Fourier级数展开为
$
  F(t) = f_0/2 + sum_(n=1)^oo (f_n cos(n omega t) + g_n sin(n omega t))
$
其中$omega = 2 pi / T$，系数为
$
  f_n = 2/T integral_0^T F(t) cos(n omega t) dd(t)\
  g_n = 2/T integral_0^T F(t) sin(n omega t) dd(t)
$
由于受周期力的驱动，稳态解也应是周期函数，其周期与驱动力一致，因此稳态解可以表示为Fourier级数形式
$
  q(t) = a_0/2 + sum_(n=1)^oo (a_n cos(n omega t) + b_n sin(n omega t))
$
其中$a_n,b_n$为待求解系数。将$q(t)$代入非齐次方程，并将等式两边的系数进行比较
$
  (omega_0^2 - n^2 omega^2) a_n + 2 beta n omega b_n = f_n\
  (omega_0^2 - n^2 omega^2) b_n - 2 beta n omega a_n = g_n
$
即可解出
$
  a_n = ((omega_0^2 - n^2 omega^2) f_n - 2 beta n omega g_n)/((omega_0^2 - n^2 omega^2)^2 + (2 beta n omega)^2)\
  b_n = ((omega_0^2 - n^2 omega^2) g_n + 2 beta n omega f_n)/((omega_0^2 - n^2 omega^2)^2 + (2 beta n omega)^2)
$

#newpara()

=== 共振

驱动力为$F(t) = F_0 cos Omega t$时
$
  q_"特解" = (F_0 cos (Omega t - phi))/(sqrt((omega_0 - Omega)^2 + (2 beta Omega)^2))
$
其中
$
  tan phi = (2 beta Omega)/(omega_0^2 - Omega^2)
$
当驱动力频率$Omega$接近系统固有频率$omega_0$时，振幅达到最大值，这种现象称为*共振*(resonance)。

== 非线性振动方程和微扰方法

*微扰法*也称为*摄动法*(perturbation method)，是处理非线性振动方程的一种常用方法。

=== 非线性齐次方程和微扰方法

考虑如下非线性振动方程
$
  dot.double(q) + omega_0^2 q + epsilon q^2 = 0
$
这是非线性振动方程。对于初值为$dot(q)_0, q_0$的情况，类似当时两体系统轨道方程的解法，可以写成积分形式
$
  t = integral dd(q)/sqrt(dot(q)_0^2 + omega_0^2 (q_0^2 - q^2) + 2/3 epsilon (q_0^3 - q^3))
$
这个解不能带来任何益处，因为从这个积分形式的解很难看出解的性质。

如果$epsilon$很小时，Poincaré-Lindstedtd微扰方法可以用来近似求解这个非线性振动方程。通过$epsilon$基次项展开，逐次逼近准确解。为此，比较方便的做法是,把运动函数用$epsilon$次项展开
$
  q = q_0 + epsilon q_1 + epsilon^2 q_2 + ...
$
线性运动的振动频率是$omega_0$。但非线性项对系统振动频率也可能有影响，因此，频率也要用$epsilon$次项展开
$
  omega = omega_0 + epsilon omega_1 + epsilon^2 omega_2 + ...
$
其中$omega_1, omega_2, ...$是待定常量。

为了方便
$
  dot.double(q) + omega^2 q = (omega^2 - omega_0^2) q - epsilon q^2
$
为了求解方便，作一简单变换
$
  tau = omega t + phi
$
有
$
  q' = dv(q, tau) = dot(q)/omega\
  q'' = dv(q', tau) = dot.double(q)/omega^2
$
就有
$
  q'' + q = (1 - omega_0^2/omega^2) q - epsilon/omega^2 q^2
$
按$epsilon$幂次项展开，得到恒等式
$
  q''_0 + q_0 & = 0 \
  q''_1 + q_1 & = (2 omega_1)/omega_0 q_0 - q_0^2/omega_0^2 \
  q''_2 + q_2 & = ((2 omega_2)/omega_0 - (3 omega_1^2)/omega_0^2) q_0 + (2 omega_1)/omega_0^3 q_0^2 + (2 omega_1)/omega_0 q_1 - (2 q_0 q_1 )/omega_0^2 \
$
下面我们逐级求解上述方程。

$
  q''_0 + q_0 & = 0
$
的解是
$
  q_0 = A cos tau
$
由于$tau$中含有待定常量$phi$，因此初始条件已经隐含在$q_0$中了。不妨有$eval(q)_(tau = 0) = A, eval(q')_(tau = 0) = 0$。
$
  q''_1 + q_1 & = (2 omega_1)/omega_0 q_0 - q_0^2/omega_0^2 \
              & = 2 omega_1/omega_0 A cos tau - (A^2 (1 + cos 2 tau))/(2 omega_0^2)
$

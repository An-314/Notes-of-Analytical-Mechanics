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
注意到右端有与齐次方程相同的项$cos tau$，这会引起*共振*现象，使得解发散。为避免这种情况，必须令该项系数为零，即
$
  omega_1 = 0
$
因此
$
  q''_1 + q_1 = - (A^2 (1 + cos 2 tau))/(2 omega_0^2)
$
的解为
$
  q_1 = - (A^2)/(2 omega_0^2) (1 - 2/3 cos tau - 1/3 cos 2 tau)
$
继续进行下去，可以得到更高阶的近似解。最终得到的近似解为
$
  q_0 & = A cos tau \
  q_1 & = - (A^2)/(2 omega_0^2) (1 - 2/3 cos tau - 1/3 cos 2 tau) \
  q_2 & = (A^3)/(3 omega_0^3) (1 - 13/24 cos tau - 1/3 cos 2 tau - 1/8 cos 3 tau)
$

#newpara()

总结微扰方法的过程：
- 将非线性振动方程写成线性振动方程加上微扰项的形式；
- 将运动函数和频率按微扰参数展开成幂级数形式；
- 将展开式代入非线性振动方程，并按微扰参数的幂次比较，得到一系列恒等式；
- 下一阶方程的右端可能含有与齐次方程相同的项，必须剔除这些共振项，从而确定频率展开式中的待定常量；
- 逐级求解各阶方程，得到近似解。

=== 受迫非线性振动和微扰方法

考虑驱动力作用下的阻尼系统，非线性项是三次方项，此时质点运动方程为
$
  dot.double(q) + 2 beta dot(q) + omega_0^2 q + epsilon q^3 = F_0 cos omega t
$
这个方程也叫做*Duffing方程*。在振幅不大的情形，可以利用微扰理论，近似求解这个方程的特解。

这是受迫非线性振动，驱动频率是给定的，这是主要的运动倾向，因此这里的微扰方法应该与Poincaré-Lindstedtd方法有所不同。方程写为
$
  dot.double(q) + omega^2 q = - 2 beta dot(q) + (omega^2 - omega_0^2) q - epsilon q^3 + F_0 cos omega t
$
右边项当作微扰项。在右边乘以一任意量$mu$，用来把右边微扰项按幕次展开，$mu$的幂次可以标 记微扰展开项的级次，最后这个量要取1，即
$
  dot.double(q) + omega^2 q = mu (- 2 beta dot(q) + (omega^2 - omega_0^2) q - epsilon q^3 + F_0 cos omega t)
$
考虑到受迫振动时系统对外驱动力响应有相位滞后效应，引入一个初相位滞后项$delta$，作一简单变换
$
  tau = omega t - delta
$
就有
$
  q'' + q = mu (- (2 beta)/omega q' + (omega^2 - omega_0^2)/omega^2 q - epsilon/omega^2 q^3 + F_0/omega^2 cos tau)
$
设关于$mu$的展开为
$
  q = q_0 + mu q_1 + mu^2 q_2 + ...\
  delta = delta_0 + mu delta_1 + mu^2 delta_2 + ...
$
代入上式，并按$mu$的幂次项比较，得到恒等式
$
  q''_0 + q_0 & = 0 \
  q''_1 + q_1 & = - (2 beta)/omega q'_0 + (omega^2 - omega_0^2)/omega^2 q_0 - epsilon/omega^2 q_0^3 + F_0/omega^2 cos (tau + delta_0) \
  q''_2 + q_2 & = - (2 beta)/omega q'_1 + (omega^2 - omega_0^2)/omega^2 q_1 - (3 epsilon)/omega^2 q_0^2 q_1 - (F_0 delta_1)/omega^2 sin (tau + delta_0) \
$
对于受迫阻尼振动，通解是暂态解，随时间变化很快衰减。稳定解才是重要的，即只需求特解，与初值相关的参量可以不考虑，因此解取最简单形式
$
  q_0 & = A_0 cos tau \
$
一阶方程为
$
  q''_1 + q_1 &= \ &(2 beta A_0/omega - F_0/omega^2 sin delta_0) sin tau + ((omega^2 - omega_0^2)/omega^2 A_0 - (3 epsilon A_0^3)/(4 omega^2) + F_0/omega^2 cos delta_0) cos tau - (epsilon A_0^3)/(4 omega^2) cos 3 tau
$
同理剔除共振项$sin tau$和$cos tau$，得到
$
  2 beta A_0/omega - F_0/omega^2 sin delta_0 = 0\
  (omega^2 - omega_0^2)/omega^2 A_0 - (3 epsilon A_0^3)/(4 omega^2) + F_0/omega^2 cos delta_0 = 0
$
可以解得$A_0$和$delta_0$，即
$
  A_0 = F_0/ sqrt((omega^2 - omega_0^2 - (3 epsilon A_0^2)/4)^2 + (2 beta omega)^2) \
$
$A_0$并非$omega_0$的单值函数。零级近似下，可以考查非线性受迫振动与线性受迫振动在共振点附近的行为。共振曲线的共振峰出现倾斜。阻尼力不同的两个非线性受迫振动共振曲线，与线性受迫振动共振类似，阻尼小时，其峰值大。但因为峰值是倾斜的，如果驱动频率连续变化，频率是由小变大，则曲线达到极值过程，振幅不稳定，振幅有可能突然落到右下曲线段；若频率是由大变小，则达到拐点时，振幅会突然跳上左上曲线段，振幅在共振区域有跃变现象。

#figure(
  image("pic/2025-11-04-10-32-39.png", width: 40%),
  caption: "非线性受迫振动的共振曲线",
)

只有通过频率逐渐增大，才可以找到共振点，反过来就会错过共振点，是否能达到共振点与过程有关，有滞后(hysteresis)现象，类似于铁磁中的磁滞现象，它是非线性引起的效应。

进一步计算一级近似项。一阶方程为
$
  q''_1 + q_1 & = - (epsilon A_0^3)/(4 omega^2) cos 3 tau
$
得到
$
  q_1 = A_1 cos tau - (epsilon A_0^3)/(32 omega^2) (cos tau - cos 3 tau)
$
同样地看二阶方程为
$
  q''_2 + q_2 & = - (2 beta)/omega q'_1 + (omega^2 - omega_0^2)/omega^2 q_1 - (3 epsilon)/omega^2 q_0^2 q_1 - (F_0 delta_1)/omega^2 sin (tau + delta_0) \
  & = ((2 beta A_1)/omega - (3 epsilon A_0^2 A_1)/(4 omega^2) - (F_0 delta_1)/omega^2 sin delta_0) sin tau + ((omega^2 - omega_0^2)/omega^2 A_1 - (3 epsilon A_0^2 A_1)/(4 omega^2) + (F_0 delta_1)/omega^2 cos delta_0) cos tau
$
同理剔除共振项$sin tau$和$cos tau$，得到
$
  A_1 = (epsilon A_0^3)/(32 omega^2) + (F_0 delta_1 cos delta_0)/(2 beta omega)\
  delta_1 = (3 beta epsilon^2 A_0^6)/(32 omega D_0 (2 F_0 + 3 epsilon A_0^3 cos delta_0))
$
一级近似解为
$
  q_1 = (F_0 delta_1 cos delta_0)/(2 beta omega) cos tau + (epsilon A_0^3)/(32 omega^2) cos 3 tau
$
利用同样的方法可以得到更高阶微扰解。

== 耦合谐振动

考虑左右两个谐振子中间由弹簧连接，忽略重力，形成耦合谐振动 (coupled SHO pendulums)，如图所示

#figure(
  image("pic/5.1.svg", width: 80%),
  numbering: none,
)
这是两个自由度系统，假设质点静止时弹簧都处于自然伸长状态，那么，它的Lagrange量为
$
  L = 1/2 m (dot(x)_1^2 + dot(x)_2^2) - 1/2 k (x_1^2 + x_2^2) - 1/2 k' (x_2 - x_1)^2
$
Lagrange方程为
$
  m dot.double(x)_1 + (k + k') x_1 - k' x_2 = 0\
  m dot.double(x)_2 + (k + k') x_2 - k' x_1 = 0
$
即
$
  m mat(dot.double(x)_1; dot.double(x)_2) + mat(k + k', - k'; - k', k + k') mat(x_1; x_2) = mat(0; 0)
$
以上是耦合方程 ,不容易直接求解。利用变量替换
$
  q_1 = x_1 + x_2\
  q_2 = x_1 - x_2
$
就有
$
  m dot.double(q)_1 + k q_1 = 0\
  m dot.double(q)_2 + (k + 2 k') q_2 = 0
$
容易解得
$
  q_1 = A_1 cos (omega_1 t + phi_1), omega_1 = sqrt(k/m)\
  q_2 = A_2 cos (omega_2 t + phi_2), omega_2 = sqrt((k + 2 k')/m)
$
通常称$q_1, q_2$为*简正坐标*(normal coordinates)，对应的频率$omega_1, omega_2$为*简正频率*(normal frequencies)，每个频率对应一种振动模式。实际振动位移是两个简谐振动的叠加
$
  x_1 = (q_1 + q_2)/2\
  x_2 = (q_1 - q_2)/2
$

#newpara()

通过这个实例，自然会问：对多个自由度的力学体系的线性耦合振动是否可以建立一种系统的求解方法呢？答案是肯定的。

== 多自由度力学系统的微振动

=== 势能

系统具有$s$个自由度，势能为
$
  V = V(q_1, q_2, ..., q_s)
$
设平衡位置$q_alpha = 0$则
$
  eval(pdv(V, q_alpha))_(q_1,q_2,...,q_s=0) = 0, alpha = 1,2,...,s
$
Taylor展开
$
  V = V(0,0,...,0) + 1/2 sum_(alpha,beta) eval(pdv(V, q_alpha, q_beta))_(0,0,...,0) q_alpha q_beta + ...
$
选择势能零点为$V(0,0,...,0) = 0$，令
$
  v_(alpha beta) = eval(pdv(V, q_alpha, q_beta))_(0,0,...,0) = v_(beta alpha)
$
对于微小振动，略去高阶小量，对于稳定平衡点总有
$
  v_(alpha alpha) > 0, alpha = 1,2,...,s
$
将系数记成Jacobi矩阵
$
  v = mat(v_(11), v_(12), ..., v_(1s); v_(21), v_(22), ..., v_(2s); dots.v, dots.v, dots.down, dots.v, ; v_(s 1), v_(s 2), ..., v_(s s))
$
显然$v$是实对称矩阵，而且它还是正定的。

#proof[
  实对称矩阵$A$必有一正交矩阵$U$，$U^TT = U^(-1)$，使得$U A U^TT = Lambda$，其中$Lambda$为对角矩阵，其对角元为$A$的特征值。运用到矩阵$v$，即存在正交矩阵$U$，使得
  $
    sum_(alpha,beta) U^TT_(i alpha) v_(alpha beta) U_(beta j) = lambda_i delta_(i j)
  $
  作坐标变换$Q_alpha = sum_(beta) U^TT_(alpha beta) q_beta$，逆变换为$q_alpha = sum_(beta) U_(alpha beta) Q_beta$，则势能为
  $
    V = 1/2 sum_(i,j) lambda_i delta_(i j) Q_i Q_j = 1/2 sum_i lambda_i Q_i^2 > 0
  $
  由于当$q_alpha$不全为0时，$V>0$，所以所有特征值$lambda_i > 0$，因此矩阵$v$是正定的。
]

=== 动能

假设是稳定约束，实际坐标和广义坐标之间变换不显含时间，因此有
$
  dot(vb(r))_i = sum_(alpha) pdv(vb(r)_i, q_alpha) dot(q)_alpha
$
动能则为速度的二次项
$
  T &= 1/2 sum_(i) m_i dot(vb(r))_i^2 = 1/2 sum_(alpha,beta) a_(alpha beta) (sum_i m_i pdv(vb(r)_i, q_alpha) pdv(vb(r)_i, q_beta)) dot(q)_alpha dot(q)_beta\
  &= 1/2 sum_(alpha,beta) t_(alpha beta) dot(q)_alpha dot(q)_beta
$
其中
$
  t_(alpha beta) = t_(beta alpha) = sum_i m_i pdv(vb(r)_i, q_alpha) pdv(vb(r)_i, q_beta)
$
这里也应该保留到二阶小量，所以方程只能是保留零阶，即取所有广义坐标零点的值。同样地，动能系数也可以记成矩阵
$
  t = mat(t_(11), t_(12), ..., t_(1s); t_(21), t_(22), ..., t_(2s); dots.v, dots.v, dots.down, dots.v, ; t_(s 1), t_(s 2), ..., t_(s s))
$
与势能同理，因为动能是速度的二次型，矩阵$t$也是实对称矩阵，并且它还是正定的。

=== 运动方程

具有$s$个自由度系统在平衡位置附近的Lagrange量为
$
  L = T - V = 1/2 sum_(alpha,beta) t_(alpha beta) dot(q)_alpha dot(q)_beta - 1/2 sum_(alpha,beta) v_(alpha beta) q_alpha q_beta
$
Lagrange方程为
$
  sum_(beta) (t_(alpha beta) dot.double(q)_beta - v_(alpha beta) q_beta) = 0, alpha = 1,2,...,s
$

=== 简正频率

试探简谐振动解
$
  q_beta = A_beta cos (omega t + phi)
$
代入
$
  sum_(beta) (v_(alpha beta) - omega^2 t_(alpha beta)) A_beta = 0, alpha = 1,2,...,s\
  => (v - omega^2 t) A = 0
$
这是齐次线性方程组，有非零解的条件是系数行列式为零，即
$
  det(v - omega^2 t) = 0
$
因$v - omega^2 t$为实对称矩阵，所以这个特征方程有$s$个实特征值$omega_1^2, omega_2^2, ..., omega_s^2$，且各不相等。

#proof[
  对矩阵$v - omega^2 t$乘以$A$的复共轭转置$A^dagger$，有
  $
    A^dagger (v - omega^2 t) A = 0
  $
  取复共轲有
  $
    A^TT (v - omega^(*2) t) A^* = 0
  $
  两式相减，因为$v,t$都是实对称的，$A^dagger v A = A^TT v A^*$，从而
  $
    (omega^2 - omega^(*2)) A^dagger t A = 0
  $
  而动能项矩阵$t$是正定的，因此$A^dagger t A != 0$，所以$omega^2 = omega^(*2)$。这意味着$omega^2$是实数。

  进一步地
  $
    A^dagger (v - omega^2 t) A = 0 => omega^2 = (A^dagger v A)/(A^dagger t A)
  $
  设实正交矩阵$U$使$v$对角化
  $
    U v U^TT = Lambda
  $
  $
    A^dagger v A = A^dagger U U^TT v U U^TT A = (U^TT A)^dagger Lambda (U^TT A) = sum_i lambda_i abs(U^TT A)_i^2 > 0
  $
  因为$v$是正定矩阵，所以所有特征值$lambda_i > 0$，因此$A^dagger v A > 0$。同理可证$A^dagger t A > 0$，所以$omega^2 > 0$。
]

=== 简正坐标

==== 简正频率非简并

设$omega$的$s$个正根为$omega_1, omega_2, ..., omega_s$，方程对应的特征向量分别为$A^((1)), A^((2)), ..., A^((s))$。

由于方程线性齐次方程组的非平凡解不确定，需要其他条件。
$
  (v - omega_l^2 t) A^((l)) = 0, l = 1,2,...,s
$
$
  sum_(beta) (v_(alpha beta) - omega_l^2 t_(alpha beta)) A^((l))_beta = 0, alpha = 1,2,...,s
$
统一形式做差得到
$
  (omega_l^2 - omega_k^2) sum_(alpha,beta) A^(TT(l))_alpha t_(alpha beta) A^((k))_beta = 0
$
对于$l != k$，有
$
  sum_(alpha,beta) A^(TT(l))_alpha t_(alpha beta) A^((k))_beta = 0
$
而对于$l = k$，可以归一化
$
  sum_(alpha,beta) A^(TT(l))_alpha t_(alpha beta) A^(TT(l))_beta = 1
$
从而
$
  sum_(alpha,beta) A^(TT(l))_alpha t_(alpha beta) A^((k))_beta = delta_(l k)
$
此即正交归一条件。则有
$
  sum_(alpha,beta) A^(TT(l))_alpha v_(alpha beta) A^((k))_beta = omega_l^2 delta_(l k)
$
这样方程的通解可以表示为可能解的线性组合
$
  q_beta = sum_(l=1)^s C_l A^((l))_beta cos (omega_l t + phi_l), beta = 1,2,...,s
$
式中$A$已经确定，$C$则是由初始条件决定的任意系数。对于初值问题，由
$
  q_beta(0) = sum_(l=1)^s C_l A^((l))_beta cos (phi_l)\
  dot(q)_beta(0) = - sum_(l=1)^s C_l omega_l A^((l))_beta sin (phi_l)
$
利用正交归一条件
$
  sum_(beta,alpha) A^(TT(k))_beta t_(beta alpha) q_alpha(0) = C_k cos (phi_k)\
  sum_(beta,alpha) A^(TT(k))_beta t_(beta alpha) dot(q)_alpha(0) = - C_k omega_k sin (phi_k)
$
就可以给出$C_k$和$phi_k$的值。

为了看清楚振动模式，定义另一组独立坐标
$
  Q_l = C_l cos (omega_l t + phi_l), l = 1,2,...,s
$
$Q_l$为*简正坐标*(normal coordinates)，$omega_l$为*简正频率*(normal frequencies)，每个频率对应一种振动模式。得
$
  q_beta = sum_(l=1)^s A^((l))_beta Q_l, beta = 1,2,...,s\
  q = A Q
$
而Lagrange量为
$
  L = 1/2 sum_(alpha) (dot(Q)_alpha^2 - omega_alpha^2 Q_alpha^2)
$
这就是$s$个独立简谐振动的总和。

同时可以得到
$
  Q_k = sum_(alpha beta) A^(TT(k))_alpha t_(alpha beta) q_beta
$

#example()[
  有三段弹簧围成一个圈，连接三个质量相等的质点$m,m,M$，弹簧劲度系数均为$k$，求该系统的简正频率和简正坐标。
]

#solution[
  广义坐标为$q_1,q_2,q_3$，可以写出Lagrange量
  $
    T = 1/2 m (dot(q)_1^2 + dot(q)_2^2) + 1/2 M dot(q)_3^2\
    V = 1/2 k (q_1 - q_2)^2 + 1/2 k (q_2 - q_3)^2 + 1/2 k (q_3 - q_1)^2
  $
  从而
  $
    t_(alpha beta) = pdv(T, dot(q)_alpha, dot(q)_beta) = mat(m, 0, 0; 0, m, 0; 0, 0, M)\
    v_(alpha beta) = pdv(V, q_alpha, q_beta) = k mat(2, -1, -1; -1, 2, -1; -1, -1, 2)
  $
  运动方程为
  $
    m mat(dot.double(q)_1; dot.double(q)_2; dot.double(q)_3) + k mat(2, -1, -1; -1, 2, -1; -1, -1, 2) mat(q_1; q_2; q_3) = mat(0; 0; 0)
  $
  解为
  $
    det mat(2 k - omega^2 m, - k, - k; - k, 2 k - omega^2 m, - k; - k, - k, 2 k - omega^2 M) = 0
  $
  令$lambda = omega^2 m/k$，则特征方程为
  $
    det mat(2 - lambda, -1, -1; -1, 2 - lambda, -1; -1, -1, 2 - (m/M) lambda) = 0
  $
  解为
  $
    lambda_1 = 0, lambda_2 = 1 + (2m)/M , lambda_3 = 3
  $
  从而简正频率为
  $
    omega_1 = 0, omega_2 = sqrt(k (1/m + 2/M)), omega_3 = sqrt((3 k)/m)
  $
  对应的特征向量为
  $
    A^((1)) = mat(1; 1; 1), A^((2)) = mat(1; 1; - m/M), A^((3)) = mat(1; -1; 0)
  $
  归一化条件为
  $
    sum_(alpha,beta) A^(TT(l))_alpha t_(alpha beta) A^((l))_beta = 1
  $
  得到归一化的特征向量为
  $
    A^((1)) & = 1/sqrt(2 m + M) mat(1; 1; 1) \
    A^((2)) & = sqrt(M/(2 m (M + 2 m))) mat(1; 1; - m/M) \
    A^((3)) & = 1/sqrt(2 m) mat(1; -1; 0)
  $
  因此简正坐标为
  $
    Q_k = sum_(alpha beta) A^(TT(k))_alpha t_(alpha beta) q_beta
  $
  给出
  $
    Q_1 & = 1/sqrt(2 m + M) (m q_1 + m q_2 + M q_3) \
    Q_2 & = sqrt(M/(2 m (M + 2 m))) (m q_1 + m q_2 - m q_3) \
    Q_3 & = 1/sqrt(2 m) (m q_1 - m q_2)
  $
]
==== 简正频率简并(模式退化)

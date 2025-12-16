#import "@preview/scripst:1.1.1": *

= Hamilton动力学

#ref(<Lagrange-Dynamics>, supplement: "章") 介绍了Lagrange力学，建立了Lagrange方程，讨论了它的一些解法。Lagrange方程也可以利用Hamilton原理推得。在后续章节中利用Lagrange方程处理了一些具体问题。本章讨论分析力学的另一重要组成部分：Hamilton动力学(又称Hamilton力学)。

力学的发展和坐标概念的拓展紧密相连，Hamilton正则方程的建立也是和坐标概念的拓展紧密相连的。我们已经经历了坐标概念的拓展的过程
```
直角坐标系 -> 曲线坐标 -> 广义坐标
```
在Lagrange力学中，用广义坐标和广义速度描述质点，适当选择的广义坐标往往有助于力学问题的顺利解决。

对于广义坐标$q_i$，可以引入广义动量$p_i=pdv(L, dot(q)_i)$广义动量可能是动量，角动量等，总之，广义动量不是坐标。

但是如果把*位形空间*的概念推广为*相空间*，使广义坐标和广义动量处于平等(但并不相同)的地位，它们都是相空间的“坐标”，称为*正则变量(或正则共轭坐标)*。这样的“坐标”不仅能描述质点的位置，而且能描述质点的运动状态。于是$s$维广义坐标的空间就被代之以$2s$维的正则变量的相空间。以广义坐标为未知函数的Lagrange方程就被以正则变量为未知函数的正则方程所代替。

而且我们还注意到:两个Lagrange量如果满足一定的关系，例如只相差一个完全导数$L_1(q, dot(q), t)-L_2(q, dot(q), t) = dv(f(q,t), t)$，它们将给出同样的Lagrange方程，但给出不同的广义动量。由于$f$是完全任意的，*所以广义动量的选择可以完全独立于广义坐标的选择*，而具有比广义速度更加深刻的含义。

由广义坐标到*正则变量(正则共轭坐标)*，是坐标概念的又一次重要的飞跃，对力学以致对整个物理学的发展产生了深刻的影响。随着正则变量(正则共轭坐标)的引入而建立起来的*Hamilton正则方程*和由此发展起来的内容极为丰富的Hamilton力学，不仅为求解Lagrange方程提供了又一有效方法和途径，而且对理论物理的发展产生了深刻的影响，特别是对量子力学的建立与发展起了积极的推动作用。仅从数学求解的角度看，引入广义动量，也就是用降阶法(高阶常微分方程，可以化为未知函数个数更多，方程数更多的一阶常微分方程组)来解Lagrange方程。

== Legendre变换

Legendre变换是一个实变量的实值凸函数的对合变换，它把一个变量的函数变换为另一个变量的函数。设$f(x)$是$x$的凸函数，定义$y = dv(f, x)$，则Legendre变换定义为
$
  g(y) = min_x (f(x) - x y) = eval(f(x) - x y)_(x: dv(f, x) = y)
$
此时$f(x)$和$g(y)$互为Legendre变换，即
$
  f(x) = min_y (g(y) + x y) = eval(g(y) + x y)_(y: dv(g, y) = -x)
$
事实上，这就是说：如果$y = dv(f, x)$，则$x = -dv(g, y)$。对于二元函数
$
  f(x, y) , u = pdv(f, x) = (pdv(f, x))_y, v = pdv(f, y) = (pdv(f, y))_x\
  dd(f) = u dd(x) + v dd(y)
$
考虑新函数
$
  g(u, y) = u x - f(x, y), u = pdv(f, x)\
  dd(g) = dd(u) x + u dd(x) - pdv(f, x) dd(x) - pdv(f, y) dd(y) = x dd(u) - v dd(y)
$
从而$g = g(u, y)$，其中
$
  x = (pdv(g, u))_y, v = - (pdv(g, y))_u = (pdv(f, y))_x
$
同理，可以定义
$
  h(x, v) = y v - f(x, y), y = (pdv(h, v))_x, u = - (pdv(h, x))_v
$
以及
$
  k(u, v) = u x + v y - f(x, y), x = (pdv(k, u))_v, y = (pdv(k, v))_u
$
#newpara()
热学中有
$
  dd(Q) = dd(E) + dd(W)
$
将过程量$dd(Q), dd(W)$替换为状态量$S, V$的微分
$
  dd(E) = T dd(S) - p dd(V), E=E(S, V)\
  T = (pdv(E, S))_V, p = - (pdv(E, V))_S
$
再引入焓$H = E + p V$，则
$
  dd(H) = T dd(S) + V dd(p), H=H(S, p)\
  T = (pdv(H, S))_p, V = (pdv(H, p))_S
$
以及Helmholtz自由能$F = E - T S$来研究热平衡和力平衡
$
  dd(F) = - S dd(T) - p dd(V), F=F(T, V)\
  S = - (pdv(F, T))_V, p = - (pdv(F, V))_T
$
和Gibbs自由能$G = E - T S + p V$来研究相变过程
$
  dd(G) = - S dd(T) + V dd(p), G=G(T, p)\
  S = - (pdv(G, T))_p, V = (pdv(G, p))_T
$

== Hamilton正则方程

=== Lagrange方程到Hamilton方程

回到Lagrange力学中，Lagrange方程是含$s$个未知函数$q_i (t)$的$s$个方程组成的二阶常微分方程组，高阶微分方程可以借助降阶法化为一阶微分方程来求解。只要令$dot(q)_i = y_i$，就可以把Lagrange方程
$
  dv(, t)dv(L, dot(q)_i) - dv(L, q_i) = 0, i = 1,2,...,s
$
化为含$2s$个未知函数$q_i, y_i$的$2s$个一阶常微分方程组成的方程组
$
  dv(, t) dv(L, y_i) - dv(L, q_i) & = 0, L = L(q_i,y_i,t) = L(q_i, dot(q)_i,t) \
                   y_i - dot(q)_i & = 0, i = 1,2,...,s
$
换一种方法，$2s$个未知函数取为$q_i, p_i = pdv(L, dot(q)_i)$，即广义坐标和广义动量，则Lagrange方程也可以化为含$q_i, p_i$的$2s$个一阶常微分方程组成的方程组
$
  pdv(L, dot(q)_i) & = p_i \
       pdv(L, q_i) & = dot(p)_i
$
虽取未知函数为$q_i, p_i$，但$L$还为$q_alpha, dot(q)_alpha, t$的函数，这对求解很不方便。

为此，定义Hamilton量$H$为$L$关于$dot(q)_i$的Legendre变换
$
  H(q_i, p_i, t) & = sum_(i=1)^s p_i dot(q)_i - L(q_i, dot(q)_i, t) \
  dd(H) & = sum_i p_i dd(dot(q)_i) + dot(q)_i dd(p_i) - pdv(L, q_i) dd(q_i) - pdv(L, dot(q)_i) dd(dot(q)_i) - pdv(L, t) dd(t) \
  & = sum_i dot(q)_i dd(p)_i - dot(p)_i dd(q)_i - pdv(L, t) dd(t)
$
就有
$
  dot(q)_i = (pdv(H, p_i))_(q_j, p_j (j != i)) = (pdv(L, dot(q)_i))_(q_j, dot(q)_j (j != i)) \
  dot(p)_i = - (pdv(H, q_i))_(q_j, p_j (j != i)) = (pdv(L, q_i))_(q_j, dot(q)_j (j != i)) \
  pdv(H, t) = - pdv(L, t)
$
我们称其为*正则方程*，称$q_i, p_i$为*正则变量(或正则共轭坐标)*。

#theorem(subname: [Hamilton方程])[
  对于任意Lagrange量$L(q_i, dot(q)_i, t)$，定义Hamilton量
  $
    H(q_i, p_i, t) = sum_(i=1)^s p_i dot(q)_i - L(q_i, dot(q)_i, t)
  $
  其中$p_i = pdv(L, dot(q)_i)$，则Hamilton量满足Hamilton正则方程
  $
    dot(q)_i = (pdv(H, p_i))_(q_j, p_j (j != i)) \
    dot(p)_i = - (pdv(H, q_i))_(q_j, p_j (j != i)) \
  $
]

#newpara()

我们前面算能量积分时候说，如果
$
  pdv(L, t) = 0
$
就有$H = p dot(q) - L = "const"$，也就意味着如果Hamilton量不显含时间，则Hamilton量守恒
$
  pdv(H, t) = 0
$
就有
$
  dv(H, t) = pdv(H, t) = - pdv(L, t) = 0
$

#newpara()

类似于Lagrange方程中有关循环坐标的讨论，正则方程中也有与循环坐标对应的运动积分或守恒量。如果Hamilton量不显含某个正则变量 ,由正则方程容易看出与该正则变量对应的共轭量就是守恒量。若$H$不显含$q_i$
$
  dot(p)_i = - pdv(H, q_i) = 0 => p_i = "const"
$
又因为
$
  (pdv(H, q_i))_(p,q) & = pdv(, q_i) (sum_(j=1)^s p_j dot(q)_j)_(p,q) - (pdv(L, q_i))_(p,q) \
  & = sum_(j=1)^s p_j (pdv(dot(q)_j, q_i))_(p,q) - (pdv(L, q_i))_(q,dot(q)) - sum_(j=1)^s (pdv(L, dot(q)_j))_(q,dot(q)) (pdv(dot(q)_j, q_i))_(p,q) \
  & = - (pdv(L, q_i))_(q,dot(q))
$
所以，这里所讲的循环积分与Lagrange方程的循环积分一致；若$H$不显含$p_i$则有积分
$
  dot(q)_i = (pdv(H, p_i))_(p,q) = 0 => q_i = "const"
$
- 一个或若干个广义坐标为常数并不意味着体系静止。
- 前面已经提到，广义坐标和广义动量处于平等的地位，它们之间并无不可逾越的界限，因此$q_i="const"$也可称为循环积分。后续章节的正则变换会对这一点给出更深刻的认识。

=== Hamilton原理

Hamilton原理给出作用量
$
  S = integral_(t_1)^(t_2) L(q_i, dot(q)_i, t) dd(t)
$
的变分原理，变分时$q_i (t_1), q_i (t_2)$不变。对于Lagrange量$L(q_i, dot(q)_i, t)$，$q_i, dot(q)_i$是独立变量，但对于变分量$delta dot(q)_i$却不独立
$
  delta dot(q)_i = dv(, t) delta q_i
$
采用正则变量$q, p$，变分量$delta p_i$和$delta q_i$是独立的，这一点从作用量的变分过程容易得知。作用量变分极小，为
$
  delta S = integral delta L dd(t) = 0
$
求得Lagrange量的等时变分为
$
  delta L & = sum_i (dot(q)_i delta p_i + p_i delta dot(q)_i) - delta H
$
另一方面，Hamilton量的变分又可表示为
$
  delta H & = sum_i (pdv(H, q_i) delta q_i + pdv(H, p_i) delta p_i)
$
就有
$
  delta L & = sum_i ((dot(q)_i - pdv(H, p_i)) delta p_i + (- dot(p)_i - pdv(H, q_i)) delta q_i + dv(, t) (p_i delta q_i))
$
由于$delta q_i$在端点为零，第三项积分自然为零，因此$delta q, delta p$是独立的变分量，由作用量变分极小可得Hamilton正则方程
$
  dot(q)_i = (pdv(H, p_i))_(q_j, p_j (j != i)) \
  dot(p)_i = - (pdv(H, q_i))_(q_j, p_j (j != i)) \
$
这说明了正则方程与Hamilton原理(变分原理)等价，也就与Lagrange方程等价。所以。修正的Hamilton原理是要求*作用量在正则变量的相空间取极值*，而两个端点固定，意味着独立的变分量的，如在端点都是零。

正则方程与Lagrange方程等价这一点也可以从推导正则方程的过程看出来，因为推导过程要用到Lagrange方程。尽管它们等价，但正则方程与Lagrange方程相比，它有其优点：
- 其解不但有广义坐标表达式，而且有共轭动量表达式，内容比较丰富
- 一阶方程在有些情况下更容易求解
- 方程形式对称比较易于研究，因而对正则方程的研究比较深入，已经有了一系列求解的方法

#example(subname: [一维谐振子])[
  由Lagrange量
  $
    L = T - V = 1/2 m dot(x)^2 - 1/2 k x^2
  $
  得Lagrange方程
  $
    m dot.double(x) + k x = 0
  $
  由Lagrange量还可得共轭正则动量
  $
    p = pdv(L, dot(x)) = m dot(x)
  $
  进一步得Hamilton量
  $
    H = p dot(x) - L = p^2/(2 m) + 1/2 k x^2
  $
  由此得正则方程
  $
    dot(x) = pdv(H, p) = p/m \
    dot(p) = - pdv(H, x) = - k x
  $
  正则方程的第一式实际给出广义动量的定义，第二式给出动力学方程，消去$p$后得Lagrange方程。由于Hamilton量不显含时间，有能量积分
  $
    H = p^2/(2 m) + 1/2 k x^2 = "const"
  $
]

#example(subname: [Hamilton量不是能量的例子])[
  例如一个杆绕着轴以$omega$转动，杆与轴的夹角为$alpha$，杆上有一个质量为$m$的小球，与转轴和杆交点距离为$q$，可以自由滑动。

  Lagrange量为
  $
    L = T - V = 1/2 m (dot(q)^2 + q^2 (omega sin alpha)^2) - m g q cos alpha
  $
  这是非稳定的完整约束，$L$不显含时间，其Hamilton量为
  $
    p = pdv(L, dot(q)) = m dot(q) \
  $
  $
    H = p dot(q) - L = p^2/(2 m) - 1/2 m q^2 (omega sin alpha)^2 + m g q cos alpha
  $
  虽然有外力矩作用在杆上，但Hamilton量仍然守恒，因为$L$不显含时间。然而，Hamilton量并不是系统的总能量
  $
    E = T + V = p^2/(2 m) + 1/2 m q^2 (omega sin alpha)^2 + m g q cos alpha
  $
]

#example(subname: [Lagrange量的等价变换])[
  系统Lagrange量$L$，若变为
  $
    L' = L + dv(Lambda(q, t), t)
  $
  $L'$与$L$等价，即导致同一运动方程(Lagrange方程)。求:
  - $p'$与$p$的关系
  - $H'$与$H$的关系
  - Hamilton方程是否等价
]
#solution[
  - 对于广义动量，有
    $
      p'_k = pdv(L', dot(q)_k) = pdv(L, dot(q)_k) + pdv(, t) pdv(Lambda, q_k) = p_k + pdv(Lambda, q_k)
    $
  - 对于Hamilton量，有
    $
      H' & = sum_k p'_k dot(q)_k - L' \
         & = sum_k (p'_k + pdv(Lambda, q_k)) dot(q)_k - L - dv(Lambda, t) \
         & = H(q, p' - pdv(Lambda, q), t) - pdv(Lambda, t)
    $
  - Hamilton方程等价。因为
    $
      pdv(H, p_k) = dot(q)_k, pdv(H, q_k) = - dot(p)_k
    $
    $
      (pdv(H', p'_k))_(q,p') & = pdv(H, p'_k) = pdv(H, p_k) = dot(q)_k \
    $
    $
      pdv(H', q_k) & = pdv(H, q_k) + sum_i pdv(H, p_i) (-pdv(Lambda, q_k, q_i)) - pdv(Lambda, q_k, t) \
                   & = pdv(H, q_k) - sum_i dot(q)_i pdv(Lambda, q_k, q_i) - pdv(Lambda, q_k, t) \
    $
    另一方面
    $
      dot(p)'_k & = dot(p)_k + dv(, t) pdv(Lambda, q_k) \
                & = dot(p)_k + sum_i pdv(Lambda, q_k, q_i) dot(q)_i + pdv(Lambda, q_k, t) \
    $
    相加得
    $
      dot(p)'_k = - pdv(H', q_k)
    $
    这就意味着Hamilton方程形式不变。
]

== 相空间和Liouville定理

求解动力学方程有时候是非常困难的。但有时只需要了解系统的某些特性，这时如果在相空间分析，不用求解方程也能定性得到许多信息。

对于$s$自由度的系统，Hamilton方程为
$
  dot(q)_i = pdv(H, p_i), dot(p)_i = - pdv(H, q_i), i = 1,2,...,s
$
令${q_i},{p_i} => {x_i, i =1,2,...,2 s}$,Hamilton方程可统一表达为
$
  dot(x)_i = X_i (x_1, x_2,...,x_(2 s), t), i = 1,2,...,2 s
$
${x_i}$张开的空间就是相空间。相点在相空间的位置代表系统的状态，*相点随时间移动就形成相轨迹，即，沿相轨迹系统随时间演化*。

给定系统，在相空间根据初始条件的不同有许多可能的相轨迹，或者说在给定时刻可以有许多可能的相点，每个相点都满足上式，每个相点只沿着一个轨迹。某个实际过程当然只能是由其中某个相点的轨迹描述系统实际状态的变化。由于有无数个这样的相点，它们只是初始条件有差异，可以把这些相点集合看作是*相流体*，这些相点随时间的移动可看作是相流体的流动。

=== 保守系统

Hamilton量不显含时间
$
  dot(x)_i = X_i (x_1, x_2,...,x_(2 s)), i = 1,2,...,2 s
$
这时在相空间，某个相轨迹上给定相点的速度(在切线方向)是由位置决定的，且唯一，所以每个相点只有一个轨迹通过，即那些相轨迹相互不相交。

保守系Hamilton量守恒
$
  H = H(x_1, x_2,...,x_(2 s)) = "const"
$
这是相空间内的曲面方程，所有相轨迹只能在该曲面上，不然系统Hamilton量不会守恒。

若所有$dot(x)_i =0$，称为平衡点或奇异点，这点上切线斜率$dot(x)_i/dot(x)_j$不定。然而，在有这个奇异点附近$dot(x)_j approx pdv(X_k, x_i) Delta x_i$，越接近这个点，速度$dot(x)_i$越小，所以从其他相点移动到这个点需要无限长时间(注意$dot(x)_k$包括广义坐标和广义动量的时间导数)，反之亦然。由此可知，相轨迹不经过这个点。亦即Hamilton量为常量的曲面没有奇异点。

*对于局域运动系统，Hamilton量为常量的曲面是$2s$维相空间中的$2s - 1$维闭合面，该闭合面与球面拓扑等价*。比如，$s = 2$情形，Hamilton量为常量的曲面是四维中的三维体，其与球体拓扑等价。

=== 可积系统(integrable)与不变环

有些系统，除了Hamilton量，可能还有其他守恒量。其他守恒量也代表$2s$维相空间中的$2s-1$维闭合面。这些守恒量若相容，简单理解就是这些守恒量对应的曲面有交集，即有共同的低维数的子曲面，此时系统运动轨迹将限制在这个低维数的子曲面上。

如果$s$个自由度系统有$s$个守恒量(运动常数)，这些守恒量不必有解析表示，只要求存在，而且相容，这时候系统在相空间轨迹就可约化到$s$维子相空间，此时系统是*可积系统*。简单地讲，可积就是可以用积分表示解。可积系统的解是稳定的(对初值不敏感)，经典系统混沌只发生在不可积系统。对于自由度为$1$的系统，若Hamilton量不显含时间，总是可积系统。

对于周期运动，相轨迹一般限制在有限的相空间内。$s$自由度的Hamilton系统(Hamilton量不显含时间)如果是可积的，意味着除了Hamilton量还有$s - 1$个守恒量，它们都相容。此时相轨迹就限制在$2s$维相空间中$s$维子相空间内，这个*子相空间一定是在一个中空的$s$维环(s-torus)上*，这个环面称为*不变环*。相流体只能限制在不变环上流动。

以$s=2$为例，相轨迹上切线方向矢量构成的矢量场是在二维曲面上，如果这个曲面是球面，必定有一奇点，该点上矢量无定义，如同头旋一样，如图(a)所示。这个在数学上有一个定理，叫梳子定理(comb theorem)。如果这个曲面是像面包圈一样的环，如图(b)所示，就不会存在奇点的困难。球面 和环面的拓扑结构是不同的，环面有中空不连通区域。另外应注意的是，图(b)所示的环不是四维相空间中的二维环，而是三维中的二维环，但它们拓扑结构相同。
#figure(
  image("pic/2025-12-16-12-24-41.png", width: 60%),
  numbering: none,
)

#example(subname: [一维谐振子])[
  Hamilton量为
  $
    H = p^2/(2 m) + 1/2 k x^2
  $
  系统相空间是$(x,p)$为变量的二维平面，由于Hamilton量不显含时间，所以Hamilton量是守恒量，容易得知*相轨迹是椭圆*。相空间里相点随时间演化过程，实际是沿椭圆运动。
]

#example(subname: [双摆])[
  两个长度为$l$的刚性杆铰接在一起，最上端铰接在固定点处，两个摆锤质量均为$m$，设上摆锤与竖直线夹角为$theta_1$，下摆锤与竖直线夹角为$theta_2$。取$theta_1, theta_2$为广义坐标。
  $
    T = 1/2 m l^2 (dot(theta)_1^2 + dot(theta)_2^2 + 2 dot(theta)_1 dot(theta)_2) \
    V = - m g l (2 cos(theta_1) + cos(theta_2)) \
  $
  考虑
  $
    q_1 = 2 theta_1 + theta_2, q_2 = theta_1 + theta_2
  $
  简正坐标
  $
    Q_1 = sqrt(2) q_1 + q_2, Q_2 = - sqrt(2) q_1 + q_2\
    q_1 = c_1^((1)) Q_1 + c_2^((1)) Q_2, q_2 = c_1^((2)) Q_1 + c_2^((2)) Q_2
  $
  有
  $
    L = 1/2 sum_alpha (dot(Q)_alpha^2 - omega_alpha^2 Q_alpha^2) , alpha = 1,2\
  $
  正则动量
  $
    P_alpha = pdv(L, dot(Q)_alpha) = dot(Q)_alpha
  $
  Hamilton量
  $
    H = 1/2 sum_alpha (P_alpha^2 + omega_alpha^2 Q_alpha^2) = H_1 + H_2\
  $
  我们证明$H_alpha$是常量
  $
    dv(H_alpha, t) & = pdv(H_alpha, Q_alpha) dot(Q)_alpha + pdv(H_alpha, P_alpha) dot(P_alpha) \
                   & = omega_alpha^2 Q_alpha dot(Q)_alpha + P_alpha (- omega_alpha^2 Q_alpha) = 0
  $
  其中
  $
    dot(Q)_alpha = pdv(H, P_alpha) = pdv(H_alpha, P_alpha) = P_alpha \
    dot(P)_alpha = - pdv(H, Q_alpha) = - pdv(H_alpha, Q_alpha) = - omega_alpha^2 Q_alpha
  $
  这就说明$H_1, H_2$都是守恒量，在$(Q_alpha, P_alpha)$的子空间中，相轨迹限制在由$H_alpha$所决定的椭圆上。从而在相空间$(Q_1, Q_2, P_1, P_2)$中，相轨迹限制在由$H_1, H_2$所决定的二维不变环上。

  而$(q_1, q_2, p_1, p_2)$与$(Q_1, Q_2, P_1, P_2)$是线性正则变换关系，所以在$(q_1, q_2, p_1, p_2)$中，相轨迹也限制在一个二维不变环上。

  在$theta >> 0$后，近似就不成立，系统变为不可积系统，出现混沌现象。
]

#newpara()

非保守的完整系统
$
  dot(x)_i = X_i (x_1, x_2,...,x_(2 s), t), i = 1,2,...,2 s
$
因为切线斜率$dot(x)_i/dot(x)_j = (X_i (x_1, x_2,...,x_(2 s), t))/(X_j (x_1, x_2,...,x_(2 s), t))$一般随时间变化，相轨迹可以相交，问题变得更复杂。但我们可以把时间 $t$作为新的自由度正则变量扩充相空间，则系统Hamilton量的负值为其正则共轭动量，组成$2(s +1)$维扩充相空间，在该相空间内就像保守系一样，这里不作更多的讨论。

=== Liouville定理

Liouville定理指出
#theorem(subname: [Liouville定理])[
  如果系统的运动可以用Hamilton方程描述，则在相空间中的相流体就是不可压缩流体。
]

#newpara()

系统状态沿相轨迹随时间演化，因此相点不会消失。相点在相空间中的速度为$2s$维矢量
$
  vb(v) = (dot(q)_1, dot(q)_2,...,dot(q)_s, dot(p)_1, dot(p)_2,...,dot(p)_s)
$
现假定$2s$维相空间有一体积$V$，其表面$S$，相点数密度$n$，则在单位时间里该体积内相点数的增量等于在单位时间里从外面净流入的相点个数。假设相点的速度$vb(c)$则
$
  dv(, t) integral_V n dd(V) = - integral_S n vb(v) dot dd(vb(S))
$
负号是因为取表面外法线方向为正向。表面$S$固定，根据Gauss定理，有
$
  integral_V pdv(n, t) dd(V) = - integral_V div (n vb(v)) dd(V)
$
这里梯度算符$nabla$是$2s$维相空间的。因$V$是任取的，所以一定有
$
  pdv(n, t) + div (n vb(v)) = 0\
  pdv(n, t) + vb(v) dot grad n + n div vb(v) = 0
$
相点数密度$n$应为正则坐标及时间的函数，所以
$
  dv(n, t) & = pdv(n, t) + sum_i (pdv(n, q_i) dot(q)_i + pdv(n, p_i) dot(p)_i)
             = pdv(n, t) + vb(v) dot grad n \
           & = - n div vb(v)
$
由于
$
  div vb(v) & = sum_i (pdv(dot(q)_i, q_i) + pdv(dot(p)_i, p_i)) \
            & = sum_i (pdv(H, p_i, q_i) - pdv(H, q_i, p_i)) = 0
$
从而
$
  dv(n, t) = 0
$
考查一组相点，相点个数一定，随时间在相空间演化，由于相点数密度不随时间变化，所以这组相点对应的相体积保持一定，即*相流体不可压缩*。

#proposition[
  相体积元$dd(V)=dd(q_1) ...dd(q_s) dd(p_1) ... dd(p_s)$对于无限小过程$t -> t + dd(t)$，相点随Hamilton方程演化，因此体积元不变，即
  $
    dd(V)_(t + dd(t)) = det J dd(V)_t = dd(V)_t\
    det J = 1
  $
  这里Jacobi矩阵为
  $
    J = partial(q_1, ..., q_s, p_1, ..., p_s)_(t + dd(t)) / partial(q_1, ..., q_s, p_1, ..., p_s)_t
  $
]

#proposition(subname: [Poincaré复原定理])[
  对于Hamilton系统，如果系统限制在有限的相空间内，则由于给定相流体的体积不变，时间足够长时，这个相流体在相空间流动时必然回到初始相空间的区域。
]
这个定理是准确的，曾经是Mach反对Boltzmann统计理论的重要理由。但由于定理中所讲的时间足够长实际上过于长，在现实中完全无法等到，因此Boltzmann统计理论(准确地讲是熵增原理)与Poincaré复原定理并不矛盾。

#proposition[
  如果系统相点数不变，但不遵守Hamilton方程，则
  $
    n(p(t),q(t)) & = n(p(0),q(0)) exp(- integral_0^t div vb(v) dd(t)) \
                 & = n(p(0),q(0)) exp(- integral_0^t sum_i (pdv(dot(q)_i, q_i) + pdv(dot(p)_i, p_i)) dd(t))
  $
  或
  $
    dd(V(t)) = dd(V(0)) exp(integral_0^t sum_i (pdv(dot(q)_i, q_i) + pdv(dot(p)_i, p_i)) dd(t))
  $
  此时相点数密度随时间演化，相流体体积同样随时间变化。
]

#example(subname: [一维阻尼振动])[
  一维阻尼振动方程为
  $
    dot.double(x) + 2 beta dot(x) + k/m x = 0
  $
  假如只是对微分方程作降阶处理，则可以简单假设
  $
    dot(x) = p\
    dot(p) = - 2 beta p - k/m x
  $
  尽管同样是描述阻尼振动，此时$(x,p)$不再是正则坐标和正则动量，系统也不再是Hamilton系统。因此在$(x ,p)$相空间，相点密度随时间变化。体积元
  $
    dd(V(t)) = dd(V(0)) exp(- 2 beta t)
  $
  显然，相点体积元最终趋于零，即$dd(V(t)) -> 0$，这与阻尼振动最终有$x->0, p->0$符合。
]

#import "@preview/scripst:1.1.1": *

= 绪论

== $N$个粒子系统的Viral定理

对$n$粒子系统的动量$vb(p)_i$与位置$vb(x)_i$求导
$
  dv(, t) (sum_i vb(x)_i dot vb(p)_i) & = sum_i ( dv(vb(x)_i, t) dot vb(p)_i + vb(x)_i dot dv(vb(p)_i, t)) \
                                      & = 2T + sum_i vb(x)_i dot vb(F)_i
$
我们定义物理量$f$在$tau$中的平均值
$
  overline(f) = lim_(tau -> oo) 1/tau integral_0^tau f(t) dd(t)
$
则*限制在有限区域*
$
  overline(dv(, t) (sum_i vb(x)_i dot vb(p)_i)) = lim_(tau -> oo) 1/tau eval((sum_i vb(x)_i dot vb(p)_i))_0^tau = 0
$
就得到了Viral定理
#theorem(subname: [Viral 定理])[
  在有限区域内，$N$个粒子的动能$T$与位置$vb(x)_i$与外力$vb(F)_i$的关系为
  $
    2 overline(T) + overline(sum_i vb(x)_i dot vb(F)_i) = 0
  $
]
对于有势力系统
$
  vb(F) = - grad U\
  U = U(vb(r)_1, vb(r)_2, ..., vb(r)_n)
$
其中
$
  vb(F)_i = - grad_(vb(r)_i) U
$
#example(subname: [$n$个粒子的万有引力系统])[
  $n$个粒子的万有引力系统的势能为
  $
    U = - G/2 sum_(i!=j) (m_i m_j)/abs(vb(r)_i - vb(r)_j)
  $
  $U$是齐次函数
  $
    U(lambda vb(r)_1, lambda vb(r)_2, ..., lambda vb(r)_n) = lambda^(-1) U(vb(r)_1, vb(r)_2, ..., vb(r)_n)
  $
  #definition(subname: [齐次函数])[
    函数$f(x_1, x_2, ..., x_n)$称为齐次函数，如果存在实数$k$使得对任意实数$lambda>0$都有
    $
      f(lambda x_1, lambda x_2, ..., lambda x_n) = lambda^k f(x_1, x_2, ..., x_n)
    $
    则称$f$为*$k$次齐次函数*。
  ]
]
对与齐次关系式
$
  U(alpha vb(r)_1, alpha vb(r)_2, ..., alpha vb(r)_n) = alpha^k U(vb(r)_1, vb(r)_2, ..., vb(r)_n)
$
对$alpha$求导
$
  pdv(, alpha) U(alpha vb(r)_1, alpha vb(r)_2, ..., alpha vb(r)_n) &= sum_i vb(r)_i dot grad_(alpha) U(alpha vb(r)_1, alpha vb(r)_2, ..., alpha vb(r)_n)\
  &=^(vb(r)'_i = alpha vb(r)_i) sum_i vb(r)_i dot grad' U(vb(r)'_1 , vb(r)'_2, ..., vb(r)'_n)
$
$
  pdv(, alpha)(alpha^k U(vb(r)_1, vb(r)_2, ..., vb(r)_n)) & = k alpha^(k-1) U(vb(r)_1, vb(r)_2, ..., vb(r)_n) \
                                                          & = k/alpha U(vb(r)'_1 , vb(r)'_2, ..., vb(r)'_n)
$
从而就得到
$
  sum_i vb(r)_i dot grad_(vb(r)_i) U(vb(r)_1, vb(r)_2, ..., vb(r)_n) = k U(vb(r)_1, vb(r)_2, ..., vb(r)_n)
$
将上式代入Viral定理中就得到
#theorem(subname: [Viral 定理的齐次形式])[
  对于$k$次齐次函数的势能$U$，在有限区域内，$N$个粒子的动能$T$与势能$U$的关系为
  $
    2 overline(T) - k overline(U) = 0
  $
]

#example(subname: [太阳的温度])[
  太阳系中行星的引力势能是$-1$次齐次函数，因此
  $
    2 overline(T) + overline(U) = 0
  $
  利用Viral定理可以估算太阳的温度。假设太阳是由$N$个质量为$m_"sun"$的粒子组成，太阳的总质量为$M_"sun" = N m_"sun"$，半径为$R_"sun"$，则
  $
    3/2 k_B T_B N = overline(T) = -1/2 overline(U) approx G M_"sun"^2/R_"sun"\
    T_B tilde 10^7 K
  $
]

== 符号约定

我们在后续的讨论中，使用下列符号约定：
$
  grad_(vb(r)_i) = pdv(, vb(r)_i) = (pdv(, x_i), pdv(, y_i), pdv(, z_i))
$



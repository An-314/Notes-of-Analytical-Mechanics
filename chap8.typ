#import "@preview/scripst:1.1.1": *

= 正则变换与参考系变换

在一组正则变量下，Hamilton方程可能很难求解，如果变换到另一组正则变量，而且Hamilton方程仍然成立，称这种变换为*正则变换*(canonical transformation)。正则变换以后，新的正则方程可能变得容易求解，这就是引入正则变换的最初动机。

== 正则变换

=== 点变换

点变换是通常的坐标变换。设$s$自由度的系统Lagrange量为$L(q_1, dot(q)_1, ..., q_s, dot(q)_s, t)$，进行坐标变换
$
  Q_i = Q_i (q_1, ..., q_s, t), i = 1, ..., s
$
其逆变换为
$
  q_i = q_i (Q_1, ..., Q_s, t), i = 1, ..., s
$
而广义速度显而易见
$
  dot(q)_i = dot(q)_i (Q_1, ..., Q_s, dot(Q)_1, ..., dot(Q)_s, t), i = 1, ..., s
$
新坐标下的Lagrange量为
$
  L(q_1, dot(q)_1, ..., q_s, dot(q)_s, t) = tilde(L)(Q_1, dot(Q)_1, ..., Q_s, dot(Q)_s, t)
$
前面讨论过在点变换下Lagrange方程仍成立。不仅如此，在新的广义坐标下，引入广义动量
$
  P_i = pdv(tilde(L), dot(Q)_i), i = 1, ..., s
$
进行Legendre变换，得到新的Hamilton量
$
  tilde(H)(Q_1, P_1, ..., Q_s, P_s, t) = sum_(i=1)^s P_i dot(Q)_i - tilde(L)(Q_1, dot(Q)_1, ..., Q_s, dot(Q)_s, t)
$
$tilde(H)$一般与旧的Hamilton量$H$不相同，然而
$
  pdv(tilde(H), P_i) = dot(Q)_i + sum_(j=1)^s P_j (pdv(dot(Q)_j, P_i))_(Q,P) - (pdv(tilde(L), P_i))_(Q,P)
$
因为
$
  (pdv(tilde(L), P_i))_(Q,P) = sum_(j=1)^s (pdv(tilde(L), dot(Q)_j))_(Q, dot(Q)) (pdv(dot(Q)_j, P_i))_(Q,P) = sum_(j=1)^s P_j (pdv(dot(Q)_j, P_i))_(Q,P)
$
从而有
$
  pdv(tilde(H), P_i) = dot(Q)_i
$
同样
$
  pdv(tilde(H), Q_i) = sum_j P_j (pdv(dot(Q)_j, Q_i))_(Q,P) - (pdv(tilde(L), Q_i))_(Q,P)
$
因为
$
  (pdv(tilde(L), Q_i))_(Q,P) &= sum_j (pdv(tilde(L), dot(Q)_j))_(Q, dot(Q)) (pdv(dot(Q)_j, Q_i))_(Q,P) + (pdv(tilde(L), q_i))_(q, dot(q)) (pdv(q_i, Q_i))_(Q,P)\
  &= dv(, t) (pdv(q_i, Q_i))_(Q,P) + sum_j P_j (pdv(dot(Q)_j, Q_i))_(Q,P)
$
所以
$
  pdv(tilde(H), Q_i) = - dv(, t) (pdv(q_i, Q_i))_(Q,P) = - dot(P)_i
$
得到的运动微分方程仍然为正则方程，因此，*点变换是正则变换*。

=== 动量变换

Lagrange量加上坐标变量和时间变量的任意函数的时间全导数项，与原来的Lagrange量等价。实际上，更一般地
$
  tilde(L)(Q_1, dot(Q)_1, ..., Q_s, dot(Q)_s, t) = lambda L(q_1, dot(q)_1, ..., q_s, dot(q)_s, t) - dv(f(q_1, ..., q_s, t), t)
$
其中$f$是任意函数，$lambda$是任意常数。新旧Lagrange量仍然等价，新的Lagrange量的新的广义坐标仍取原来的广义坐标，为
$
  Q_i = q_i, i = 1, ..., s
$
而广义动量则为
$
  P_i = pdv(tilde(L), dot(Q)_i) = pdv(tilde(L), dot(q)_i) = lambda p_i - pdv(f, q_i), i = 1, ..., s
$
新坐标下Hamilton量为
$
  tilde(H)(Q_1, P_1, ..., Q_s, P_s, t) & = sum_(i=1)^s P_i dot(Q)_i - tilde(L)(Q_1, dot(Q)_1, ..., Q_s, dot(Q)_s, t) \
                                       & = lambda(sum_i p_i dot(q)_i - L) + dv(f, t) \
                                       & = lambda H + dv(f, t)
$
有
$
  (pdv(tilde(H), P_i))_(Q,P) & = lambda (pdv(H, P_i))_(q,P) = lambda sum_j (pdv(H, p_j))_(q,p) (pdv(p_j, P_i))_(q,P)
$
而
$
  (pdv(P_j, P_i))_(q,P) = lambda (pdv(p_j, P_i))_(q,P) = delta_(i j) => (pdv(p_j, P_i))_(q,P) = 1/lambda delta_(i j)
$
从而
$
  (pdv(tilde(H), P_i))_(Q,P) = lambda (pdv(H, p_i))_(q,p) 1/lambda = dot(q)_i = dot(Q)_i
$
同样
$
  (pdv(tilde(H), Q_i))_(Q,P) & = (pdv(tilde(H), q_i))_(q,P) \
                             & = lambda (pdv(H, q_i))_(q,P) + (pdv(, q_i) (pdv(f, t)))_(q,P) \
$
其中
$
  (pdv(H, q_i))_(q,P) = (pdv(H, q_i))_(q,p) + sum_j (pdv(H, p_j))_(q,p) (pdv(p_j, q_i))_(q,P) = - dot(p)_i + sum_j dot(q)_j (pdv(p_j, q_i))_(q,P)
$
代回
$
  (pdv(tilde(H), Q_i))_(Q,P) & = lambda(- dot(p)_i + sum_j dot(q)_j (pdv(p_j, q_i))_(q,P)) + (pdv(, q_i) (pdv(f, t)))_(q,P) \
$
又由
$
  (pdv(P_j, q_i))_(q,P) = lambda (pdv(p_j, q_i))_(q,P) - pdv(f, q_j, q_i) = 0 => (pdv(p_j, q_i))_(q,P) = 1/lambda pdv(f, q_j, q_i)
$
代入
$
  (pdv(tilde(H), Q_i))_(Q,P) & = - lambda dot(p)_i + sum_j dot(q)_j (pdv(f, q_j, q_i))_q + (pdv(, q_i) (pdv(f, t)))_q \
                             & = - lambda dot(p)_i + dv(, q_i) (sum_j dot(q)_j pdv(f, q_j) + pdv(f, t)) \
                             & = - lambda dot(p)_i + dv(, q_i) (dv(f, t)) \
                             & = - dv(, t)(P_i + pdv(f, q_i)) = - dot(P)_i
$
正则方程仍成立。因此，*坐标不变而形的动量变换是正则变换*。

=== 接触变换

更一般地，把一组正则变量$q_i p_i$，变换为另一组变量$Q_i , P_j$，称为接触变换(contact transformation)
$
  Q_i = Q_i (q_1, ..., q_s, p_1, ..., p_s, t), i = 1, ..., s\
  P_i = P_i (q_1, ..., q_s, p_1, ..., p_s, t), i = 1, ..., s
$
逆变换为
$
  q_i = q_i (Q_1, ..., Q_s, P_1, ..., P_s, t), i = 1, ..., s\
  p_i = p_i (Q_1, ..., Q_s, P_1, ..., P_s, t), i = 1, ..., s
$
这当 然比起点变换或广义动量变换要普遍得多。此时，新的变量空间下正则方程不一定满足。若要  求新的变量满足Hamilton方程，即新一组变量是新的正则变量，就必须有一定的条件加以限制。

=== 正则变换

*从一组正则变量到另一组正则变量的非奇异变换，叫作正则变换*。对于接触变换式，若满足
$
  abs(partial(Q_1, ..., Q_s, P_1, ..., P_s) / partial(q_1, ..., q_s, p_1, ..., p_s)) != 0
$
且原正则方程
$
  dot(q)_i = pdv(H, p_i), dot(p)_i = - pdv(H, q_i)
$
变换到新的正则方程
$
  dot(Q)_i = pdv(H^*, P_i), dot(P)_i = - pdv(H^*, Q_i)
$
其中
$
  H^* = H^*(Q_1, P_1, ..., Q_s, P_s, t)
$
是另一个适当的以新的正则变量为自变量的Hamilton量，那么这种变换就叫作正则变换。
- $2s$个变量${q_i, p_i}$成为正则变量，就要求用它们来描述的力学体系的动力学方程为正则方程，其中Hamilton量为
  $
    H = H(q_1, p_1, ..., q_s, p_s, t) = eval(sum_(i=1)^s p_i dot(q)_i - L(q_1, dot(q)_1, ..., q_s, dot(q)_s, t))_(dot(q)_i = dot(q)_i (q,p,t))\
  $
  而新的$2s$个变量${Q_i, P_i}$也成为正则变量，就要求用它们来描述的同一力学体系的动力学方程也是正则方程，但其中的$H^*$可以是另一个Hamilton量
  $
    H^* = H^*(Q_1, P_1, ..., Q_s, P_s, t) = eval(sum_(i=1)^s P_i dot(Q)_i - L^*(Q_1, dot(Q)_1, ..., Q_s, dot(Q)_s, t))_(dot(Q)_i = dot(Q)_i (Q,P,t))\
  $
  一般说$H^* != H$，并且$sum_i P_i dot(Q)_i != sum_i p_i dot(q)_i$，以及$L^* != L$。
- 考虑了正则变换，广义坐标和广义动量间已经没有不可逾越的界限。新的Hamilton量与正则变量的变换方式相关(但必定对新的正则变量给出新的正则方程)，$L^*$可能不再等于$T-V$(但对于新的广义坐标和广义速度给出新的Lagrange方程)。

#example(subname: [伸缩变换])[
  $
    Q_i = mu q_i,\
    P_i = nu p_i,\
  $
  由于正则变量只是伸缩变化，只是标度变换，因此也称为相似变换。此时，新的Hamilton量为$H^* =mu nu H$，是正则变换，很容易验算对新变量正则方程成立。
  $
    pdv(H^*, P_k) = mu nu pdv(H, p_k) 1/nu = mu dot(q)_k = dot(Q)_k,\
    pdv(H^*, Q_k) = mu nu pdv(H, q_k) 1/mu = nu pdv(H, q_k) = - dot(P)_k
  $
]

#example[
  $
    Q_i = mu p_i,\
    P_i = nu q_i,\
  $
  Hamilton量变为$H^* = - mu nu H$，是正则变换，很容易验算对新变量正则方程成立。
]

#example[
  $
    Q_i = p_i tan omega t,\
    P_i = q_i cot omega t,\
  $
  构造Hamilton量变为
  $
    H^* = - H + omega/(sin omega t cos omega t) sum_i P_i Q_i
  $
  是正则变换，很容易验算对新变量正则方程成立
  $
    pdv(H^*, P_i) & = - sum_j pdv(H, q_j) pdv(q_j, P_i) + omega/(sin omega t cos omega t) pdv(, P_i) (sum_j P_j Q_j) \
                  & = dot(p)_i tan omega t + omega/(sin omega t cos omega t) Q_i \
                  & = dot(Q)_i - p_i omega/(cos^2 omega t) + omega/(sin omega t cos omega t) p_i tan omega t \
                  & = dot(Q)_i \
  $
  $
    pdv(H^*, Q_i) & = - sum_j pdv(H, p_j) pdv(p_j, Q_i) + omega/(sin omega t cos omega t) pdv(, Q_i) (sum_j P_j Q_j) \
                  & = - dot(q)_i cot omega t + omega/(sin omega t cos omega t) P_i \
                  & = - dot(P)_i - q_i omega/(sin^2 omega t) + omega/(sin omega t cos omega t) q_i cot omega t \
                  & = - dot(P)_i \
  $
]

=== 正则变换的充分必要条件

判定一个接触变换是不是正则变换的基本方法，当然是利用正则变换的定义。

如，一系统Hamilton量为$H(q_1, ..., q_s, p_1, ..., p_s, t)$，现在有形式为
$
  Q_i = Q_i (q_1, ..., q_s, p_1, ..., p_s, t), i = 1, ..., s\
  P_i = P_i (q_1, ..., q_s, p_1, ..., p_s, t), i = 1, ..., s
$
的接触变换，这时总可以得到新的Hamilton量
$
  H^* (Q_1, ..., Q_s, P_1, ..., P_s, t) = H(q_1, ..., q_s, p_1, ..., p_s, t)
$
然后直接检验是否这个新的Hamilton量满足正则方程。但是，这样做未必总是一个最方便的方法。另外这也不是确定新的Hamilton量的唯一方法，也可以有许多其他等价的形式，因此还可以有其他方法。

实际上，利用Hamilton原理，这个问题变得比较容易。对于旧的坐标有
$
  delta S = delta integral_(t_1)^(t_2) (sum_(i=1)^s p_i dot(q)_i - H(q_1, ..., q_s, p_1, ..., p_s, t)) dd(t) = 0
$
对于接触变换的正则变换，在新的坐标下也要求满足Hamilton原理，即
$
  delta S^* = delta integral_(t_1)^(t_2) (sum_(i=1)^s P_i dot(Q)_i - H^*(Q_1, ..., Q_s, P_1, ..., P_s, t)) dd(t) = 0
$
这样就会自然满足正则方程。问题是新的Hamilton量$H^*$不能是任意的，要与原来的Hamilton量有合适的关联，否则新的正则方程描述的将不是同一体系。换句话说，利用$delta S^* = 0$可以得到新的正则方程，但它描述的${Q_i,P_i}$变化规律与通过$delta S = 0$得到的变化规律应该一致。

一种简单的关联是，比较$delta S, delta S^*$，由于在两个积分端点坐标变量的变分为零，所以很容易看出有如下关系成立
$
  lambda (sum_(i=1)^s p_i dot(q)_i - H) = sum_(i=1)^s P_i dot(Q)_i - H^* + dv(F(q_1, ..., q_s, Q_1, ..., Q_s, t), t)
$
其中，$F$是适当的新的和旧的广义坐标的函数。实际上，这就是判断正则变换的*充要条件*。它的严格证明超出了本课程的范围，我们不在这里给出。只给出以下几点说明。
- 对于Lagrange量一般正则变换使得
  $
    L^* (Q_1, dot(Q)_1, ..., Q_s, dot(Q)_s, t) = lambda L(q_1, dot(q)_1, ..., q_s, dot(q)_s, t) - dv(F(q_1, ..., q_s, Q_1, ..., Q_s, t), t)
  $
- 中$lambda$是任意常数，$lambda =1$的正则变换称为*单价正则变换*，$lambda != 1$的正则变换实际上是*单价正则变换和相似变换*的合成。由于相似变换只是一个简单的标度变换，因此只需着重研究单价正则变换。以后如果没有特别说明，正则变换就指单价正则变换。

更普遍地，假设Hamilton原理可以推广到正则变量的相空间，即，作用量在正则变量的相空间取极值，而在两个端点所有正则变量的变分为零，则$F$可以为任何正则变量的适当的函数，例如
$
  lambda (sum_(i=1)^s p_i dot(q)_i - H) = sum_(i=1)^s P_i dot(Q)_i - H^* + dv(F(q_1, ..., q_s, p_1, ..., p_s, t), t)
$

#theorem(subname: [正则变换的充要条件])[
  设一系统的Hamilton量为$H(q_1, ..., q_s, p_1, ..., p_s, t)$，现在有形式为
  $
    Q_i = Q_i (q_1, ..., q_s, p_1, ..., p_s, t), i = 1, ..., s\
    P_i = P_i (q_1, ..., q_s, p_1, ..., p_s, t), i = 1, ..., s
  $
  的接触变换，这时该接触变换是正则变换的充要条件是存在函数$F$和常数$lambda$，使得下式成立
  $
    lambda (sum_(i=1)^s p_i dot(q)_i - H) = sum_(i=1)^s P_i dot(Q)_i - H^* + dv(F(q_1, ..., q_s, Q_1, ..., Q_s, t), t)
  $
  其中，$H^* = H^*(Q_1, ..., Q_s, P_1, ..., P_s, t)$是适当的以新的正则变量为自变量的Hamilton量。
]

=== 正则变换的四种表述方式

正则变换的充要条件中
$
  lambda (sum_(i=1)^s p_i dot(q)_i - H) = sum_(i=1)^s P_i dot(Q)_i - H^* + dv(F(q_1, ..., q_s, Q_1, ..., Q_s, t), t)
$
$F$是*部分旧的和部分新的正则变量的函数*，通过这个函数，新旧变量产生联系，这时$F$称为*生成函数*(generating function)或*母函数*。

令$F = F_1$，且$lambda =1$，则简单整理后得
$
  dd(F_1 (q_1, ..., q_s, Q_1, ..., Q_s, t)) & = sum_(i=1)^s p_i dd(q)_i - sum_(i=1)^s P_i dd(Q)_i + (H^* - H) dd(t) \
$
容易看出
$
  P_i = - pdv(F_1, Q_i), p_i = pdv(F_1, q_i), H^* = H + pdv(F_1, t)
$
即$p_i, P_i$可由$F_1$求得，这就是生成函数的意义。这是第一种形式的变换。还有
$
  Q_i = (pdv(H^*, P_i))_(Q,P), P_i = - (pdv(H^*, Q_i))_(Q,P)
$
#newpara()
如果取
$
  F_2 (q_1, ..., q_s, P_1, ..., P_s, t) = sum_(i=1)^s P_i Q_i + F_1 (q_1, ..., q_s, Q_1, ..., Q_s, t)
$
这是$F_1 -> F_2$的Legendre变换，是第二种形式的变换
$
  dd(F_2 (q_1, ..., q_s, P_1, ..., P_s, t)) & = sum_(i=1)^s p_i dd(q)_i + sum_(i=1)^s Q_i dd(P_i) + (H^* - H) dd(t) \
$
以及
$
  Q_i = pdv(F_2, P_i), p_i = pdv(F_2, q_i), H^* = H + pdv(F_2, t)
$
#newpara()

取
$
  F_3 (p_1, ..., p_s, Q_1, ..., Q_s, t) = - sum_(i=1)^s p_i q_i + F_1 (q_1, ..., q_s, Q_1, ..., Q_s, t)
$
这是$F_1 -> F_3$的Legendre变换，是第三种形式的变换
$
  dd(F_3 (p_1, ..., p_s, Q_1, ..., Q_s, t)) & = - sum_(i=1)^s q_i dd(p)_i - sum_(i=1)^s P_i dd(Q)_i + (H^* - H) dd(t) \
$
以及
$
  P_i = - pdv(F_3, Q_i), q_i = - pdv(F_3, p_i), H^* = H + pdv(F_3, t)
$
#newpara()

取
$
  F_4 (p_1, ..., p_s, P_1, ..., P_s, t) = - sum_(i=1)^s p_i q_i + sum_(i=1)^s P_i Q_i + F_1 (q_1, ..., q_s, Q_1, ..., Q_s, t)
$
这是$F_1 -> F_4$的Legendre变换，是第四种形式的变换
$
  dd(F_4 (p_1, ..., p_s, P_1, ..., P_s, t)) & = - sum_(i=1)^s q_i dd(p)_i + sum_(i=1)^s Q_i dd(P_i) + (H^* - H) dd(t) \
$
以及
$
  Q_i = pdv(F_4, P_i), q_i = - pdv(F_4, p_i), H^* = H + pdv(F_4, t)
$
#newpara()

四种不同表述方式，由于采用不同的独立变量，因而生成函数不同，它们之间的关系是Legendre变换。另外，在这里应该对每个偏导数的含义要弄清楚，例如
$
  (pdv(F_1, t))_(q,Q) = (pdv(F_2, t))_(q,P) = (pdv(F_3, t))_(p,Q) = (pdv(F_4, t))_(p,P) = H^* - H
$
看起来相似，但细节不同，可以验证它们相同，如
$
  (pdv(F_3, t))_(p,Q) &= (pdv(F_1, t))_(p,Q) - (pdv(, t) sum_i p_i q_i)_(p,Q)\
  &= (pdv(F_1, t))_(q,Q) + sum_(i=1)^s (pdv(F_1, q_i))_(Q, t) (pdv(q_i, t))_(p,Q) - sum_(i=1)^s p_i (pdv(q_i, t))_(p,Q)\
  &= (pdv(F_1, t))_(q,Q)
$
利用上述四种形式的变换不仅能用来判定正则变换，而且能用生成函数简洁地给定一个正则变换。但是上述四种形式并非囊括所有正则变换的情况，还有其他形式的正则变换，这里不再列举。有些情况，生成函数是存在的，且不恒等于零，只是难以表为显函数。

#example(subname: [点变换])[
  任何点变换
  $
    Q_i = f_i (q_1, ..., q_s, t)
  $
  构造最简单的第二类变换生成函数，可以生成$Q_i$
  $
    F_2 (q_1, ..., q_s, P_1, ..., P_s, t) = sum_(i=1)^s f_i (q_1, ..., q_s, t) P_i
  $
  此时$F_1 = 0$，则
  $
    Q_i = pdv(F_2, P_i) = f_i (q_1, ..., q_s, t),\
    p_i = pdv(F_2, q_i) = sum_(j=1)^s pdv(f_j, q_i) P_j,\
    H^* = H + pdv(F_2, t) = H + sum_(i=1)^s pdv(f_i, t) P_i
  $
  #newpara()
  特别地，如果取
  $
    F_2 = sum_i q_i P_i
  $
  则得到*恒等变换*
  $
    p_i = pdv(F_2, q_i) = P_i,\
    Q_i = pdv(F_2, P_i) = q_i,\
  $
  新旧正则变量完全相同，$H^* = H + pdv(F_2, t) = H$，这就是恒等变换。

  在点变换$Q_i = f_i (q_1, ..., q_s, t)$下，不能利用第一种形式的生成函数$F = F_1 (q_1, ..., q_s, Q_1, ..., Q_s, t)$给出正则变换，因为此时${q_i},{Q_i}$直接关联，不互相独立。
]

#newpara()

事实上，我们可以看到通过构造出适当的生成函数，使得全导数的等式成立，我们就能证明该接触变换是正则变换。

=== 无穷小正则变换

无穷小正则变换非常有用。利用例恒等变换构造无穷小变换，令
$
  F_2 (q_1, ..., q_s, P_1, ..., P_s, t) = sum_(i=1)^s q_i P_i + epsilon G(q_1, ..., q_s, P_1, ..., P_s, t)
$
其中，$epsilon$是无穷小量
$
  p_i = pdv(F_2, q_i) = P_i + epsilon pdv(G, q_i),\
  Q_i = pdv(F_2, P_i) = q_i + epsilon pdv(G, P_i)
$
作为无穷小近似，保留$epsilon$的一阶小量，则
$
  F_2 (q_1, ..., q_s, P_1, ..., P_s, t) & approx sum_(i=1)^s q_i P_i + epsilon G(q_1, ..., q_s, p_1, ..., p_s, t) \
$
上式变为
$
  P_i = p_i - epsilon pdv(G, q_i),\
  Q_i = q_i + epsilon pdv(G, p_i)
$
$G$称为*无穷小正则变换生成函数*。令
$
  G = H, epsilon = dd(t)
$
由正则方程有
$
  pdv(G, q_i) = pdv(H, q_i) = - dot(p)_i, pdv(G, p_i) = pdv(H, p_i) = dot(q)_i
$
代入
$
  P_i = p_i + dot(p)_i dd(t) = p_i + dd(p_i)\
  Q_i = q_i + dot(q)_i dd(t) = q_i + dd(q_i)
$
上述式表明正则变量随时间的演化，实际就是相继进行无穷小正则变换的过程。

=== 正则变换的关键

作为正则方程的一种解法，*正则变换的关键在于出现尽可能多的循环坐标*，这样就可以很快地得到尽可能多的运动积分。

实际应用过程往往很繁杂，在实用意义上正则变换没有什么优势。事实上，正则变换能帮助我们深入认识力学的理论架构，其重要性体现在理论意义上，而不是在实用性上。

#example(subname: [一维谐振子])[
  先考虑一维谐振子Hamilton量
  $
    H = p^2/(2m) + 1/2 m omega^2 q^2
  $
  作不含时间的变换
  $
    p = f(P) cos Q\
    q = f(P)/(m omega) sin Q\
  $
  这样选择是因为能导致
  $
    H = f(P)^2/(2m)
  $
  如果这个变换是正则变换，$Q$将成为循环坐标，$P$则是运动积分守恒。

  注意到
  $
    p/q = m omega cot Q => p = m omega q cot Q
  $
  显然运用第一类生成函数是最方便的。
  $
    p = m omega q cot Q = pdv(F_1, q)
  $
  考虑最简单情况，取
  $
    F_1 (q,Q) = 1/2 m omega q^2 cot Q
  $
  于是
  $
    P = - pdv(F_1, Q) = 1/2 m omega q^2 csc^2 Q => q = plus.minus sqrt((2P)/(m omega)) sin Q
  $
  简单地取正号，则
  $
    f(P) = sqrt(2 m omega P)
  $
  这样我们就找到了正则变换
  $
    p = sqrt(2 m omega P) cos Q,\
    q = sqrt((2P)/(m omega)) sin Q
  $
  以及新的Hamilton量
  $
    H^* = H + pdv(F_1, t) = H = omega P
  $
  $H^*$不显含时间，有能量守恒定律
  $
    H^* = H = epsilon P = E
  $
  Hamilton方程为
  $
    dot(Q) = pdv(H^*, P) = omega => Q = omega t + phi\
    dot(P) = - pdv(H^*, Q) = 0 => P = C = E / omega
  $
  $
    q = 1/omega sqrt((2E)/m) sin(omega t + phi), p = sqrt(2 m E) cos(omega t + phi)
  $
  #newpara()
  进一步考虑$2$个自由度谐振子
  $
    H = p_1^2/(2m) + p_2^2/(2m) + 1/2 m omega_1^2 q_1^2 + 1/2 m omega_2^2 q_2^2
  $
  由一维谐振子情形得到的启发，取
  $
    F_1 (q, Q) = 1/2 m omega_1 q_1^2 cot Q_1 + 1/2 m omega_2 q_2^2 cot Q_2
  $
  由此得到正则变换
  $
    p_1 = pdv(F_1, q_1) = m omega_1 q_1 cot Q_1\
    p_2 = pdv(F_1, q_2) = m omega_2 q_2 cot Q_2\
    P_1 = - pdv(F_1, Q_1) = 1/2 m omega_1 q_1^2 csc^2 Q_1\
    P_2 = - pdv(F_1, Q_2) = 1/2 m omega_2 q_2^2 csc^2 Q_2\
  $
  $
    H^* = H = omega_1 P_1 + omega_2 P_2
  $
  Hamilton方程为
  $
    dot(Q)_1 = pdv(H^*, P_1) = omega_1 => Q_1 = omega_1 t + phi_1\
    dot(P)_1 = - pdv(H^*, Q_1) = 0 => P_1 = "const"\
    dot(Q)_2 = pdv(H^*, P_2) = omega_2 => Q_2 = omega_2 t + phi_2\
    dot(P)_2 = - pdv(H^*, Q_2) = 0 => P_2 = "const"\
  $
  $
    q_1 = sqrt((2P_1)/(m omega_1)) sin(omega_1 t + phi_1), p_1 = sqrt(2 m omega_1 P_1) cos(omega_1 t + phi_1)\
    q_2 = sqrt((2P_2)/(m omega_2)) sin(omega_2 t + phi_2), p_2 = sqrt(2 m omega_2 P_2) cos(omega_2 t + phi_2)
  $
  其中
  $
    E = H = omega_1 P_1 + omega_2 P_2
  $
]

== 参考系变换

假设有两个参考系$S$和$S'$，两个参考系上分别固定两个坐标系。若质量为$m$的质点坐标分别为$vb(r)$和$vb(r)'$则正则变换与参考系变换有何联系？

=== 惯性系与平动加速系

假设$S$系是惯性系，而$S'$系相对于$S$系作直线加速运动，加速度为$vb(a)_0 = dot(vb(v))_0$。则
$
  vb(v)' = vb(v) - vb(v)_0
$
而
$
  vb(r)' = vb(r) - vb(r)_0(t)
$
其中
$
  dot(vb(r)_0) = vb(v)_0 <=> vb(r)_0 (t) = integral vb(vb(v)_0) dd(t)
$
这是点变换，可选择生成函数的第二种
$
  F_2 = sum_i (r_i - r_(0 i) (t)) p'_i
$
其中$r_i$代表$x,y,z$，则有
$
  p_i = pdv(F_2, r_i) = p'_i\
  r'_i = pdv(F_2, p'_i) = r_i - r_(0 i) (t)\
  H^* = H + pdv(F_2, t) = H - sum_i p'_i dv(r_(0 i), t) = H - sum_i p'_i v_(0 i) = H - vb(p)' dot vb(v)_0
$
正则方程为
$
  dot(r)'_i = pdv(H^*, p'_i) = pdv(H, p_i) - v_(0 i) = dot(r)_i - v_(0 i)\
  dot(p)'_i = - pdv(H^*, r'_i) = - pdv(H, r_i) = dot(p)_i
$
再看Lagrange量，假设$S$系下Lagrange量$L$，则正则变换后Lagrange量为
$
  L^* & = vb(p)' dot dot(vb(r))' - H^* \
      & = vb(p) dot (dot(vb(r)) - vb(v)_0) - (H - vb(p)' dot vb(v)_0) \
      & = vb(p) dot dot(vb(r)) - H = L
$
这意味着正则变换后Lagrange量还是变换前惯性系的量，只是其中坐标用了$S'$系的坐标而已。这说明我们并非做了“参考系”变换，而仅仅是坐标变换而已。

#example[
  对Hamilton量
  $
    H = vb(p)^2/(2m) + V(x,y,z)
  $
  变换前Hamilton量不显含时间，是守恒量。作平动加速系正则变换，新的Hamilton量为
  $
    H^* = vb(p)'^2/(2m) + V(x' + x_0 (t), y' + y_0 (t), z' + z_0 (t)) - vb(p)' dot vb(v)_0
  $
  Hamilton量显含时间，不再是守恒量了。原因很简单，因为
  $
    dv(H^*, t) = pdv(H^*, t) = grad V dot vb(v)_0 - vb(p)' dot vb(a)_0 = - vb(F) dot vb(v)_0 - vb(p)' dot vb(a)_0
  $
  系统等效于有个功率输入量，即使$vb(a)_0 = dot(vb(v))_0 = 0$，这个结论仍不变。

  正则方程
  $
    dot(r)'_i = pdv(H^*, p'_i) = p'_i/m - v_(0 i)\
    dot(p)'_i = - pdv(H^*, r'_i) = - pdv(V, r_i) = dot(p)_i
  $
  第一个式子代入第二个式子有
  $
    - pdv(V, r_i) - m a_(0 i) = m dot.double(r)'_i
  $
  分量式写成矢量形式
  $
    - grad V - m vb(a)_0 = m dot.double(vb(r))'
  $
  其中$- m vb(a)_0$是惯性力。
]

=== 惯性系与转动系

假设$S$系是惯性系，而$S'$系相对$S$系作转动，转动角速度为$vb(Omega)$。为了简单起见，假设转动系作定点转动，两个坐标系原点重合，且设置在定点，则质点的位置$vb(r)'=vb(r)$，其中$vb(r) = x vu(i) + y vu(j) + z vu(k)$，$vb(r)' = x' vu(i)' + y' vu(j)' + z' vu(k)'$。与上面两种相互平动的参考系不同，转动时坐标轴的方向随时间变化。

坐标变换关系为
$
  vb(r)' = cal(U) vb(r)\
  mat(x'; y'; z') = mat(vu(i)' dot vu(i), vu(i)' dot vu(j), vu(i)' dot vu(k); vu(j)' dot vu(i), vu(j)' dot vu(j), vu(j)' dot vu(k); vu(k)' dot vu(i), vu(k)' dot vu(j), vu(k)' dot vu(k)) mat(x; y; z) = cal(U) mat(x; y; z)
$
$cal(U)$是实正交矩阵，则
$
  r'_i = sum_j U_(i j)(t) r_j
$
显然这是点变换，是正则变换，可选看生成函数的第二种形式
$
  F_2 = sum_(i j) U_(i j)(t) p'_i r_j
$
得到
$
  p_i = pdv(F_2, r_i) = sum_j U_(j i) p'_j = sum_j U^TT_(i j) p'_j\
  r'_i = pdv(F_2, p'_i) = sum_j U_(i j) r_j\
  H^* = H + pdv(F_2, t) = H + sum_(i j) dot(U)_(i j) p'_i r_j
$
由于$cal(U)$是实正交矩阵，动量分量变换方式与坐标分量变换方式实际上一致，说明动量矢量在正则变换前后没有改变，只是分量变化。其中$cal(U)$矩阵元对时间求导项，为了方便表述，用$vu(e)'_i$代表$vu(i), vu(j), vu(k)$，则
$
  dot(U)_(i j) = dot(vu(e)')_i dot vu(e)_j = (vb(Omega) times vu(e)'_i) dot vu(e)_j
$
代入
$
  H^* = H + sum_(i j) (vb(Omega) times vu(e)'_i) dot vu(e)_j p'_i r_j &= H + vb(Omega) dot sum_i (vb(r)' times vu(e)'_i) p'_i = H + vb(Omega) dot (vb(r)' times vb(p)')\
  &= H + vb(Omega) dot vb(J)'
$
假设$S$系Lagrange量$L$，则正则变换后的Lagrange量应为
$
  L^* = vb(p)' dot dot(vb(r))' - H^*
$
其中
$
  dot(r)'_i = sum_j dot(U)_(i j) r_j + sum_j U_(i j) dot(r)_j
$
从而新的Lagrange量为
$
  L^* & = vb(p)' dot (cal(U) dot(vb(r)) + dot(cal(U)) vb(r)) - (H + vb(p)' dot(cal(U)) vb(r)) \
      & = L + vb(p)' dot (dot(cal(U)) vb(r)) - vb(p)' dot (cal(U)) vb(r) \
      & = L
$
即，生成函数的正则变换并没改变Lagrange量，只是其中坐标用了$S'$系的坐标。

多粒子情形与一个粒子情形类似，方法没有什么本质差别，因此
$
  H^* = H + vb(Omega) dot vb(J)'
$
式适用于多粒子情形。原子核结构理论中有一个著名的推转模型，就是利用了这个式子。

== Poisson括号

=== Poisson括号

设$phi,psi$都是正则变量${q_i, p_i}$和时间$t$的任意足够光滑的函数
$
  phi = phi(q_1, ..., q_s, p_1, ..., p_s, t),\
  psi = psi(q_1, ..., q_s, p_1, ..., p_s, t)
$
$phi,psi$的Poisson括号定义为
$
  {phi, psi} = sum_(i=1)^s (pdv(phi, q_i) pdv(psi, p_i) - pdv(phi, p_i) pdv(psi, q_i))
$
注意：求偏导数时，$q_i, p_i$是相互独立的变量，但求全导数时$q_i, p_i$是时间$t$的函数，即
$
  pdv(p_i, q_j) = 0, pdv(p_i, p_j) = delta_(i j), pdv(p_i, t) = 0\
  pdv(q_i, q_j) = delta_(i j), pdv(q_i, p_j) = 0, pdv(q_i, t) = 0\
  dot(q)_i = dv(q_i, t), dot(p)_i = dv(p_i, t), dv(, t) = pdv(, t) + sum_i (pdv(, q_i) dot(q)_i + pdv(, p_i) dot(p)_i)
$

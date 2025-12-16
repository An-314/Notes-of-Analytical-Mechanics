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

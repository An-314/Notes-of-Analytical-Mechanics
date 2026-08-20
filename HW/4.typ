#import "@preview/scripst:1.1.2": *

#show: scripst.with(title: [分析力学第4次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)

#exercise(subname: [2.11])[
  地球大气密度随高度变化。设分子数密度 $n(y)=n_0 e^(-alpha y)$，折射率为 $sqrt(1+beta n(y))$。太阳光以入射角 $theta$ 进入大气，忽略地球曲率，利用泛函变分给出光线轨迹方程。
]
#solution[
  费马泛函为
  $
    I[y]=integral sqrt(1+beta n_0 e^(-alpha y)) sqrt(1+y'^2) dd(x).
  $
  被积函数不显含 $x$，故
  $
    sqrt(1+beta n_0 e^(-alpha y))/sqrt(1+y'^2)=sin theta.
  $
  因而
  $
    y'^2=(cos^2 theta+beta n_0 e^(-alpha y))/sin^2 theta.
  $
  分离变量并积分，得到隐式轨迹
  $
    x-x_0=-tan theta/alpha ln(
      (sqrt(cos^2 theta+beta n_0 e^(-alpha y))-cos theta)
      /(sqrt(cos^2 theta+beta n_0 e^(-alpha y))+cos theta)
    ).
  $
]

#exercise(subname: [2.16])[
  质量 $m$、电荷 $e$ 的粒子在电磁场中运动，其非相对论拉格朗日量为
  $
    L=1/2 m v^2-e phi+e bold(A) dot bold(v).
  $
  利用哈密顿原理给出运动微分方程。
]
#solution[
  Euler-Lagrange 方程给出
  $
    m dot.double(x_i)=e(-pdv(phi, x_i)-pdv(A_i, t)
      +sum_j (pdv(A_j, x_i)-pdv(A_i, x_j)) dot(x_j)).
  $
  利用 $bold(E)=-grad phi-pdv(bold(A), t)$ 和 $bold(B)=curl bold(A)$，可写成 Lorentz 力方程
  $
    m bold(a)=e(bold(E)+bold(v) times bold(B)).
  $
]

#exercise(subname: [3.1])[
  带电粒子以速度 $v$ 在匀强磁场中运动，相对论拉格朗日量为
  $
    L=-m c^2 sqrt(1-v^2/c^2)+e bold(A) dot bold(v).
  $
  证明系统具有空间反演对称性。
]
#proof[
  空间反演下 $bold(r) arrow.r.long -bold(r)$、$bold(v) arrow.r.long -bold(v)$，而磁场是轴矢量，矢势作为极矢量满足 $bold(A)(bold(r)) arrow.r.long -bold(A)(-bold(r))$。于是
  $
    v^2 arrow.r.long v^2,
    quad bold(A) dot bold(v) arrow.r.long (-bold(A)) dot (-bold(v))=bold(A) dot bold(v).
  $
  因而 $L(-bold(r),-bold(v))=L(bold(r),bold(v))$，系统具有空间反演对称性。
]

#exercise(subname: [3.2])[
  带电粒子在静电场中运动。利用拉格朗日量证明系统具有时间反演对称性。
]
#proof[
  静电场中
  $
    L(bold(r),bold(v))=1/2 m v^2-e phi(bold(r)).
  $
  时间反演 $t arrow.r.long -t$ 使 $bold(r) arrow.r.long bold(r)$、$bold(v) arrow.r.long -bold(v)$，但 $v^2$ 和 $phi(bold(r))$ 均不变。因此
  $
    L(bold(r),-bold(v))=L(bold(r),bold(v)),
  $
  故运动方程具有时间反演对称性。
]

#exercise(subname: [3.3])[
  证明质点在有心力作用下的运动轨迹一定在一个平面内。
]
#proof[
  有心力满足 $bold(F)=F(r) bold(e)_r$，故力矩
  $
    bold(tau)=bold(r) times bold(F)=0.
  $
  因而角动量 $bold(J)=bold(r) times bold(p)$ 守恒。又
  $
    bold(r) dot bold(J)=bold(r) dot (bold(r) times bold(p))=0,
  $
  所以任意时刻 $bold(r)$ 都位于垂直于固定矢量 $bold(J)$ 的同一平面内。
]

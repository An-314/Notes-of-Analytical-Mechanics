#import "@preview/scripst:1.1.2": *
#show: scripst.with(
  title: [分析力学第12次作业],
  author: "Anzreww",
  time: "2025年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)

#exercise(subname: [7.5])[
  用泊松括号证明 $Q=sqrt(2p)sin q$、$P=sqrt(2p)cos q$ 是正则变换。
]
#proof[
  $
    {Q,P}=pdv(Q, q)pdv(P, p)-pdv(Q, p)pdv(P, q)
    =cos^2q+sin^2q=1.
  $
  一维情形下这已证明变换是正则的。
]

#exercise(subname: [7.7])[
  用泊松括号证明
  $
    Q_i=q_i cos theta_i-p_i sin theta_i,
    quad P_i=q_i sin theta_i+p_i cos theta_i
  $
  是正则变换。
]
#proof[
  由
  $
    pdv(Q_i, q_k)=cos theta_i delta_(i k),
    quad pdv(Q_i, p_k)=-sin theta_i delta_(i k),
  $
  以及 $P_i$ 的对应导数，逐项计算得
  $
    {Q_i,P_j}=delta_(i j), quad {Q_i,Q_j}=0,
    quad {P_i,P_j}=0.
  $
  故该变换为正则变换。
]

#exercise(subname: [7.10])[
  证明角动量 $bold(J)=(J_1,J_2,J_3)$ 的分量满足 ${J_1,J_2}=J_3$。
]
#proof[
  由 $bold(J)=bold(r) times bold(p)$，
  $
    J_1=y p_z-z p_y, quad J_2=z p_x-x p_z.
  $
  因而
  $
    {J_1,J_2}=sum_i (pdv(J_1, x_i)pdv(J_2, p_i)-pdv(J_1, p_i)pdv(J_2, x_i))
    =x p_y-y p_x=J_3.
  $
  循环置换可得一般关系 ${J_i,J_j}=epsilon_(i j k) J_k$。
]

#exercise(subname: [7.12])[
  在中心力场 $V(r)=-k/r$ 中，除能量、动量与角动量外，还有 Laplace-Runge-Lenz 矢量
  $
    bold(A)=bold(p) times bold(J)-m k bold(r)/r.
  $
  利用泊松括号证明该矢量守恒。
]
#proof[
  哈密顿量为 $H=p^2/(2m)-k/r$。利用
  $
    dot(bold(r))={bold(r),H}=bold(p)/m,
    quad dot(bold(p))={bold(p),H}=-k bold(r)/r^3,
  $
  以及 $dot(bold(J))=0$，有
  $
    dot(bold(A))=dot(bold(p)) times bold(J)-m k dv(bold(r)/r, t).
  $
  又
  $
    (-k bold(r)/r^3) times (bold(r) times bold(p))
    =k/r^3(bold(r)(bold(r) dot bold(p))-r^2bold(p)),
  $
  而
  $
    m k dv(bold(r)/r, t)=k/r bold(p)-k/r^3 bold(r)(bold(r) dot bold(p)).
  $
  两项恰好抵消，故 $dot(bold(A))={bold(A),H}=0$。
]

#exercise(subname: [7.13])[
  计算 Laplace-Runge-Lenz 矢量各分量之间的泊松括号。
]
#solution[
  写成
  $
    bold(A)=bold(p) times (bold(r) times bold(p))-m k bold(r)/r.
  $
  利用基本括号、${J_i,J_j}=epsilon_(i j k) J_k$ 以及
  $
    {J_i,A_j}=epsilon_(i j k)A_k,
  $
  展开并合并各项可得
  $
    {A_i,A_j}=-2m H epsilon_(i j k) J_k.
  $
]

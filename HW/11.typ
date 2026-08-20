#import "@preview/scripst:1.1.2": *
#show: scripst.with(
  title: [分析力学第11次作业],
  author: "Anzreww",
  time: "2025年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)
#set text(size: 10pt)

#exercise(subname: [7.2])[
  用生成函数和泊松括号两种方法证明 $Q=ln(sin p/q)$、$P=q cot p$ 是正则变换。
]
#solution[
  由 $tan p=q/P$，可将 $Q$ 写成 $Q=-ln(P^2+q^2)/2$。第二类生成函数满足 $Q=pdv(F_2, P)$、$p=pdv(F_2, q)$，积分可取
  $
    F_2(q,P)=-P/2 ln(P^2+q^2)-q arctan(P/q)+C.
  $
  另一方面直接计算得
  $
    {Q,P}=pdv(Q, q)pdv(P, p)-pdv(Q, p)pdv(P, q)=1,
  $
  故变换为正则变换。
]

#exercise(subname: [7.3])[
  用两种方法证明 $Q=-p$、$P=q+a p^2$ 是正则变换，并求生成函数。
]
#solution[
  直接有 ${Q,P}=1$。又 $p=-Q$、$P=q+a Q^2$。取第一类生成函数 $F_1(q,Q)$，由 $p=pdv(F_1, q)=-Q$、$P=-pdv(F_1, Q)$，得
  $
    F_1(q,Q)=-q Q-a Q^3/3+C.
  $
]

#exercise(subname: [7.4])[
  用两种方法证明 $Q=arctan(alpha q/p)$、$P=alpha q^2/2(1+p^2/(alpha^2q^2))$ 是正则变换，并求生成函数。
]
#solution[
  由 $tan Q=alpha q/p$，得到 $P=alpha q^2/(2sin^2Q)$。取第一类生成函数，由 $p=pdv(F_1, q)=alpha q cot Q$，积分得
  $
    F_1(q,Q)=alpha q^2 cot Q/2+C.
  $
  并有 $-pdv(F_1, Q)=alpha q^2/(2sin^2Q)=P$。直接计算同样给出 ${Q,P}=1$。
]

#exercise(subname: [7.5])[
  用两种方法证明 $Q=sqrt(2p)sin q$、$P=sqrt(2p)cos q$ 是正则变换，并求生成函数。
]
#solution[
  直接计算
  $
    {Q,P}=pdv(Q, q)pdv(P, p)-pdv(Q, p)pdv(P, q)=1.
  $
  又 $p=P^2/(2cos^2q)$、$Q=P tan q$。第二类生成函数可取
  $
    F_2(q,P)=P^2 tan q/2+C,
  $
  因为 $p=pdv(F_2, q)$ 且 $Q=pdv(F_2, P)$。
]

#exercise(subname: [7.6])[
  用两种方法证明
  $
    Q_1=q_1q_2, quad P_1=1-(p_1+p_2)/(q_1-q_2)
  $
  是某正则变换的一部分，并求其余变量和生成函数。
]
#solution[
  可补全为
  $
    Q_2=q_1+q_2,
    quad P_2=-q_1-q_2+(q_1p_1-q_2p_2)/(q_1-q_2).
  $
  直接计算可验证 ${Q_i,P_j}=delta_(i j)$ 且同类括号为零。相应第二类生成函数可取
  $
    F_2(q_1,q_2,P_1,P_2)=q_1q_2P_1+(q_1+q_2)P_2+(q_1^2+q_2^2)/2.
  $
]

#exercise(subname: [7.7])[
  用两种方法证明
  $
    Q_i=q_i cos theta_i-p_i sin theta_i,
    quad P_i=q_i sin theta_i+p_i cos theta_i
  $
  是正则变换，并求生成函数。
]
#solution[
  这是每个相平面内的旋转，直接计算得
  $
    {Q_i,P_j}=delta_(i j), quad {Q_i,Q_j}={P_i,P_j}=0.
  $
  由 $p_i=P_i sec theta_i-q_i tan theta_i$ 和 $Q_i=q_i sec theta_i-P_i tan theta_i$，第二类生成函数可写为
  $F_2=sum_i (q_i P_i sec theta_i-(q_i^2+P_i^2)tan theta_i/2)$。
]

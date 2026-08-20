#import "@preview/scripst:1.1.2": *
#show: scripst.with(
  title: [分析力学第10次作业],
  author: "Anzreww",
  time: "2025年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [6.16])[
  一维谐振子的哈密顿量为 $H=p^2/(2m)+m omega^2q^2/2$。（1）引入动量空间拉格朗日量 $K(dot(p),p,t)=L(q,dot(q),t)-p dot(q)-q dot(p)$，证明其形式与坐标空间拉格朗日量相同；（2）证明动量空间方程与坐标空间形式相同。
]
#proof[
  由正则方程 $dot(q)=p/m$、$dot(p)=-m omega^2q$，有 $q=-dot(p)/(m omega^2)$。又 $L=p dot(q)-H$，故
  $
    K=L-p dot(q)-q dot(p)=-H-q dot(p)
    =dot(p)^2/(2m omega^2)-p^2/(2m).
  $
  令 $M=1/(m omega^2)$，则
  $
    K=1/2 M dot(p)^2-1/2 M omega^2p^2,
  $
  与 $L=m dot(q)^2/2-m omega^2q^2/2$ 同形。Euler-Lagrange 方程给出
  $
    dot.double(p)+omega^2p=0,
  $
  与坐标方程 $dot.double(q)+omega^2q=0$ 同形。
]

#exercise(subname: [6.17])[
  对习题 1.16 的等质量、等长双摆作小角度近似，给出哈密顿量及循环积分。讨论四维相空间中二维环面上的轨道是否遍历，并说明逐渐增大振幅时小角度近似如何失效。
  #hw-figure("pic/6.17.png", width: 37%)
]
#solution[
  对 $m_1=m_2=m,l_1=l_2=l$，小角度拉格朗日量为
  $
    L=1/2 m l^2(2dot(theta)_1^2+dot(theta)_2^2+2dot(theta)_1dot(theta)_2)
    -1/2 m g l(2theta_1^2+theta_2^2).
  $
  令 $p_i=pdv(L, dot(theta)_i)$，得到
  $
    H=1/(2m l^2)(p_1^2-2p_1p_2+2p_2^2)
    +1/2 m g l(2theta_1^2+theta_2^2).
  $
  对角化后
  $
    H=sum_(k=1)^2 (P_k^2/(2m l^2)+1/2 m l^2Omega_k^2Q_k^2),
    quad Omega_(1,2)^2=g/l(2 plus.minus sqrt(2)).
  $
  两个模态能量 $H_1,H_2$ 分别守恒。若 $Omega_1/Omega_2$ 为无理数，轨道在二维环面上稠密；若为有理数则闭合。振幅增大时非线性项使频率随振幅改变，并可能出现共振与混沌，简正模分离随之失效。
]

#exercise(subname: [7.1])[
  证明例 7.3 中的变换 $Q_i=p_i tan(omega t)$、$P_i=q_i cot(omega t)$ 为正则变换，写出新哈密顿量和生成函数。
]
#proof[
  直接计算基本泊松括号可得
  $
    {Q_i,P_j}=delta_(i j), quad {Q_i,Q_j}={P_i,P_j}=0,
  $
  故该变换为正则变换。由 $Q_i P_i=p_i q_i$ 以及正则一形式关系
  $
    sum_i P_i dd(Q_i)-H' dd(t)=sum_i p_i dd(q_i)-H dd(t)+dd(F),
  $
  得到
  $
    H'=-H+omega/(sin(omega t)cos(omega t))sum_i Q_i P_i.
  $
  可取第二类生成函数
  $
    F_2(q,Q,t)=-sum_i q_i Q_i cot(omega t)+C.
  $
]

#import "@preview/scripst:1.1.2": *
#show: scripst.with(title: [分析力学第9次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [5.16])[
  把地球视为扁椭球，太阳引力对赤道隆起产生力矩。设地球自转轴与黄道面夹角为 $phi$，求地球自转轴的进动角速度。
]
#solution[
  设 $I_1=I_2<I_3$，太阳质量为 $M_S$，日地距离为 $R$。与取向有关的势能为
  $
    V(theta)=G M_S/(2R^3)(I_3-I_1)(1-3cos^2 theta),
  $
  其中 $theta=pi/2-phi$。于是
  $
    abs(pdv(V, theta))=3G M_S/R^3(I_3-I_1)sin theta cos theta.
  $
  对快速自转的对称陀螺，$L=I_3 Omega$，且力矩大小为 $Omega_p L sin theta$，故
  $
    Omega_p=3G M_S/(2R^3 Omega)(I_3-I_1)/I_3 cos phi.
  $
  代入地球参数得到约 $Omega_p=2.5 times 10^(-12) "s"^(-1)$，对应约 $46''/"年"$。
]

#exercise(subname: [5.17])[
  刚体三个主转动惯量满足 $I_1<I_2<I_3$。证明自由转动时，绕主轴 1 或 3 的转动稳定，而绕主轴 2 的转动不稳定。
]
#proof[
  Euler 方程为
  $
    I_1 dot(omega)_1-(I_2-I_3)omega_2omega_3 & =0, \
    I_2 dot(omega)_2-(I_3-I_1)omega_3omega_1 & =0, \
    I_3 dot(omega)_3-(I_1-I_2)omega_1omega_2 & =0.
  $
  在绕第 $i$ 轴的匀速转动 $omega_i=Omega$ 附近线性化。绕轴 1 时
  $
    dot.double(delta omega_2)=-Omega^2 ((I_1-I_3)(I_1-I_2))/(I_2I_3) delta omega_2,
  $
  系数为负，扰动振荡；绕轴 3 同理也为振荡。绕轴 2 时
  $
    dot.double(delta omega_1)=Omega^2 ((I_2-I_3)(I_1-I_2))/(I_1I_3) delta omega_1,
  $
  右端系数为正，扰动指数增长。因此最大和最小主惯量轴稳定，中间轴不稳定。
]

#exercise(subname: [6.7])[
  对习题 1.14：质量为 $m$ 的小珠串在绕竖直轴以角速度 $omega$ 转动的抛物线硬丝 $y=a x^2$ 上。以小珠到 $y$ 轴的距离 $q$ 为坐标，给出哈密顿量及哈密顿方程。
]
#solution[
  $
    T=1/2 m((1+4a^2q^2)dot(q)^2+omega^2q^2),
    quad V=m g a q^2.
  $
  因而
  $
    L=1/2 m(1+4a^2q^2)dot(q)^2+1/2 m(omega^2-2g a)q^2,
  $
  $
    p=m(1+4a^2q^2)dot(q),
  $
  $
    H(q,p)=p^2/(2m(1+4a^2q^2))+1/2 m(2g a-omega^2)q^2.
  $
  正则方程为
  $
    dot(q) & =p/(m(1+4a^2q^2)), \
    dot(p) & =(4a^2q p^2)/(m(1+4a^2q^2)^2)-m(2g a-omega^2)q.
  $
]

#exercise(subname: [6.11])[
  对习题 1.20：两个质点质量为 $m_1,m_2$，以劲度系数 $k$、自然长度 $l$ 的弹簧相连并在光滑桌面上运动。给出哈密顿量、循环积分和哈密顿方程。
]
#solution[
  取质心坐标 $X$ 和相对伸长 $x=x_2-x_1-l$，并记 $M=m_1+m_2$、$mu=m_1m_2/M$，则
  $
    L=1/2 M dot(X)^2+1/2 mu dot(x)^2-1/2 k x^2.
  $
  共轭动量为 $P_X=M dot(X)$、$p_x=mu dot(x)$，哈密顿量
  $
    H=P_X^2/(2M)+p_x^2/(2mu)+1/2 k x^2.
  $
  $X$ 为循环坐标，故 $P_X="const"$；$H$ 不显含时间，故 $H="const"$。正则方程为
  $
    dot(X)=P_X/M, quad dot(P)_X=0,
    quad dot(x)=p_x/mu, quad dot(p)_x=-k x.
  $
]

#exercise(subname: [6.15])[
  质点在中心力场 $V(r)$ 中运动，球坐标下
  $
    L=m/2(dot(r)^2+r^2dot(theta)^2+r^2 sin^2theta dot(phi)^2)-V(r).
  $
  求共轭动量、哈密顿量、循环积分及正则方程。
]
#solution[
  $
    p_r=m dot(r), quad p_theta=m r^2dot(theta),
    quad p_phi=m r^2 sin^2theta dot(phi).
  $
  $
    H=p_r^2/(2m)+p_theta^2/(2m r^2)+p_phi^2/(2m r^2 sin^2theta)+V(r).
  $
  因 $phi$ 为循环坐标，$p_phi="const"$；又 $H="const"$。正则方程为
  $
          dot(r) & =p_r/m, \
        dot(p)_r & =p_theta^2/(m r^3)+p_phi^2/(m r^3sin^2theta)-V'(r), \
      dot(theta) & =p_theta/(m r^2), \
    dot(p)_theta & =p_phi^2 cos theta/(m r^2 sin^3theta), \
        dot(phi) & =p_phi/(m r^2 sin^2theta), \
      dot(p)_phi & =0.
  $
]

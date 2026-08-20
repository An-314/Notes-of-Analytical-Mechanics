#import "@preview/scripst:1.1.2": *
#show: scripst.with(title: [分析力学第6次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [3.18])[
  质量为 $m$ 的质点在半径 $R$ 的球形区域内势能为 $-|U_0|$，球外为零。粒子以初速度 $v_infinity$ 入射，求散射截面。
  #hw-figure("pic/3.18.png", width: 47%)
]
#solution[
  设碰撞参数 $rho$，令 $s=rho/R$ 以及
  $
    alpha=v_infinity/sqrt(v_infinity^2+2|U_0|/m).
  $
  边界上的折射关系给出散射角
  $
    phi=2(arcsin s-arcsin(alpha s)).
  $
  由
  $
    (dd sigma)/(dd Omega)=rho/sin phi abs(dd rho/dd phi)
  $
  及
  $
    dd phi/dd s=2(1/sqrt(1-s^2)-alpha/sqrt(1-alpha^2s^2)),
  $
  得
  $
    (dd sigma)/(dd Omega)=R^2 s/(2 sin phi)
    abs(1/sqrt(1-s^2)-alpha/sqrt(1-alpha^2s^2))^(-1),
  $
  其中 $s$ 与 $phi$ 由上式隐式联系。
]

#exercise(subname: [3.20])[
  求两个电子之间的卢瑟福散射截面。
]
#solution[
  Coulomb 势的经典微分截面为
  $
    sigma_"CM"(psi)=(k/(2 mu v_infinity^2))^2 csc^4(psi/2).
  $
  对两个等质量电子，$mu=m/2$，实验室系散射角满足 $psi=2theta$。还须计入两个不可分辨末态，因此
  $
    sigma_(e e)(theta)=sigma_"lab"(theta)+sigma_"lab"(pi-theta)
    =4(k/(m v_infinity^2))^2(csc^4 theta+sec^4 theta).
  $
]

#exercise(subname: [4.2])[
  质量为 $M$、半径为 $R$ 的圆环在重力作用下绕圆周上的固定点 $O$ 在其平面内作小振动，求振动频率。
  #hw-figure("pic/4.2.png", width: 34%)
]
#solution[
  圆环对 $O$ 的转动惯量为 $I_O=2M R^2$，拉格朗日量为
  $
    L=1/2 I_O dot(theta)^2+M g R cos theta.
  $
  运动方程
  $
    dot.double(theta)+g/(2R) sin theta=0.
  $
  小振动下 $sin theta approx theta$，所以
  $
    omega=sqrt(g/(2R)), quad nu=1/(2pi)sqrt(g/(2R)).
  $
]

#exercise(subname: [4.4])[
  原子间相互作用用 Lennard-Jones 势 $V(r)=A/r^12-B/r^6$ 近似，其中 $A,B>0$。求双原子分子的平衡距离与小振动频率（单原子质量为 $m$）。
]
#solution[
  约化质量 $mu=m/2$。平衡条件 $V'(r_0)=0$ 给出
  $
    r_0=(2A/B)^(1/6).
  $
  令 $r=r_0+x$，则
  $
    mu dot.double(x)+V''(r_0)x=0, quad V''(r_0)=36B/r_0^8.
  $
  因而
  $
    omega=sqrt(36B/(mu r_0^8))
    =6/2^(1/6) B^(7/6)/(A^(2/3)sqrt(m)).
  $
]

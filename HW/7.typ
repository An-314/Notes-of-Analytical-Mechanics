#import "@preview/scripst:1.1.2": *
#show: scripst.with(title: [分析力学第7次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [4.8])[
  单摆方程为 $dot.double(theta)+(g/l)sin theta=0$。若振幅不大，用摄动近似给出二阶精度的近似解，包括周期的二阶修正。
]
#solution[
  令 $omega_0^2=g/l$，并以振幅 $epsilon=theta_0$ 为小参数。由
  $
    sin theta=theta-theta^3/6+O(theta^5)
  $
  作 Poincare-Lindstedt 展开，消去各阶久期项，得到
  $
    omega=omega_0(1-epsilon^2/16+epsilon^4/3072+O(epsilon^6)).
  $
  保留到波形的二阶修正，可写为
  $
    theta(t)=epsilon cos(omega t)+epsilon^3/192(cos(omega t)-cos(3omega t))+O(epsilon^5).
  $
  因而周期
  $
    T=2pi/omega_0(1+epsilon^2/16+11epsilon^4/3072+O(epsilon^6)).
  $
]

#exercise(subname: [4.13])[
  二氧化碳分子的经典模型为三个共线原子，只考虑沿直线方向的振动，求三个原子的简正频率和简正模。两端氧原子质量为 $m$，中间碳原子质量为 $M$，相邻原子间弹性系数为 $k$。
  #hw-figure("pic/4.13.png", width: 48%)
]
#solution[
  取位移 $q=(q_1,q_2,q_3)^T$，则
  $
    bold(V)=k mat(1, -1, 0; -1, 2, -1; 0, -1, 1),
    quad bold(T)=mat(m, 0, 0; 0, M, 0; 0, 0, m).
  $
  由 $det(bold(V)-omega^2 bold(T))=0$ 得
  $
    omega_0=0, quad omega_1=sqrt(k/m),
    quad omega_2=sqrt(k(M+2m)/(m M)).
  $
  对应模态可取
  $
    A^(0)=(1,1,1)^T,
    quad A^(1)=(1,0,-1)^T,
    quad A^(2)=(1,-2m/M,1)^T.
  $
]

#exercise(subname: [4.15])[
  两个相同小球组成耦合摆，质量均为 $m$、摆长均为 $l$，两球间用劲度系数 $k$ 的弹簧相连。作小振动近似，求简正频率和一般运动。
  #hw-figure("pic/4.15.png", width: 38%)
]
#solution[
  小角度下
  $
    T=1/2 m l^2(dot(theta)_1^2+dot(theta)_2^2),
  $
  $
    V=1/2 m g l(theta_1^2+theta_2^2)+1/2 k l^2(theta_1-theta_2)^2.
  $
  特征方程给出
  $
    omega_1=sqrt(g/l), quad omega_2=sqrt(g/l+2k/m),
  $
  模态分别为 $(1,1)^T$ 与 $(1,-1)^T$。因此
  $
    mat(theta_1; theta_2)=C_1 mat(1; 1) cos(omega_1 t+phi_1)
    +C_2 mat(1; -1) cos(omega_2 t+phi_2).
  $
]

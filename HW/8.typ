#import "@preview/scripst:1.1.2": *
#show: scripst.with(title: [分析力学第8次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))
#set text(size: 10pt)

#exercise(subname: [5.3])[
  杆 $A B$ 长 $L$，绕 $O C$ 以角速度 $omega$ 转动，$D$ 为杆的中点且 $O D=a$；$O C$ 又绕竖直轴以角速度 $Omega$ 转动。初始时 $B$ 点在最低处，求角速度在实验室系和本体系中的表示，以及此时 $B$ 点的速率。
  #hw-figure("pic/5.3.png", width: 35%)
]
#solution[
  设 $O C$ 与竖直轴夹角为 $theta$、方位角为 $phi=Omega t$。实验室系中
  $
    bold(omega)=omega bold(e)_(z')+Omega bold(e)_z,
  $
  即
  $
    bold(omega)=(omega sin theta cos phi,omega sin theta sin phi,omega cos theta+Omega).
  $
  本体系中可取
  $
    bold(omega)=(Omega sin theta,0,omega+Omega cos theta).
  $
  $B$ 点最低时 $bold(r)_B=(-L/2,0,a)$，故
  $
    v_B=abs(bold(omega) times bold(r)_B)
    =a Omega sin theta+L/2(omega+Omega cos theta).
  $
]

#exercise(subname: [5.6])[
  匀质薄圆盘质量 $m$、半径 $R$。以圆心为原点、$x,y$ 轴在盘面内建立直角坐标系，求惯量张量；再求通过圆盘边缘且与 $z$ 轴成角 $theta$ 的轴的转动惯量。
  #hw-figure("pic/5.6.png", width: 34%)
]
#solution[
  对称性给出非对角元为零，且
  $
    I_x=I_y=1/4 m R^2, quad I_z=1/2 m R^2.
  $
  因而
  $
    bold(I)_"cm"=mat(m R^2/4, 0, 0; 0, m R^2/4, 0; 0, 0, m R^2/2).
  $
  用平行轴定理移到盘缘点，再投影到方向 $bold(n)=(0,-sin theta,cos theta)$，得到
  $
    I_n=m R^2(cos^2 theta/2+5sin^2 theta/4).
  $
]

#exercise(subname: [5.8])[
  两个质量均为 $m$ 的质点连接在长 $l$ 的刚性轻杆两端，绕过质心 $O$ 的轴 $O A$ 以角速度 $Omega$ 转动，轴与杆夹角为 $alpha$。求系统对质心的角动量、所受力矩与转动动能。
  #hw-figure("pic/5.8.png", width: 36%)
]
#solution[
  设杆方向单位矢量为 $bold(e)$、轴方向为 $bold(n)$，则
  $
    bold(I)=m l^2/2(bold(1)-bold(e)bold(e)^T).
  $
  所以
  $
    bold(J)=bold(I) bold(omega)=m l^2 Omega/2(bold(n)-cos alpha bold(e)),
    quad |bold(J)|=m l^2 Omega/2 sin alpha.
  $
  因 $dot(bold(e))=Omega bold(n) times bold(e)$，
  $
    bold(M)=dot(bold(J))=-m l^2 Omega^2/2 cos alpha (bold(n) times bold(e)),
  $
  且
  $
    T=1/2 bold(omega) dot bold(J)=m l^2 Omega^2/4 sin^2 alpha.
  $
]

#exercise(subname: [5.10])[
  5.8 题中的外力矩突然撤除。求系统对 $O$ 点的角动量，以及系统转动角速度各欧拉角的时间变化率。
  #hw-figure("pic/5.10.png", width: 34%)
]
#solution[
  撤去力矩后角动量守恒，且仍为
  $
    bold(J)=m l^2 Omega/2(bold(n)-cos alpha bold(e)),
    quad |bold(J)|=m l^2 Omega/2 sin alpha.
  $
  取杆方向为本体第三轴，则初始角速度分量
  $
    omega_1=Omega sin alpha, quad omega_2=0,
    quad omega_3=Omega cos alpha.
  $
  对对称刚体，Euler 方程给出横向分量以角速度 $Omega cos alpha$ 旋转：
  $
    omega_1(t) & =Omega sin alpha cos(Omega cos alpha t), \
    omega_2(t) & =Omega sin alpha sin(Omega cos alpha t), \
    omega_3(t) & =Omega cos alpha.
  $
  与 Euler 角关系比较，可取
  $
    theta=pi/2, quad dot(phi)=Omega sin alpha,
    quad dot(psi)=Omega cos alpha.
  $
]

#import "@preview/scripst:1.1.2": *

#show: scripst.with(title: [分析力学第3次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [2.2])[
  利用泛函变分极值方法证明：在给定球面上，两点之间的最短距离沿大圆的一段弧线。
]
#proof[
  球面参数化为 $bold(r)=R(sin theta cos phi,sin theta sin phi,cos theta)$，弧长泛函为
  $
    S=R integral sqrt(dot(theta)^2+sin^2 theta dot(phi)^2) dd(t).
  $
  由于 $phi$ 不显含于被积函数，
  $
    (sin^2 theta dot(phi))/sqrt(dot(theta)^2+sin^2 theta dot(phi)^2)="const".
  $
  积分后可写为
  $
    A cos theta+B sin theta sin(phi-phi_0)=0.
  $
  这正是一个过球心的平面方程与球面的交线，故极值曲线是大圆弧。由局部弧长的正定性，较短的一段大圆弧即为最短路径。
]

#exercise(subname: [2.4])[
  曲线 $y=f(x)$ 连接 $(0,y_0)$ 与 $(x_1,y_1)$。求使该曲线绕 $x$ 轴旋转所得表面积最小的函数形式。
  #hw-figure("pic/2.4.png", width: 45%)
]
#solution[
  表面积除去常数 $2pi$ 后的泛函为
  $
    S=integral_0^x_1 y sqrt(1+y'^2) dd(x).
  $
  因被积函数不显含 $x$，Beltrami 恒等式给出
  $
    y/sqrt(1+y'^2)=a.
  $
  故 $y'^2=y^2/a^2-1$，积分得
  $
    y(x)=a cosh((x-b)/a),
  $
  其中常数 $a,b$ 由两个端点条件决定。极小曲面是悬链面。
]

#exercise(subname: [2.8])[
  一软绳两端固定于 $A,B$，在重力作用下自然下垂，绳长 $L>A B$，求绳子的形状。
]
#solution[
  以线密度 $rho$ 表示，重力势能在定长约束下的泛函为
  $
    J[y]=integral (rho g y+lambda) sqrt(1+y'^2) dd(x).
  $
  因其不显含 $x$，
  $
    (rho g y+lambda)/sqrt(1+y'^2)=rho g a.
  $
  积分得到悬链线
  $
    y(x)=a cosh((x-b)/a)-lambda/(rho g),
  $
  其中 $a,b,lambda$ 由两端位置和绳长条件
  $
    integral_A^B sqrt(1+y'^2) dd(x)=L
  $
  确定。
]

#exercise(subname: [2.13])[
  假设可以在地球内部自由穿梭，只依靠重力从地面一点到另一点，求用时最短的路径。
  #hw-figure("pic/2.13.png", width: 34%)
]
#solution[
  设地球密度均匀，则球内引力势给出
  $
    v(r)=sqrt(g/R (R^2-r^2)).
  $
  在极坐标中，时间泛函为
  $
    T=sqrt(R/g) integral sqrt(r'^2+r^2)/sqrt(R^2-r^2) dd(theta).
  $
  由于被积函数不显含 $theta$，得到第一积分，并令
  $
    y(theta)=r(theta)/sqrt(R^2-r(theta)^2).
  $
  方程化为 $y''+y=0$，故
  $
    y(theta)=A cos(theta-theta_0),
    quad r(theta)=R y(theta)/sqrt(1+y(theta)^2).
  $
  常数由两端点确定；这给出地球内部的最速降线路径。
]

#exercise(subname: [2.15])[
  质量为 $m$ 的粒子在半径 $R$ 的球形区域内势能为 $-|U_0|$，球外为零。粒子以初速度 $v_infinity$ 入射，利用费马原理给出运动轨迹，并求偏转角。
]
#solution[
  两区域内速度分别为
  $
    v_"out"=v_infinity, quad v_"in"=sqrt(v_infinity^2+2|U_0|/m).
  $
  费马原理在边界给出类似折射定律
  $
    v_"out" sin theta_"out"=v_"in" sin theta_"in".
  $
  因各区域内无力，轨迹由两段直线组成。若碰撞参数为 $b$，则
  $
    sin theta_"out"=b/R,
    quad sin theta_"in"=(v_infinity/v_"in") b/R,
  $
  偏转角为
  $
    Delta=2(arcsin(v_infinity b/(v_"in" R))-arcsin(b/R)).
  $
]

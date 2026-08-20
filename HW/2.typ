#import "@preview/scripst:1.1.2": *

#show: scripst.with(title: [分析力学第2次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [1.9])[
  在无摩擦桌面上，一劲度系数为 $k$ 的弹簧一端固定，另一端连接质量为 $m$ 的物体；该物体又通过跨过滑轮的轻绳与另一等质量物体相连。设弹簧从自然长度伸长 $x$，初始时两物体静止且 $x(0)=0$。求运动方程与运动规律。
  #hw-figure("pic/1.9.png", width: 46%)
]
#solution[
  $
    T=m dot(x)^2, quad V=1/2 k x^2-m g x,
  $
  所以 $L=m dot(x)^2-k x^2/2+m g x$。拉格朗日方程给出
  $
    2m dot.double(x)+k x-m g=0.
  $
  结合 $x(0)=dot(x)(0)=0$，得到
  $
    x(t)=m g/k (1-cos(sqrt(k/(2m)) t)).
  $
]

#exercise(subname: [1.11])[
  利用拉格朗日方程求解 1.5 题。
  #hw-figure("pic/1.11.png", width: 40%)
]
#solution[
  仍以 $X,s$ 为广义坐标，
  $
    T=1/2 m (dot(X)^2+dot(s)^2+2 dot(X) dot(s) cos theta)+1/2 M dot(X)^2,
    quad V=-m g s sin theta.
  $
  两个拉格朗日方程为
  $
    (M+m)dot.double(X)+m cos theta dot.double(s) & =0, \
       m dot.double(s)+m cos theta dot.double(X) & =m g sin theta.
  $
  因而
  $
    dot.double(s)=((M+m)sin theta)/(M+m sin^2 theta) g.
  $
]

#exercise(subname: [1.13])[
  利用拉格朗日方程求解 1.7 题，求质点的运动微分方程，并给出循环积分。
  #hw-figure("pic/1.13.png", width: 34%)
]
#solution[
  由 $z=r cot alpha$，
  $
    T=m/2 (csc^2 alpha dot(r)^2+r^2 dot(theta)^2),
    quad V=m g r cot alpha.
  $
  因而
  $
    csc^2 alpha dot.double(r)-r dot(theta)^2+g cot alpha & =0, \
                                   dv(r^2 dot(theta), t) & =0.
  $
  $theta$ 为循环坐标，循环积分为
  $
    r^2 dot(theta)="const".
  $
]

#exercise(subname: [1.18])[
  一质点的拉格朗日量为 $L=exp((gamma t)/m)(T-V)$，其中 $T=m(dot(x)^2+dot(y)^2+dot(z)^2)/2$，$V=V(x,y,z)$。给出运动微分方程，并说明这是什么系统。
]
#solution[
  对 $x_i in {x,y,z}$，
  $
    dv(pdv(L, dot(x_i)), t)=e^((gamma t)/m)(gamma dot(x_i)+m dot.double(x_i)),
    quad pdv(L, x_i)=-e^((gamma t)/m) pdv(V, x_i).
  $
  因而
  $
    m dot.double(x_i)=-pdv(V, x_i)-gamma dot(x_i),
  $
  即 $m bold(a)=-grad V-gamma bold(v)$，这是在保守力场中同时受到线性黏滞阻力的系统。
]

#exercise(subname: [1.19])[
  两质点质量分别为 $m_1,m_2$，位置为 $bold(r)_1,bold(r)_2$，相互作用势能为 $V(bold(r)_1-bold(r)_2)$。（1）以质心坐标和相对坐标为广义坐标，给出拉格朗日量并找出循环坐标；（2）导出运动微分方程。
]
#solution[
  定义
  $
    bold(R)=(m_1 bold(r)_1+m_2 bold(r)_2)/M,
    quad bold(r)=bold(r)_1-bold(r)_2,
  $
  其中 $M=m_1+m_2, mu=m_1m_2/M$。则
  $
    L=1/2 M dot(bold(R))^2+1/2 mu dot(bold(r))^2-V(bold(r)).
  $
  $bold(R)$ 为循环坐标，故 $M dot(bold(R))="const"$。相对运动满足
  $
    mu dot.double(bold(r))=-grad_r V(bold(r)).
  $
]

#exercise(subname: [1.21])[
  质点在中心力场 $V(sqrt(rho^2+z^2))$ 中运动。在绕 $z$ 轴以角速度 $omega$ 转动的坐标系中给出拉格朗日量、运动方程，并指出科里奥利力和离心力。
]
#solution[
  取 $phi=phi'-omega t$，则
  $
    L=1/2 m (dot(rho)^2+rho^2(dot(phi)'+omega)^2+dot(z)^2)-V(sqrt(rho^2+z^2)).
  $
  运动方程为
  $
    m dot.double(rho)-m rho(dot(phi)'+omega)^2+pdv(V, rho) & =0, \
                           dv(m rho^2(dot(phi)'+omega), t) & =0, \
                                 m dot.double(z)+pdv(V, z) & =0.
  $
  展开径向和方位方程可写成
  $
    m bold(a)'=-grad V-2m bold(omega) times bold(v)'
    -m bold(omega) times (bold(omega) times bold(r)),
  $
  后两项分别是科里奥利力和离心力。
]

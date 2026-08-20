#import "@preview/scripst:1.1.2": *
#show: scripst.with(title: [分析力学第5次作业], author: "Anzreww", time: "2025年", matheq-depth: 1, cb-counter-depth: 1)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [3.4])[
  已知质点轨迹在平面极坐标中为阿基米德螺线 $r=r_0 theta$，求作用在质点上的有心力。
]
#solution[
  令 $u=1/r=1/(r_0 theta)$，Binet 公式为
  $
    F(r)=-l^2/m u^2 (dv(u, theta, 2)+u).
  $
  因 $dv(u, theta, 2)=2r_0^2u^3$，故
  $
    F(r)=-l^2/m (1/r^2+2r_0^2/r^4).
  $
]

#exercise(subname: [3.5])[
  已知作用在质点上的有心力是引力，且与距离三次方成反比，求质点运动轨迹。
]
#solution[
  设 $F(r)=-k/r^3$，则 Binet 方程给出
  $
    dv(u, theta, 2)+(1-alpha)u=0, quad alpha=m k/l^2.
  $
  因而
  $
    r(theta)=cases(
      1/(A cos(sqrt(1-alpha)(theta-theta_0))), & alpha<1,
      1/(A(theta-theta_0)+B), & alpha=1,
      C exp(plus.minus sqrt(alpha-1)(theta-theta_0)), & alpha>1.
    )
  $
]

#exercise(subname: [3.8])[
  质点受有心力 $F(r)=-k m/r^4$。若质点在距力心 $2a$ 处垂直于极轴以速率 $sqrt(k/(12a^3))$ 抛出，求轨道。
]
#solution[
  初始条件给出 $u(0)=1/(2a)$、$u'(0)=0$，角动量 $l=m(2a)sqrt(k/(12a^3))$。Binet 方程化为
  $
    u''+u=3a u^2.
  $
  乘以 $u'$ 并用初值积分，得
  $
    (u')^2=u^2(2a u-1).
  $
  令 $w=sqrt(2a u-1)$，则 $2 arctan w=theta$，从而
  $
    u=(1+tan^2(theta/2))/(2a)=sec^2(theta/2)/(2a),
    quad r=2a cos^2(theta/2)=a(1+cos theta).
  $
]

#exercise(subname: [3.12])[
  轻绳一端系着质量为 $m$ 的质点，另一端绕在半径为 $a$ 的棒上。开始拉紧的绳长为 $s_0$，质点以初速 $v_0$ 绕棒运动并最终撞到棒上，求所需时间。
  #hw-figure("pic/3.12.png", width: 38%)
]
#solution[
  令绳的自由段长 $s=s_0-a theta$。质点位置可写成渐开线形式，速度满足 $v=s dot(theta)$，故
  $
    L=1/2 m s^2 dot(theta)^2.
  $
  $theta$ 为循环坐标，$s^2 dot(theta)=s_0 v_0$。又 $dot(s)=-a dot(theta)$，于是
  $
    s dot(s)=-a s_0 v_0.
  $
  从 $s_0$ 积分到 $0$ 得
  $
    T=s_0/(2a v_0).
  $
]

#exercise(subname: [3.14])[
  讨论粒子在屏蔽势场 $V(r)=-k e^(-r/a)/r$ 中圆轨道运动的稳定性，其中 $k>0,a>0$。
]
#solution[
  有效势
  $
    V_"eff"(r)=l^2/(2m r^2)-k e^(-r/a)/r.
  $
  令 $r_0/a=x$。圆轨道条件 $V_"eff"'(r_0)=0$ 给出
  $
    l^2/m=k e^(-x) r_0(1+x).
  $
  稳定还要求 $V_"eff"''(r_0)>0$。代入上式后等价于
  $
    1+x-x^2>0.
  $
  因 $x>0$，稳定范围为
  $
    0<r_0/a<(1+sqrt(5))/2.
  $
]

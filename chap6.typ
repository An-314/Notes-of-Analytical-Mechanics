#import "@preview/scripst:1.1.1": *

= 刚体绕定点的转动

== 刚体及其运动

=== 角速度

#definition(subname: [刚体])[
  刚体是指在外力作用下，其*任意两质点间距离始终保持不变的物体或质点组*。
]
由于刚体上任意两点间的距离不随时间变化，刚体上任意两点的速度矢量在其连线上的投影相等。亦即：*刚体上任意两点间的相对运动只可能垂直于连线*。数学证明更简洁。

对刚体上任意两点$i$和$j$其位置矢量分别为$vb(r)_i, vb(r)_j$，则$abs(vb(r)_j - vb(r)_i) = "const"$，从而$vb(r)_(i j)^2 = "const"$，对时间求导得：
$
  2 vb(r)_(i j) dot dot(vb(r))_(i j) = 0
$
则有$vb(r)_(i j) perp dot(vb(r))_(i j)$。

若刚体只作平动，则各点运动的速度相同，必有$dot(vb(r))_(i j) = 0$。若$dot(vb(r))_(i j) != 0$，意味着刚体必还伴随着转动。此时既然$vb(v)_(i j) = dot(vb(r))_(i j) perp vb(r)_(i j)$就可引入一个矢量$vb(omega)_(i j)$使得
$
  dot(vb(r))_(i j) = vb(omega)_(i j) times vb(r)_(i j)
$
这个矢量必定和转动有关，且具有$[T]^(-1)$的量纲。实际上引入的矢量$vb(omega)_(i j)$就是角速度，其方向由 右手螺旋定则确定。角速度矢量是一个轴矢量(与极矢量镜像对称性不同)，与*无限小转动角度*对应。有限角度的转动不能构成矢量，因为它无法满足加法的交换律。

*角速度矢量对刚体的任何点都是同一个值。*证明：考虑刚体上另一点$k$，则
$
  vb(v)_(i j) = vb(omega)_(i j) times vb(r)_(i j)\
  vb(v)_(i k) = vb(omega)_(i k) times vb(r)_(i k)\
  vb(v)_(j k) = vb(omega)_(j k) times vb(r)_(j k)
$
合在一起，容易得到
$
  vb(omega)_(j k) times (vb(r)_(i k) - vb(r)_(i j)) = vb(omega)_(i k) times vb(r)_(i k) - vb(omega)_(i j) times vb(r)_(i j)
$
两边点积$vb(r)_(i j)$，整理得
$
  (vb(omega)_(j k) - vb(omega)_(i k)) dot (vb(r)_(i k) times vb(r)_(i j)) = 0
$
从而
$
  vb(omega)_(j k) = vb(omega)_(i k) = vb(omega)_(i j)
$
由于$i,j,k$点任意，故刚体上任何一点角速度都是一样的。事实上，由于刚体不变形，转动都是整体的，因此*角速度是属于整个刚体的物理量*，简单地记为$vb(omega)$即可。

=== 运动描述

刚体的运动通常可分为平动、定轴转动、平面平行运动、定点转动和一般运动。

最一般地，刚体的任意运动是平动和转动的叠加，这就是Chasles定理。刚体的平动可以选一个代表点(刚体上任意点)描述，其他点相对这个代表点的运动其实是转动。这个代表点的不同选择从运动学的角度来看是完全等价的(虽然代表点的不同选择可能导致颇为不相同的平动)，然而从动力学的角度来看，选质点组的质心为代表点将使动力学方程得到简化,因而往往优先选用。就转动部分而言，绕定点的转动是最一般的情况，定轴转动显然是其特殊情况。

在定轴转动情形，经常用类比的方法处理，即它与一维平动运动规律相对应，但这种类比不能任意推广到定点转动。典型的例子是，自由平动物体的速度不变，但自由定点转动刚体的角速度有可能随时间变化；平动物体的动量与速度同向，但一般刚体运动的角速度与角动量经常是不同向的。原因是转动与平动有本质的差异，平动惯性相关的是*质量标量*，而与转动惯性相关的是转动*惯量张量*。

=== 速度和加速度

刚体上任意点的速度和加速度，可以通过平动和转动的叠加得到。

作平动的刚体，任一点的线速度是相同的，任一点的线加速度也是相同的。因此可以用代表点的速度和加速度来描述整个刚体的速度和加速度。

对于转动的刚体，刚体上任意两点间相对速度$vb(v)_(i j) = vb(omega) times vb(r)_(i j)$。若$O$是固定点，刚体上任意点相对该固定点的位置为$vb(r)_i$，则其线速度为
$
  vb(v)_i = vb(omega) times vb(r)_i
$
它与作定轴转动的刚体上任一点的线速度的表达式是一致的，两者的差别仅在于：作定轴转动的刚体的转动轴既固定于空间，又固定于刚体，定点转动刚体的转动轴可以随时间而变动，一般只有瞬时转动轴，没有固定的转动轴。

瞬时转动轴上所有点的速度在某个时刻都是零，因此该时刻角速度方向沿着瞬时轴。

常模矢量$vb(A)$有类似关系(固定于刚体即以$vb(omega)$转动而且长度不变的矢量，其始点不限于在固定点，也不限于量纲为长度)
$
  dv(vb(A), t) = vb(omega) times vb(A)
$
或算符关系
$
  dv(, t) = vb(omega) times
$
#newpara()

如果参考点$O$不是固定点(可以是刚体中的任意点)，$vb(r)_0$不是常矢量，$dot(vb(r))_0 = vb(v)_0$，则其他点速度为
$
  vb(v) = vb(v)_0 + vb(omega) times vb(r)_i
$
其中
$
  vb(r) = vb(r)_0 + vb(r)_i
$
$O$点加速度设为$vb(a)_0 = dot(vb(v))_0$，则其他点加速度为
$
  vb(a)_i = vb(a)_0 + dot(vb(omega)) times vb(r)_i + vb(omega) times (vb(omega) times vb(r)_i) = vb(a)_0 + dot(vb(omega)) times vb(r)_i + vb(omega) times (vb(omega) times vb(r)_i)
$

== Euler定理与转动

刚体的平动部分由其选定的代表点的运动来描述，为了集中于刚体转动的研究，这里简单假设代表点为固定点。

实验室系$K'$，本体参考系$K$，此时刚体绕固定点转动，也就是本体坐标绕原点作定点转动。

对于实验室系的矢量$vb(r)'$以及本体系的矢量$vb(r)$，有关系：
$
  vb(r) = x vu(i) + y vu(j) + z vu(k)\
  vb(r)' = x' vu(i)' + y' vu(j)' + z' vu(k)'
$
用矩阵表示为：
$
  vb(r) = mat(
    vu(i)' dot vu(i), vu(j)' dot vu(i), vu(k)' dot vu(i);
    vu(i)' dot vu(j), vu(j)' dot vu(j), vu(k)' dot vu(j);
    vu(i)' dot vu(k), vu(j)' dot vu(k), vu(k)' dot vu(k)
  ) vb(r)'\
  vb(r) = U vb(r)'
$
这个变换矩阵$U$是实正交的矩阵，且$U^TT U = I$
$
  vb(r)' = U^TT vb(r)
$
由于本体参考系相对实验室系转动，因此$U$矩阵作用于矢量$vb(A)$，相当于是对该矢量的转动操作，矢量本身并没有变化，只是矢量的分量发生改变(矢量还是原来的矢量，坐标系转动了，相对于坐标系矢量转动了)。利用$U$矩阵的正交性容易得到:
$
  abs(vb(A)')^2 = vb(A)'^TT vb(A)' = vb(A)^TT U U^TT vb(A) = vb(A)^TT vb(A) = abs(vb(A))^2
$
即矢量的模不变。

对于其行列式，由于$U$是正交的，有$det(U) = plus.minus 1$。对于刚体，任何定点转动，总是由很小的转动连续累加而成，而无穷小转动的极限是不转，即对应单位矩阵，所以无穷小转动对应的变换矩阵很接近单位矩阵，其行列式不可能突然跃变为$-1$，即对应刚体的真实转动，都是一系列行列式值为$1$的变换矩阵累积的结果，所以
$
  det(U) = 1
$
这就说明，刚体的定点转动总是$"SO"(3)$群的元素。事实上$det(U) = -1$实际对应空间反演转动。

#theorem(subname: [Euler定理])[
  刚体的任何定点转动等价于绕某一给定轴的转动。
]

#proof[

]

=== Euler角

据Euler定理，可以用 2 个方位角确定某一轴的方向，然后另外 1 个角表  示绕该轴的转动角度，这样 3 个角度完全确定刚体的方位，亦即 3 个角度完全描述刚体的定点转动。

刚体的定点转动有 3 个自由度，刚好可以由 3 个角度代表的广义坐标所描述。比较典型的方法是利用 3 个 Euler 角。

#figure(
  image("pic/Eulerangles.svg", width: 30%),
  caption: [$alpha, beta, gamma$ 分别是进动角、章动角、自转角],
)

我们通过三次旋转来描述刚体的定点转动，从$K'$系转动到$K$系，从而可以将这三次旋转合成一个变换矩阵$U$。

- *绕$K'$的$z$轴旋转的进动角$phi in [0, 2pi)$*，$K' -> K_1$，是$x'$轴与交点线的夹角，该次转动使得$x$轴与交点线重合，$K$和$K_1$变换矩阵为：
  $
    U_1 = mat(
      cos phi, sin phi, 0;
      -sin phi, cos phi, 0;
      0, 0, 1
    )
  $
- *绕$K_1$的$x$轴旋转的章动角$theta in [0, pi]$*，$K_1 -> K_2$，是$z'$轴与$z$轴的夹角，该次转动使得二者的$z$轴重合，变换矩阵为：
  $
    U_2 = mat(
      1, 0, 0;
      0, cos theta, sin theta;
      0, -sin theta, cos theta
    )
  $
- *绕$K_2$的$z$轴旋转的自转角$psi in [0, 2pi)$*，$K_2 -> K$，是交点线与$x$轴的夹角，该次转动使得二者的$x$轴重合，变换矩阵为：
  $
    U_3 = mat(
      cos psi, sin psi, 0;
      -sin psi, cos psi, 0;
      0, 0, 1
    )
  $
则总的变换矩阵为：
$
  U & = U_3 U_2 U_1 \
    & = mat(
        cos psi cos phi - cos theta sin phi sin psi, cos psi sin phi + cos theta cos phi sin psi, sin psi sin theta;
        -sin psi cos phi - cos theta sin phi cos psi, -sin psi sin phi + cos theta cos phi cos psi, cos psi sin theta;
        sin theta sin phi, -sin theta cos phi, cos theta
      )
$
其逆变换
$
  U^TT & = U_1^TT U_2^TT U_3^TT
$

== Euler运动学方程

刚体的任何转动都可以通过 3 个Euler角的转动实现。对于刚体绕瞬时轴无限小角度转动，可以通过 3 个无限小Euler角的转动达到，这样刚体的角速度实际上可以用 3 个Euler角的变化率描述。

无限小Euler角的转动方向，类似于角速度方向的定义方式，按右手螺旋定则，则根据Euler角的几何意义，角速度可以表示为
$
  vb(omega) = dot(phi) vu(k)' + dot(theta) vu(i)_1 + dot(psi) vu(k) = dot(phi) vu(k)_1 + dot(theta) vu(i)_1 + dot(psi) vu(k)_2
$
分量也可以用矩阵表示为
$
  vb(omega)_K = vb(omega)'_K' = mat(dot(theta); 0; dot(phi))_K_1 + mat(0; 0; dot(psi))_K_2
$
在实验室系中
$
  vb(omega') = U^TT_1 mat(dot(theta); 0; dot(phi)) + U^TT_1 U^TT_2 mat(0; 0; dot(psi)) = mat(
    dot(theta) cos phi + dot(psi) sin theta sin phi;
    dot(theta) sin phi - dot(psi) sin theta cos phi;
    dot(phi) + dot(psi) cos theta
  )
$
在本体参考系中
$
  vb(omega) = U_3 U_2 mat(dot(theta); 0; dot(phi)) + U_3 mat(0; 0; dot(psi)) = mat(
    dot(theta) cos psi + dot(phi) sin theta sin psi;
    -dot(theta) sin psi + dot(phi) sin theta cos psi;
    dot(phi) cos theta + dot(psi)
  )
$
这就是刚体绕定点转动的Euler运动学方程，其中
$
  vb(omega) = U vb(omega')
$

#theorem(subname: [Euler运动学方程])[
  刚体绕定点转动的角速度与Euler角的变化率之间的关系为：
  $
    vb(omega') = mat(
      dot(theta) cos phi + dot(psi) sin theta sin phi;
      dot(theta) sin phi - dot(psi) sin theta cos phi;
      dot(phi) + dot(psi) cos theta
    )
  $
  $
    vb(omega) = mat(
      dot(theta) cos psi + dot(phi) sin theta sin psi;
      -dot(theta) sin psi + dot(phi) sin theta cos psi;
      dot(phi) cos theta + dot(psi)
    )
  $
]

== 刚体的转动惯量张量

=== 本体坐标系原点选在刚体质心时的转动惯量张量

设实验室参考系$K'$为惯性参考系，实验室系刚体质心位矢为$vb(R)$，本体坐标系$K$的原点选在质心，刚体角速度为$vb(omega)$，刚体上任意点$i$的坐标为
$
  vb(r)'_i = vb(R) + vb(r)_i
$
速度为
$
  dot(vb(r))'_i = dot(vb(R)) + dot(vb(r))_i = dot(vb(R)) + vb(omega) times vb(r)_i
$
则刚体的动能为
$
  T & = 1/2 sum_i Delta m_i dot(vb(r))'_i^2 \
    & = 1/2 sum_i Delta m_i (dot(vb(R))^2 + 2 dot(vb(R)) dot (vb(omega) times vb(r)_i) + (vb(omega) times vb(r)_i)^2) \
    & = 1/2 M dot(vb(R))^2 + 1/2 sum_i Delta m_i (vb(omega) times vb(r)_i)^2
$
这也就是*König定理*，前一项为平动动能，后一项为刚体转动动能。进一步简化转动动能项
$
  T_"rot" = 1/2 sum_i Delta m_i ((vb(omega) times vb(r)_i) times vb(omega)) dot vb(r)_i \
$
这一步用到了
$
  (vb(A) times vb(B)) dot vb(C) = (vb(C) times vb(A)) dot vb(B)
$
进一步利用
$
  (vb(A) times vb(B)) times vb(A) = vb(A)(vb(A) dot vb(B)) - vb(B)(vb(A) dot vb(A))
$
有
$
  T_"rot" & = 1/2 sum_i Delta m_i (vb(omega)^2 vb(r)_i^2 - (vb(omega) dot vb(r)_i)^2) \
          & = 1/2 sum_i Delta m_i (vb(omega)^TT (vb(r)_i^2 I - vb(r)_i vb(r)_i^TT) vb(omega)) \
          & = 1/2 vb(omega)^TT (sum_i Delta m_i (vb(r)_i^2 I - vb(r)_i vb(r)_i^TT)) vb(omega) \
          & = 1/2 vb(omega)^TT cal(I) vb(omega)
$
再来计算刚体的角动量
$
  vb(J)' & = sum_i vb(r)'_i times vb(p)'_i \
         & = sum_i (vb(R) + vb(r)_i) times (Delta m_i (dot(vb(R)) + vb(omega) times vb(r)_i)) \
         & = M vb(R) times dot(vb(R)) + sum_i Delta m_i vb(r)_i times (vb(omega) times vb(r)_i) \
         & = M vb(R) times dot(vb(R)) + vb(J)
$
第一项为质心角动量，第二项为相对质心的角动量$vb(J)$，可以进一步改写成
$
  vb(J) & = sum_i Delta m_i (vb(r)_i times (vb(omega) times vb(r)_i)) \
        & = sum_i Delta m_i ((vb(r)_i^TT vb(r)_i) I - vb(r)_i vb(r)_i^TT) vb(omega) \
        & = cal(I) vb(omega)
$
从而可以看出，转动惯量张量$cal(I)$
$
  I_(alpha beta) = sum_i Delta m_i (vb(r)_i^2 delta_(alpha beta) - r_(i alpha) r_(i beta)) = I_(beta alpha)
$
于是动能和角动量可以统一表示为
$
  T_"rot" = 1/2 vb(omega)^TT cal(I) vb(omega)\
  vb(J) = cal(I) vb(omega)
$
可以把惯量张量写成一个方阵
$
  cal(I) = mat(
    I_(x x), I_(x y), I_(x z);
    I_(y x), I_(y y), I_(y z);
    I_(z x), I_(z y), I_(z z)
  ) = mat(
    sum_i Delta m_i (y_i^2 + z_i^2), -sum_i Delta m_i x_i y_i, -sum_i Delta m_i x_i z_i;
    -sum_i Delta m_i y_i x_i, sum_i Delta m_i (x_i^2 + z_i^2), -sum_i Delta m_i y_i z_i;
    -sum_i Delta m_i z_i x_i, -sum_i Delta m_i z_i y_i, sum_i Delta m_i (x_i^2 + y_i^2)
  )
$
转动惯量张量对角元是对应转轴的转动惯量，而非对角元称为惯量积。这是一个二阶张量，所以又称二阶惯量张量(second rank moment of inertia tensor)。

#definition(subname: [转动惯量张量])[
  刚体绕定点转动时，其转动惯量张量定义为
  $
    I_(alpha beta) = sum_i Delta m_i (vb(r)_i^2 delta_(alpha beta) - r_(i alpha) r_(i beta))
  $
  则刚体的转动动能和角动量可以表示为
  $
    T_"rot" = 1/2 vb(omega)^TT cal(I) vb(omega)\
    vb(J) = cal(I) vb(omega)
  $
]

#newpara()

=== 本体坐标系原点没有选在刚体质心时的转动惯量张量

考虑一质量$M$的刚体绕某个定点转动，选该定点作为本体坐标系$K$的原点，此时若质心在$vb(a)$处，相对于质心的位矢若用$vb(r)'_i$表示，则$vb(r)'_i + vb(a) = vb(r)_i$则相对于原点的角动量可以写成
$
  vb(J) & = sum_i Delta m_i vb(r)_i times (vb(omega) times vb(r)_i) \
        & = M vb(a) times (vb(omega) times vb(a)) + sum_i Delta m_i vb(r)'_i times (vb(omega) times vb(r)'_i) \
$
写成分量
$
  J_alpha & = M (omega_alpha a^2 - a_alpha sum_beta omega_beta a_beta) + sum_beta I_(alpha beta "cm") omega_beta \
$
其中$I_(alpha beta "cm")$是质心系下的转动惯量张量，可以得到刚体相对远点的转动惯量张量为
$
  I_(alpha beta) = M (a^2 delta_(alpha beta) - a_alpha a_beta) + I_(alpha beta "cm")\
  cal(I) = M (a^2 I - vb(a) vb(a)^TT) + cal(I)_"cm"
$
利用动能也可以得到同样的表达式，而刚体定点(非质心)转动的动能则仍用
$
  T_"rot" = 1/2 vb(omega)^TT cal(I) vb(omega) = 1/2 vb(omega)^TT cal(I)_"cm" vb(omega) + 1/2 M vb(dot(a))^2
$
表示。

对于定轴转动，假设定轴是$z$轴，则定轴的转动惯量应为$I_33$，则$a^2 - a_3^2$是定轴到平行于定轴且穿过质心的轴的距离平方，因此定轴转动的转动惯量为
$
  I_33 = M d^2 + I_(33 "cm")
$
这就是*平行轴定理*。

=== 转动惯量和转动惯量张量

假设刚体上一点到瞬时轴的距离为$R_i$，利用矢量积的定义计算刚体转动的动能为
$
  T = 1/2 sum_i Delta m_i (vb(omega) times vb(r)_i)^2 = 1/2 sum_i Delta m_i r_i^2 sin^2 theta_i omega^2 = 1/2 omega^2 sum_i Delta m_i R_i^2
$
引入绕瞬时轴的转动惯量
$
  I = sum_i Delta m_i R_i^2
$
于是
$
  T = 1/2 I omega^2
$
这个公式和绕固定轴转动情况下的公式相仿，不同点在于，一般情况下，瞬时轴是随时间变动的，因此$I$一般为变量。

通过引入角速度方向的单位矢量$vu(e)$，则
$
  vb(omega) = omega vu(e)
$
从而
$
  T = 1/2 vb(omega)^TT cal(I) vb(omega) = 1/2 omega^2 I
$
从而有
$
  I = vu(e)^T cal(I) vu(e)
$
特别地，若取$vu(e) = vu(i)$则有
$
  I_11 = vu(i)^T cal(I) vu(i)
$
类似可得
$
  I_22 = vu(j)^T cal(I) vu(j)\
  I_33 = vu(k)^T cal(I) vu(k)
$
即$I_11, I_22, I_33$为转动惯量张量的三个主对角元，分别为绕$x, y, z$轴的转动惯量。

== 惯量主轴和惯量椭球

=== 惯量主轴

转动惯量张量$cal(I)$的矩阵是个实对称矩阵，可以选择适当的本体坐标系使其对角化，即使其惯量积为零。因动能是标量，不随转动变化，而矢量变换
$
  vb(A)' = cal(U)^TT vb(A), vb(A) = cal(U) vb(A)'
$
所以
$
  T_"rot" & = 1/2 vb(omega)^TT cal(I) vb(omega) \
          & = 1/2 vb(omega)'^TT cal(U) cal(I) cal(U)^TT vb(omega)' \
          & = 1/2 vb(omega)'^TT cal(I)' vb(omega)'
$
容易看出
$
  cal(I)' = cal(U) cal(I) cal(U)^TT
$
选择合适的$cal(U)$可以使转动惯量张量对角化
$
  cal(I)' = mat(
    I_1, 0, 0;
    0, I_2, 0;
    0, 0, I_3
  )
$
其中$I_1, I_2, I_3$为称为主转动惯量(principal moments)，此时本体坐标轴称为惯量主轴(principal axes)。*主转动惯量是转动惯量张量的三个本征值，对应的本征矢量为惯量主轴*。

容易看出角动量和动能的公式可以简化为
$
  J_alpha = I_alpha omega_alpha\
  T_"rot" = 1/2 sum_alpha I_alpha omega_alpha^2
$
#newpara()

因$cal(I)$是实对称矩阵，又$vb(omega)$可以任意，动能大于零，要求本征值$I_1, I_2, I_3$均大于零，即正定。因此使转动惯量张量对角化的转动矩阵$cal(U)$满足下式
$
  cal(I)' = cal(U) cal(I) cal(U)^TT => (cal(I) - cal(I)' ) cal(U)^TT = 0 => sum_beta (I_(alpha beta) - I_alpha delta_(alpha beta)) U_(k beta) = 0
$
$cal(U)$矩阵某一行$mat(U_(k 1), U_(k 2), U_(k 3))$为某一主轴方向的分量，为对应本征值$I_k$的本征矢量。

因为$cal(U)$是实正交矩阵，所以不同主轴方向的本征矢量正交归一化。这个结果是自然的，因为本体坐标轴之间本来就相互垂直。

以惯量主轴为坐标轴的本体参考系称为*惯量主轴本体参考系*。

*物理上寻找刚体的主轴和数学上把转动惯量张量的矩阵对角化是一回事*。转动惯量张量的主轴体现了刚体质量分布的某种对称性。如果刚体的密度是常数，很容易从刚体的几何对称性直接找到主轴。如果刚体的形状没有对称性，且刚体的质量密度分布不规则，则刚体的主轴不容易直观地直接找到。但是实对称矩阵的对角化总是可能的，因此主轴一定是存在的，只是要通过计算找到。

=== 角动量的方向

在质点动力学中，动量和速度的方向是相同的。刚体转动时，角动量和角速度的方向是否也相同呢？刚体转动的情形
$
  vb(J) = cal(I) vb(omega)
$
角动量和角速度一般不在同一个方向，这与动量与速度的关系不同。

这正是由于转动惯量张量的性质导致的。只有当刚体的角速度沿刚体的某一主轴时，角动量才和角速度的方向一致。例如：角速度沿$z$轴，且是惯量主轴，即
$
  vb(omega) = mat(0; 0; omega_z)
$
在惯量主轴本体坐标系，角动量
$
  vb(J) = I_33 omega_z vu(k) = I_33 vb(omega)
$
#newpara()

=== 惯量椭球

有
$
  (I_1 omega_1^2 + I_2 omega_2^2 + I_3 omega_3^2) / (I omega^2) = 1
$
引入一个新矢量
$
  vb(rho) = vu(e)/sqrt(I)
$
由于
$
  vb(e) = vb(omega)/omega
$
容易得到
$
  rho_1 = vu(e)/sqrt(I) dot vu(i) = omega_1 / (sqrt(I) omega)\
  rho_2 = vu(e)/sqrt(I) dot vu(j) = omega_2 / (sqrt(I) omega)\
  rho_3 = vu(e)/sqrt(I) dot vu(k) = omega_3 / (sqrt(I) omega)
$
就有
$
  I_1 rho_1^2 + I_2 rho_2^2 + I_3 rho_3^2 = 1
$
这是一个椭球面方程，其长短轴长是主转动惯量开方倒数$1/sqrt(I_k)$，称为*惯量椭球*，是$vb(rho)$空间的椭球面。

== Euler动力学方程

由于刚体的特殊性，若不考虑其平动，只考虑其绕定点的转动，则它只有3个自由度。*运用角动量定理的3个分量方程，就可以描述刚体的整体运动。*由于内力矩在角动量定理中相互抵消，而刚体又不能形变，不必考虑内力所做的功和内力的势能，因此动力学方程中只需考虑外力矩的作用即可。

为了使方程形式简单，选用惯量主轴本体坐标系，坐标系原点选在质心或固定点，以保证转动惯量张量为常量，且角动量定理有简单的形式。假设外力矩为$vb(M)$，选本体坐标轴为惯量主轴(即惯量积为零)，角动量定理具体表示为
$
  vb(M) &= dv(, t) (I_1 omega_1 vu(i) + I_2 omega_2 vu(j) + I_3 omega_3 vu(k))\
  &= I_1 dot(omega)_1 vu(i) + I_2 dot(omega)_2 vu(j) + I_3 dot(omega)_3 vu(k) + I_1 omega_1 (vb(omega) times vu(i)) + I_2 omega_2 (vb(omega) times vu(j)) + I_3 omega_3 (vb(omega) times vu(k))\
  & = cal(I) dot(vb(omega)) + vb(omega) times vb(J)\
$
整理成分量形式
$
  I_1 dot(omega)_1 - (I_2 - I_3) omega_2 omega_3 = M_1\
  I_2 dot(omega)_2 - (I_3 - I_1) omega_3 omega_1 = M_2\
  I_3 dot(omega)_3 - (I_1 - I_2) omega_1 omega_2 = M_3
$
这就是刚体的Euler动力学方程。

利用Lagrange方程同样可以推得Euler动力学方程组。当本体坐标轴选在惯量主轴上时，对于自由刚体定点转动，动能就是拉格朗日量：
$
  L = T = 1/2 (I_1 omega_1^2 + I_2 omega_2^2 + I_3 omega_3^2)
$
选择3个Euler角作为广义坐标，此时角速度3个分量由
$
  vb(omega) = mat(
    dot(theta) cos psi + dot(psi) sin theta cos phi;
    -dot(theta) sin psi + dot(psi) sin theta sin phi;
    dot(theta) cos theta + dot(psi)
  )
$
给出，Euler角$psi$是绕本体坐标系$z$轴的自转，其对应的广义力为沿$z$轴的力矩分量，从而
$
  dv(, t) (pdv(L, dot(psi))) - pdv(L, psi) = Q_psi = M_3
$
其中
$
  pdv(L, dot(psi)) & = sum_i I_i omega_i pdv(omega_i, dot(psi)) \
       pdv(L, psi) & = sum_i I_i omega_i pdv(omega_i, psi)
$
可计算得
$
  pdv(vb(omega), psi) = mat(omega_2; -omega_1; 0), pdv(vb(omega), dot(psi)) = mat(0; 0; 1)
$
整理得
$
  I_3 dot(omega)_3 - (I_1 - I_2) omega_1 omega_2 = M_3
$
只有角速度3个分量和3个主转动惯量以及力矩的第三分量。由于坐标轴的选择有任意性，3个主轴中任意1个都可以选作$z$轴，所以，通过轮换坐标轴，就可以得到另2个方程
$
  I_1 dot(omega)_1 - (I_2 - I_3) omega_2 omega_3 = M_1\
  I_2 dot(omega)_2 - (I_3 - I_1) omega_3 omega_1 = M_2
$
#newpara()

Euler动力学方程的形式看起来很简练，但因为是关于角速度分量的*非线性方程组*，解起来其实很困难。到现在只有如下特殊(对外力矩或刚体形状作某些限制)情形可以有解析解。
- Euler-Poinsot运动：自由刚体无外力矩作用下的转动。
- Lagrange-Poisson运动：对称刚体在重力场中绕固定点转动。
- Kovalevskaya运动：具有特定惯量比的刚体在重力场中绕固定点转动。
在此只简要地介绍前两种情形。

== 刚体的自由转动 Euler-Poinsot运动

=== 自由转动或惯性转动

自由转动或惯性转 动是指外力矩为零的情形。在重力场中刚体的定点自由转动，定点一定与质心重合，否则重力矩不能为零。如果是一般运动，可以分别考虑刚体质心的平动和绕质心的转动，重力矩自动为零。

以地球为例，因地球的线度比起日地距离要小得多，太阳引力的合力可认为近似作用于地球的质心，以质心为基点分解地球的运动，平动部分系在太阳引力的作用下作公转(以质心为代表的质点运动)，转动部分系围绕质心作自转(质心参考系中的定点转动)，此时外力矩为零，为自由转动。

自由转动是因惯性而运动。转动惯性与转动惯量张量相联系，因此比较复杂，与平动时的惯性不同。

=== 自由定点转动积分形式的解

自由定点转动，由于外力矩为零，Euler动力学方程组
$
  I_1 dot(omega)_1 - (I_2 - I_3) omega_2 omega_3 = 0\
  I_2 dot(omega)_2 - (I_3 - I_1) omega_3 omega_1 = 0\
  I_3 dot(omega)_3 - (I_1 - I_2) omega_1 omega_2 = 0
$
式中第一个方程乘以$2 I_1 omega_1$,第二个方程乘以$2 I_2 omega_2$,第三个方程乘以$2 I_3 omega_3$，然后将三式相加，得到
$
  dv(, t) (I_1^2 omega_1^2 + I_2^2 omega_2^2 + I_3^2 omega_3^2) = 0
$
积分得
$
  I_1^2 omega_1^2 + I_2^2 omega_2^2 + I_3^2 omega_3^2 = vb(J)^2 = "const"
$
即角动量大小为常量，角动量定理也给出
$
  vb(dot(J)) = dv(, t) (I_1 omega_1 vu(i) + I_2 omega_2 vu(j) + I_3 omega_3 vu(k)) = vb(M) = 0
$
则角动量矢量在空间中是定向不变的。

注意这里因为是本体坐标系，坐标单位矢量是随时间变化的。

第一个方程乘以$omega_1$,第二个方程乘以$omega_2$,第三个方程乘以$omega_3$，然后将三式相加，得到
$
  dv(, t) (I_1 omega_1^2 + I_2 omega_2^2 + I_3 omega_3^2) = 0
$
积分得
$
  I_1 omega_1^2 + I_2 omega_2^2 + I_3 omega_3^2 = 2 T = "const"
$

=== Euler-Poinsot运动的几何解释

对刚体自由定点转动的一般情形，可以不解方程而用几何方法直观描述刚体运动。在$vb(omega)$空间内定义一函数
$
  F(vb(omega)) = omega_1^2/((2 T)/I_1) + omega_2^2/((2 T)/I_2) + omega_3^2/((2 T)/I_3) = 1
$
$F=1$就是
$
  T = 1/2 (I_1 omega_1^2 + I_2 omega_2^2 + I_3 omega_3^2)
$
即动能守恒。此时在$vb(omega)$空间表示椭球面，这个特定曲面叫惯性椭球面(inertia ellipsoid)，与惯量椭球面类似，只是长短轴的长度变成了$sqrt((2 T)/I_k)$。*$vb(omega)$的端点在椭球面上，椭球面上任一点到球心的距离，表示角速度的大小。*

以$vb(omega)$的端点为切点做一个椭球面的切平面，切面的外法向可通过梯度求得
$
  grad_omega F = mat(
    (omega_1 I_1) / T;
    (omega_2 I_2) / T;
    (omega_3 I_3) / T
  ) = vb(J) / T
$
由于角动量守恒、动能守恒，所以梯度方向固定。另一方面，椭球心距该切面的距离为
$
  "OP" = vb(omega) dot vb(J)/J = (2 T)/J = "const"
$
因此该切面相对椭球固定，称为不变面或Poinsot平面。

$vb(omega)$的端点既在切面上，又在椭球面上，而$vb(omega)$矢量是瞬时轴，$vb(omega)$的端点瞬时速度为零，这意味着惯量椭球在保持与Poinsot面距离不变的情况下，在Poinsot面作*纯滚动*。惯量主轴是固定在刚体上的，惯量椭球的运动十分形象地给出了自由刚体的运动。

#grid(columns: (1fr, 1fr))[
  #figure(
    image("pic/2025-11-18-11-52-44.png", width: 100%),
    numbering: none,
  )
][
  #figure(
    image("pic/2025-11-18-11-54-39.png", width: 100%),
    numbering: none,
  )
]

切点在惯量椭球面上的轨迹叫*本体瞬心迹(polhode)*，不变切面上的曲线叫*空间瞬心迹(herpolhode)*。

事实上由于我们选择是主轴，惯性椭球的运动意味着$vb(omega)$的坐标架的变化，从而也有主轴坐标系的变化。通过惯量椭球的运动，可以得到主轴坐标系相对于空间参考系的变化，从而得到刚体的转动。
$
  vb(omega)_1 = omega_1 vu(i), vb(omega)_2 = omega_2 vu(j), vb(omega)_3 = omega_3 vu(k)
$

=== 轴对称刚体的角速度

如果是轴对称刚体，假设为
$
  I_1 = I_2 != I_3
$
惯量椭球面是对第三轴对称的一个旋转椭球面。这个椭球面在Poinsot面上滚动时，以椭球中心与Poinsot面距离保持不变的形式作纯滚动时，容易看出本体瞬心迹和空间瞬心迹都是圆，亦即运动过程圆锥母线长和高都不变 ,代表角速度大小和它的第三轴分量也都不变。

实际此时刚体角速度矢量相对角动量矢量作进动，但没有章动。
$
  vb(J) = cal(I) vb(omega)
$
#newpara()

这个结论也可以通过计算得到
$
  dot(omega)_3 & = ((I_1 - I_2) / I_3) omega_1 omega_2 = 0 \
$
$
  omega_3 = Omega = "const" \
$
代人
$
  dot(omega)_1 & = (1 - I_3/I_1) omega_2 Omega \
  dot(omega)_2 & = (I_3/I_1 - 1) omega_1 Omega \
$
令
$
  (I_3/I_1 - 1) Omega = n
$
则
$
  dot(omega)_1 & = -n omega_2 \
  dot(omega)_2 & = n omega_1 \
$
对式时间求导，再整理得
$
  dot.double(omega)_1 + n^2 omega_1 = 0\
  dot.double(omega)_2 + n^2 omega_2 = 0
$
有
$
  omega_1 = omega_perp cos abs(n)t
$
为简便起见推导中选择合适的初始时间使得初相为零。代回有
$
  omega_2 = cases(omega_perp sin abs(n)t\, n > 0\, I_3>I_1, -omega_perp sin abs(n)t\, n < 0\, I_3<I_1)
$
显然有
$
  omega_perp^2 = omega_1^2 + omega_2^2
$
由于动能是守恒量，因此
$
  T = 1/2 (I_1 omega_perp^2 + I_3 Omega^2) = "const" => \
  omega_perp = sqrt((2 T - I_3 Omega^2)/I_1) = "const"
$
角速度
$
  omega^2 = omega_perp^2 + Omega^2 = (2 T - I_3 Omega^2)/I_1 + Omega^2 = (2 T + (I_1 - I_3) Omega^2)/I_1 = "const"
$
进一步讨论方向，$vb(omega)$与对称轴$vu(k)$的夹角为$beta$，则
$
  tan beta = omega_perp / Omega = "const"
$
从而$vb(omega)$绕对称轴转动且以角速度$abs(n)$进动。惯量椭球为一旋转椭球
$
  (omega_1^2 + omega_2^2) / ((2 T)/I_1) + omega_3^2 / ((2 T)/I_3) = 1
$
由于$omega_1^2 + omega_2^2 = omega_perp^2$为常量，因此本体瞬心迹为绕对称轴的圆。另一方面，由于$vb(omega)$大小不变，又
$
  vb(omega) dot vb(J)/J = (2 T)/J = "const"
$
即$vb(omega)$在$vb(J)$方向投影不变意味着角速度在切面投影值亦不变，因此空间瞬心迹也是绕$vb(J)$的圆。另外有
$
  vb(J) dot (vb(omega) times vu(k)) = (I_1 omega_1 vu(i) + I_2 omega_2 vu(j) + I_3 omega_3 vu(k)) dot (- omega_2 vu(i) + omega_1 vu(j)) = 0
$
所以$vb(J), vb(omega), vu(k)$三者共面（一般取角动量为实验室系第3轴）。另外，在垂直于$vu(k)$方向$vb(J)_perp = I_1 vb(omega)_perp$，而沿着$vu(k)$方向$vb(J)_parallel = I_3 omega_parallel$，因此$vb(J), vb(omega)$一定在$vu(k)$的同一侧。

我们取$vb(J), vu(k)$的夹角为$alpha$，$vb(omega), vu(k)$的夹角为$beta$，则
- $I_1 < I_3$
  $
    tan alpha = J_perp/J_parallel = sqrt(J_1^2 + J_2^2)/J_3 = (I_1 omega_perp) / (I_3 omega_parallel) = (I_1/I_3) tan beta < tan beta => alpha < beta
  $
  例如，地球可看作是旋转扁椭球$I_3/I_1 - 1 = 0.00327 => n approx Omega/306$，$vb(omega)$沿天文地轴方向，$vu(k)$是地理地轴方向，即在北极。天文地极绕地理地极的进动周期 大约是306天或10个月。但因为地球不是理想刚体，实际这个周期要更长，大约是14个月。
- $I_1 > I_3$
  $
    tan alpha = J_perp/J_parallel = sqrt(J_1^2 + J_2^2)/J_3 = (I_1 omega_perp) / (I_3 omega_parallel) = (I_1/I_3) tan beta > tan beta => alpha > beta
  $

  #figure(
    image("pic/2025-12-08-10-34-07.png", width: 80%),
    numbering: none,
  )

=== 轴对称刚体的角速度及Euler角速度

刚体角速度$vb(omega)$和Euler的角速度之间由Euler运动学方程相联系。
$
  vb(omega) = mat(
    dot(theta) cos psi + dot(phi) sin theta sin psi;
    -dot(theta) sin psi + dot(phi) sin theta cos psi;
    dot(phi) cos theta + dot(psi)
  )
$

作为例子，考查惯量椭球为扁椭球情形($n>0,I_3>I_1=I_2$)。由于角动量守恒，可以假设角动量方向沿实验室系$z$轴方向，这样可以简化问题。在本体坐标系，角速度的3个分量为
$
  vb(omega) = mat(
    omega_perp cos n t;
    omega_perp sin n t;
    Omega
  )
$
此时$theta = alpha$，从而$dot(theta) = 0$得到
$
  mat(
    omega_perp cos n t;
    omega_perp sin n t;
    Omega
  ) = mat(
    dot(phi) sin alpha sin psi;
    dot(phi) sin alpha cos psi;
    dot(phi) cos alpha + dot(psi)
  )
$
前两个式子相除
$
  cot n t = tan psi
$
取最简单结果有
$
  psi = pi/2 - n t => dot(psi) = -n = -(I_3/I_1 - 1) Omega
$
代入最后一个式子
$
  dot(phi) cos alpha = I_3/I_1 Omega\
  dot(phi) = (I_3 Omega)/(I_1 cos alpha) = J / I_1 = sqrt(omega_perp^2 + I_3^2/I_1^2 Omega^2) = sqrt(omega^2 + (I_3^2/I_1^2 - 1)Omega^2)
$
也可以从另一个角度考虑，$dot(phi)$是刚体绕实验室系$z$轴的进动角速度，而$dot(psi)$是绕本体坐标系$z$轴的自转角速度，因此有
$
  vb(omega) = dot(phi) vu(k)' + dot(psi) vu(k)
$
#figure(
  image("pic/2025-12-08-10-55-20.png", width: 80%),
  numbering: none,
)
简单从三角形正弦定理可得
$
  dot(phi)/(sin beta) = (- dot(psi))/(sin (beta - alpha)) = omega / (sin alpha)
$
由此求$dot(phi), dot(psi)$，考虑到
$
  tan alpha = (I_1/I_3) tan beta, tan beta = omega_perp / Omega
$
可得
$
  dot(phi) & = (J/I_1) = sqrt(omega^2 + (I_3^2/I_1^2 - 1) Omega^2) \
  dot(psi) & = -(I_3/I_1 - 1) Omega
$

#example(subname: [])[
  有一匀质的薄圆盘，质量$m$，半径$r$，盘本身绕自身对称轴$omega_0$自转，绕竖直轴以恒角速度$Omega$转动，圆盘对称轴与竖直方向角度$alpha$不变，竖直轴穿过圆盘中心O点。选择O点作为原点，本体坐标系$z$轴与圆盘对称轴重合，$x-y$轴选在圆盘面内，选竖直方向做实验室坐标系 $z'$轴，且在$y-z$平面内。求：
  + 本体坐标系下的角速度
  + 动能、本体坐标系下的角动量
  + 本体系O点的力矩
  + 实验室系O点的力矩、角动量
  + 突然撤去力矩，进动的角速度
]

#solution[
  + 从Euler角考虑，取$phi$为绕实验室系$z'$轴的进动角，$theta = alpha$，$psi$为绕本体坐标系$z$轴的自转角，则
    $
      vb(omega) & = dot(phi) vu(k)' + dot(psi) vu(k) \
                & = Omega vu(k)' + omega_0 vu(k)
    $
    考虑本体坐标系下
    $
      vb(omega) & = mat(
                    dot(theta) cos psi + dot(phi) sin theta sin psi;
                    -dot(theta) sin psi + dot(phi) sin theta cos psi;
                    dot(phi) cos theta + dot(psi)
                  ) & = mat(
                        Omega sin alpha sin omega_0 t;
                        Omega sin alpha cos omega_0 t;
                        Omega cos alpha + omega_0
                      )
    $
  + 动能在主轴本体系为
    $
      T &= 1/2 (I_1 omega_1^2 + I_2 omega_2^2 + I_3 omega_3^2) = 1/2 (1/4 m r^2 (Omega^2 sin^2 alpha) + 1/2 m r^2 (Omega cos alpha + omega_0)^2)\
      &= 1/8 m r^2 (Omega^2 sin^2 alpha + 2 (Omega cos alpha + omega_0)^2)
    $
    以及角动量
    $
      vb(J) & = I_1 omega_1 vu(i) + I_2 omega_2 vu(j) + I_3 omega_3 vu(k) \
      & = 1/4 m r^2 Omega sin alpha sin omega_0 t vu(i) + 1/4 m r^2 Omega sin alpha cos omega_0 t vu(j) + 1/2 m r^2 (Omega cos alpha + omega_0) vu(k) \
      &= 1/4 m r^2 mat(
        Omega sin alpha sin omega_0 t;
        Omega sin alpha cos omega_0 t;
        2 (Omega cos alpha + omega_0)
      )
    $
  + 本体坐标系O点的力矩，根据Euler动力学方程
    $
      vb(M) & = mat(
                I_1 dot(omega)_1 - (I_2 - I_3) omega_2 omega_3;
                I_2 dot(omega)_2 - (I_3 - I_1) omega_3 omega_1;
                I_3 dot(omega)_3 - (I_1 - I_2) omega_1 omega_2
              )
    $
    得到
    $
      M_1 & = I_1 dot(omega)_1 - (I_2 - I_3) omega_2 omega_3 \
          & = I_1 omega_0 omega_2 + I_1 omega_2 omega_3 \
          & = 1/4 m r^2 Omega sin alpha cos omega_0 t (2omega_0 + Omega cos alpha) \
    $
    $
      M_2 & = I_2 dot(omega)_2 - (I_3 - I_1) omega_3 omega_1 \
          & = - I_2 omega_0 omega_1 - I_2 omega_1 omega_3 \
          & = -1/4 m r^2 Omega sin alpha sin omega_0 t (2omega_0 + Omega cos alpha) \
    $
    $
      M_3 & = I_3 dot(omega)_3 - (I_1 - I_2) omega_1 omega_2 = 0 \
    $
    得到
    $
      vb(M) = 1/4 m r^2 Omega sin alpha (2omega_0 + Omega cos alpha) mat(
        cos omega_0 t;
        -sin omega_0 t;
        0
      )
    $
  + 实验室系O点的力矩，根据力矩变换公式
    $
      vb(M)' = cal(U)^TT vb(M), cal(U)^TT = cal(U)_1^TT cal(U)_2^TT cal(U)_3^TT\
    $
    其中
    $
      cal(U)_3^TT = mat(
        cos psi, -sin psi, 0;
        sin psi, cos psi, 0;
        0, 0, 1
      ) = mat(
        cos omega_0 t, -sin omega_0 t, 0;
        sin omega_0 t, cos omega_0 t, 0;
        0, 0, 1
      )\
      cal(U)_3^TT mat(cos omega_0 t; -sin omega_0 t; 0) = mat(1; 0; 0)
    $
    $
      cal(U)_2^TT = mat(
        1, 0, 0;
        0, cos alpha, sin alpha;
        0, -sin alpha, cos alpha
      )\
      cal(U)_2^TT mat(1; 0; 0) = mat(1; 0; 0)
    $
    $
      cal(U)_1^TT = mat(
        cos phi, -sin phi, 0;
        sin phi, cos phi, 0;
        0, 0, 1
      ) = mat(
        cos (Omega t + phi_0), -sin (Omega t + phi_0), 0;
        sin (Omega t + phi_0), cos (Omega t + phi_0), 0;
        0, 0, 1
      )\
      cal(U)_1^TT mat(1; 0; 0) = mat(cos (Omega t + phi_0); sin (Omega t + phi_0); 0)
    $
    因此
    $
      vb(M)' = 1/4 m r^2 Omega sin alpha (2omega_0 + Omega cos alpha) mat(
        cos (Omega t + phi_0);
        sin (Omega t + phi_0);
        0
      )
    $
    同理可以算出实验室系O点的角动量
    $
      vb(J)' = 1/4 m r^2 mat(
        sin alpha (Omega cos alpha + 2 omega_0) cos (Omega t + phi_0);
        - sin alpha (Omega cos alpha + 2 omega_0) sin (Omega t + phi_0);
        Omega (1 + cos^2 alpha) + 2 omega_0 cos alpha
      )
    $
  + 突然撤去力矩，不妨在$Omega t + phi_0 = 2 k pi + pi = tau$时刻撤去力矩，变成了自由刚体转动，此时角动量为
    $
      vb(J)' = 1/4 m r^2 mat(
        0;
        sin alpha (Omega cos alpha + 2 omega_0);
        Omega (1 + cos^2 alpha) + 2 omega_0 cos alpha
      )
    $
    角动量守恒，$gamma$为角动量与实验室系$z'$轴夹角，则有
    $
      tan gamma = J_2 / J_3 = (sin alpha (Omega cos alpha + 2 omega_0)) / (Omega (1 + cos^2 alpha) + 2 omega_0 cos alpha)
    $
    $alpha'$是角动量与本体系$z(3)$轴夹角，$beta$为角速度与本体系$z(3)$轴夹角，则有
    $
      tan beta = omega/Omega\
      tan alpha' = I_1/I_3 tan beta = 1/2 tan beta
    $
    在本体系角动量为
    $
      vb(J) = 1/4 m r^2 mat(
        Omega sin alpha sin omega_0 tau;
        Omega sin alpha cos omega_0 tau;
        2Omega cos alpha + 2 omega_0
      )
    $
    因为角动量守恒，$vb(J)$方向不变，此时$vb(omega)$为
    $
      vb(omega) = mat(
        Omega sin alpha sin omega_0 tau;
        Omega sin alpha cos omega_0 tau;
        Omega cos alpha + omega_0
      )
    $
    因此进动角速度为
    $
      dot(phi) = sqrt(omega_perp^2 + (I_3^2/I_1^2) omega_3^2) = sqrt(Omega^2 sin^2 alpha + 4(omega_0 + Omega cos alpha)^2)
    $
]

== 有一固定点的对称陀螺

陀螺的运动不同于自由刚体运动，因受到重力矩的作用，它也叫*重刚体*问题。
#figure(
  image("pic/2025-12-08-12-20-10.png", width: 30%),
  numbering: none,
)
考虑陀螺的定点转动，假设陀螺质量$m$，重心离定点距离$l$，选惯量主轴为本体坐标轴，则轴对称质量分布的陀螺的势能和动能可表示为
$
  I_1 = I_2 != I_3\
  V = m g l cos theta\
  T = 1/2 I_1 (omega_1^2 + omega_2^2) + 1/2 I_3 omega_3^2
$
为了方便讨论，选择Euler角作为描述刚体运动的广义坐标
$
  vb(omega) = mat(
    dot(theta) cos psi + dot(phi) sin theta sin psi;
    -dot(theta) sin psi + dot(phi) sin theta cos psi;
    dot(phi) cos theta + dot(psi)
  )
$
$
  T = 1/2 I_1 (dot(theta)^2 + dot(phi)^2 sin^2 theta) + 1/2 I_3 (dot(phi) cos theta + dot(psi))^2\
$
Lagrange量为$L = T - V$，$psi, phi$为循环坐标可以得到对应的广义动量守恒
$
  p_psi & = pdv(L, dot(psi)) = I_3 (dot(phi) cos theta + dot(psi)) = I_3 omega_3 = J_3 = "const" \
  p_phi & = pdv(L, dot(phi)) = I_1 dot(phi) sin^2 theta + I_3 (dot(phi) cos theta + dot(psi)) cos theta = "const"
$
以及广义能量守恒
$
  E = T + V = 1/2 I_1 (dot(theta)^2 + dot(phi)^2 sin^2 theta) + 1/2 I_3 (dot(phi) cos theta + dot(psi))^2 + m g l cos theta = "const"
$
由于有*3个守恒量，为可积系统*，足够求得积分形式的解。令
$
  a = J_3 / I_1 = p_psi / I_1 \
  b = p_phi / I_1 \
  E' = E - 1/2 I_3 omega_3^2
$
均为常量，则
$
  dot(phi) & = (b - a cos theta) / sin^2 theta \
  dot(psi) & = J_3/I_3 - dot(phi) cos theta = I_1 / I_3 a - (b - a cos theta)/(sin^2 theta) cos theta\
  E' &= 1/2 I_1 dot(theta)^2 + 1/2 I_1 ((b - a cos theta)^2) / (sin^2 theta) + m g l cos theta = 1/2 I_1 dot(theta)^2 + V_"eff" (theta)
$
其中等效势能为
$
  V_"eff" (theta) = 1/2 I_1 ((b - a cos theta)^2) / (sin^2 theta) + m g l cos theta
$
从而
$
  dot(theta) = sqrt(2/I_1 (E' - V_"eff" (theta)))
$
积分得
$
  t = integral dd(theta) / sqrt(2/I_1 (E' - V_"eff" (theta)))
$
且有
$
  dv(phi, theta) = dot(phi)/dot(theta) = (b - a cos theta) / (sin^2 theta sqrt(2/I_1 (E' - V_"eff" (theta))))\
$
积分得
$
  phi = integral (b - a cos theta) / (sin^2 theta sqrt(2/I_1 (E' - V_"eff" (theta)))) dd(theta)
$
同理也能得到$psi$的积分形式解。

也可以不具体计算，只是根据 3 个守恒量，分析 3 个Euler角随时间变化的情况，就可定性地得到刚体的运动形式。为了讨论方便，令
$
  u = cos theta, dot(u) = - sin theta dot(theta)\
  dot(theta)^2 = dot(u)^2 / (1 - u^2)
$
注意到$theta -> 0$有$a=b$，无需担心奇点问题。我们设
$
  alpha = (2 E')/I_1,
  beta = (2 m g l) / I_1
$
有
$
  dot(u)^2 = (1 - u^2)(alpha - beta u) - (b - a u)^2 = f(u)
$
方程右边是关于$u$的三次函数。由于$dot(u)^2>=0$，须在$abs(u)<=1$区间使得$f(u)>=0$才能有物理意义的解。由于在定义域的端点
$
  u = plus.minus 1, f(plus.minus 1) = - (b minus.plus a)^2 <= 0
$
而三次项系数$beta>0 => f(plus.minus oo) -> plus.minus oo$，因此三次方程有解的条件是：$f(u)$在$[-1,+1]$有实根。
- $f(u)$在区间$[-1,+1]$有一个实根$u_1$有解的可能情形
  #figure(
    image("pic/2025-12-08-12-45-43.png", width: 80%),
    numbering: none,
  )
  - $u_1 = 1$，即$theta = 0$，$a = b, E' = m g l, alpha = beta$有
    $
      dot(u)^2 = (1 - u)^2 (beta (1 + u) - (a^2)(1 + u)) = (1 - u)^2 (beta - a^2)(1 + u) = 0
    $
    显然$u = +1$只能是重根，因此这个情形不合理。
  - $u_1 = 1$是$f(u)$的根又是拐点，因此$f(1)=0, f'(1)=0, f''(1)=0$即这个根是三重根。这要求$a=b, alpha = beta$另外满足$a^2/beta = 2$。此时$theta = 0, eval(dot(theta))_(theta=0) = 0, eval(dot.double(theta))_(theta=0) = 0$，因此*陀螺将保持直立转动*的不稳定运动，会逐渐恢复到$theta = 0$的状态，之后再次偏离，如此反复
  - $u_1 = cos theta_1$是切点，因此是重根。此时
    $
      f(u) = beta (u - u_1)^2 (u - u_2)
    $
    容易得到$theta = theta_1, eval(dot(theta))_(theta=theta_1) = 0, eval(dot.double(theta))_(theta=theta_1) = 0$，因此*因此陀螺作无章动的进动*，进动角速度为
    $
      eval(dot(phi))_(theta=theta_1) = (b - a cos theta_1) / (sin^2 theta_1)
    $
- $f(u)$在区间$[-1,+1]$有两个根且有解的可能情形
  #figure(
    image("pic/2025-12-08-15-23-59.png", width: 80%),
    numbering: none,
  )
  - 根$u_2 =+1$情况，类似(1)情形曲线1，同样不合理
  - 此时$u_2 = +1$是重根，$alpha = beta, a = b$，满足$f'(+1)=0, u_1 = a^2 / beta - 1$，因此有
    $
      dot(phi) = beta/a, dot(psi) = beta/a + (I_1/I_3 - 1) a
    $
    另一方面，由于$-1<u_1<+1$，因此$0 < a^2 / alpha < 2$，且在$u_1 != - 1, u_2 = +1$之间满足$dot(u)^2 = f(u) > 0$，因此$theta$在$0 < theta < arccos u_1$之间摆动，*陀螺作章动*
  - 分下面三种情况
    - 设初始条件保证$b/a > u_2$，则总有$b - a cos theta > 0$，因此$dot(phi) > 0$，陀螺*正向进动*；而且在$theta_1 = arccos u_1, theta_2 = arccos u_2$处$dot(theta)=0$，陀螺*在$theta_1 ,theta_2$之间摆动*；如(a)所示
    - 设初始条件保证$u_1 < b/a < u_2$，此时$dot(phi)$不总大于零，若平均起来$dot(phi)$大于零，则*平均净进动*；如(b)所示
    - 设初始条件保证$b/a = u_2$，这时$dot(phi)$在$theta_2$为零；如(c)所示
    #figure(
      image("pic/2025-12-08-15-38-13.png", width: 80%),
      numbering: none,
    )
- $f(u)$在区间$[-1,+1]$有三个根且有解的可能情形
  #figure(
    image("pic/2025-12-08-15-38-00.png", width: 80%),
    numbering: none,
  )
  - 但在此情形$+1$不是重根，与(1)情形曲线1类似，不合理
- 综合以上讨论，重刚体只有(1)情形中的曲线2、曲线3及(2)情形中的曲线2、曲线3对应的运动形式。

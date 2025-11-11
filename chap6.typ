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
    dot(theta) cos psi + dot(psi) sin theta cos phi;
    -dot(theta) sin psi + dot(psi) sin theta sin phi;
    dot(theta) cos theta + dot(psi)
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
      dot(theta) cos psi + dot(psi) sin theta cos phi;
      -dot(theta) sin psi + dot(psi) sin theta sin phi;
      dot(theta) cos theta + dot(psi)
    )
  $
]

== 刚体的转动惯量张量

*本体坐标系原点选在刚体质心时的转动惯量张量*

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

#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [分析力学第1次作业],
  author: "Anzreww",
  time: "2025年",
  matheq-depth: 1,
  cb-counter-depth: 1,
)
#let hw-figure(path, width: 45%) = align(center, image(path, width: width))

#exercise(subname: [1.1])[
  半径为 $R$ 的光滑半球形碗固定在水平面上。一质量为 $m$ 的匀质棒斜靠在碗缘，一端在碗内，一端在碗外，在碗内的长度为 $c$。试用虚功原理给出棒的全长。
  #hw-figure("pic/1.1.png", width: 46%)
]

#solution[
  设棒长为 $l$，并以棒与水平线的夹角 $theta$ 为广义坐标。棒的质心坐标可写为
  $
    bold(r)_c = ((c-l)/2 cos theta, (c-l)/2 sin theta),
  $
  因而
  $
    delta bold(r)_c = (-(c-l)/2 sin theta delta theta, (c-l)/2 cos theta delta theta).
  $
  重力的虚功为
  $
    delta W = m g bold(y) dot delta bold(r)_c
    = m g (c-l)/2 cos theta delta theta = 0.
  $
  对任意 $delta theta$，有 $l=c$，故棒的全长为
  $
    L = 2 c.
  $
]

#exercise(subname: [1.3])[
  在半径为 $R$ 的竖直半圆硬钢丝上（两端点在水平线上），穿有重量分别为 $P$ 和 $Q$ 的两个小球。两球用长为 $2l$ 的不可伸长轻绳相连，不计摩擦，试用虚功原理求两球的平衡位置，即绳和水平线的夹角 $alpha$。
  #hw-figure("pic/1.3.png", width: 48%)
]

#solution[
  令两球到圆心的弦长为 $r$，则 $r=sqrt(R^2-l^2)$，并令 $theta=arccos(l/R)$。取 $alpha$ 为广义坐标，两球位置为
  $
    bold(r)_P & = (-r cos(theta-alpha), r sin(theta-alpha)), \
    bold(r)_Q & = ( r cos(theta+alpha), r sin(theta+alpha)).
  $
  重力虚功
  $
    delta W = -P g bold(y) dot delta bold(r)_P-Q g bold(y) dot delta bold(r)_Q
    = (P g cos(theta-alpha)-Q g cos(theta+alpha)) delta alpha.
  $
  平衡时
  $
    (P+Q) sin theta sin alpha=(Q-P) cos theta cos alpha,
  $
  因而
  $
    tan alpha = (Q-P)/(Q+P) cot theta
    = (Q-P)/(Q+P) l/sqrt(R^2-l^2).
  $
]

#exercise(subname: [1.5])[
  质量为 $M$、倾角为 $theta$ 的光滑斜面的底面放在光滑水平面上。一质量为 $m$ 的小块从斜面顶端由静止滑下。利用达朗贝尔原理，给出小块相对斜面的加速度。
  #hw-figure("pic/1.5.png", width: 42%)
]

#solution[
  以斜面水平位移 $X$ 和小块沿斜面向下的位移 $s$ 为广义坐标，有
  $
    bold(r)_M=(X,0), quad bold(r)_m=(X+s cos theta,-s sin theta).
  $
  达朗贝尔原理给出
  $
    (M+m) dot.double(X)+m cos theta dot.double(s) & =0, \
        m cos theta dot.double(X)+m dot.double(s) & =m g sin theta.
  $
  消去 $dot.double(X)$，得到
  $
    dot.double(s)=((M+m) sin theta)/(M+m sin^2 theta) g.
  $
]

#exercise(subname: [1.7])[
  质量为 $m$ 的质点受重力作用，并被约束在半顶角为 $alpha$ 的倒立圆锥面内运动。以柱坐标中的 $r,theta$ 为广义坐标，用达朗贝尔原理给出运动微分方程。
  #hw-figure("pic/1.7.png", width: 36%)
]

#solution[
  圆锥约束为 $z=r cot alpha$，故
  $
    bold(r)=(r,theta,r cot alpha),
  $
  且柱坐标下的加速度为
  $
    bold(a)=(dot.double(r)-r dot(theta)^2) bold(e)_r
    +(r dot.double(theta)+2 dot(r) dot(theta)) bold(e)_theta
    +cot alpha dot.double(r) bold(e)_z.
  $
  把 $delta z=cot alpha delta r$ 代入达朗贝尔原理
  $
    (-m g bold(e)_z-m bold(a)) dot delta bold(r)=0,
  $
  分别比较 $delta r$ 与 $delta theta$ 的系数，得
  $
    csc^2 alpha dot.double(r)-r dot(theta)^2+g cot alpha & =0, \
                 r dot.double(theta)+2 dot(r) dot(theta) & =0.
  $
]

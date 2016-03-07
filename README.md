# XsingleRotationGestureRecognizer-Master
单指旋转视图

苹果官方有双指的，自写一个单指可缩放可旋转的手势。

#### 使用方法：<br />

>1.拖入XsingleRotationGestureRecoginzer文件夹。<br />
>2.在需要的地方导入XsingleRotationGestureRecoginzer.h。<br />
>3. 创建这个手势<br />
    XsingleRotationRecoginzer *rotationGesture = [[XsingleRotationRecoginzer alloc] initWithTarget:self action:@selector(rotationAction:)];<br />
>4. 设置这个手势是可同时缩放<br />
    rotationGesture.suofang = YES;<br />
>5.把该手势添加到需要旋转（缩放）的视图上<br />
    [self.testView addGestureRecognizer:rotationGesture];<br />
>6.实现方法<br />
  -(void)rotationAction:(XsingleRotationRecoginzer*)rotation {<br />
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);<br />
  //必写此方法清楚rotation，因为rotation会累积。<br />
    rotation.rotation = 0;<br />
  //若设置了可缩放，则可以写此方法缩放视图<br />
    rotation.view.transform = CGAffineTransformScale(rotation.view.transform, rotation.scale, rotation.scale);<br />
}<br />
好了。

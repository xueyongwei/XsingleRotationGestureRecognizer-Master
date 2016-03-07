# XsingleRotationGestureRecognizer-Master
单指旋转视图

苹果官方有双指的，自写一个单指可缩放可旋转的手势。
使用方法：
1.拖入XsingleRotationGestureRecoginzer文件夹。
2.在需要的地方导入XsingleRotationGestureRecoginzer.h。
3. 创建这个手势
    XsingleRotationRecoginzer *rotationGesture = [[XsingleRotationRecoginzer alloc] initWithTarget:self action:@selector(rotationAction:)];
5. 设置这个手势是可同时缩放
    rotationGesture.suofang = YES;
6.把该手势添加到需要旋转（缩放）的视图上
    [self.testView addGestureRecognizer:rotationGesture];
7.实现方法
  -(void)rotationAction:(XsingleRotationRecoginzer*)rotation {
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
  //必写此方法清楚rotation，因为rotation会累积。
    rotation.rotation = 0;
  //若设置了可缩放，则可以写此方法缩放视图
    rotation.view.transform = CGAffineTransformScale(rotation.view.transform, rotation.scale, rotation.scale);
}
好了。

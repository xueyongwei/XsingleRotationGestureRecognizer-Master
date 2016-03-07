//
//  ViewController.m
//  XsingleRotationGestureRecognizer-Master
//
//  Created by xueyongwei on 16/3/7.
//  Copyright © 2016年 xueyongwei. All rights reserved.
//

#import "ViewController.h"
#import "XsingleRotationGuestreRecognizer.h"

@interface ViewController ()
{
    BOOL xuanzhuan;
}
@property (weak, nonatomic) IBOutlet UIView *imgView;

@end

@implementation ViewController
- (IBAction)touchDown:(UIButton *)sender {
    xuanzhuan = YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    xuanzhuan = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    xuanzhuan = NO;
    
    XsingleRotationGuestreRecognizer *xs = [[XsingleRotationGuestreRecognizer alloc]initWithTarget:self action:@selector(xsHandle:)];
    [self.imgView addGestureRecognizer:xs];
    
}
-(void)xsHandle:(XsingleRotationGuestreRecognizer *)recognizer
{
    if (xuanzhuan) {
        recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
        recognizer.rotation = 0;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

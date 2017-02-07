//
//  DrawLineController.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "DrawLineController.h"

@interface DrawLineController ()

@end

@implementation DrawLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];

    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnim.duration = 5.0;
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnim.fromValue = @(0);
    pathAnim.toValue = @(1);
    pathAnim.autoreverses = YES;
    pathAnim.fillMode = kCAFillModeForwards;
    pathAnim.repeatCount = HUGE_VALF;
    [shapeLayer addAnimation:pathAnim forKey:@"strokeEndAnim"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

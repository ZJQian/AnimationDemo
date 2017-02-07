//
//  KeyframeAnimController.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "KeyframeAnimController.h"

@interface KeyframeAnimController ()

@end

@implementation KeyframeAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    UIView *animView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 70, 70)];
    animView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animView];
    
    CAKeyframeAnimation *orbitAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbitAnim.duration = 5;
    orbitAnim.path = path.CGPath;
    orbitAnim.calculationMode = kCAAnimationPaced;
    orbitAnim.fillMode = kCAFillModeForwards;
    orbitAnim.repeatCount = HUGE_VALF;
    orbitAnim.rotationMode = kCAAnimationRotateAutoReverse;
    [animView.layer addAnimation:orbitAnim forKey:@"orbitAnim"];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
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

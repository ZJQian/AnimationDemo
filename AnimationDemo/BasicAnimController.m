//
//  BasicAnimController.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#define VIEW_COLOR [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]

#import "BasicAnimController.h"

@interface BasicAnimController ()

@end

@implementation BasicAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self basicAnimation];
}

- (void)basicAnimation {

    
    /******************************旋转动画****************************************/
    
    UIView *rotationViewX = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 70, 70)];
    rotationViewX.backgroundColor = VIEW_COLOR;
    [self.view addSubview:rotationViewX];
    CABasicAnimation *rotationAnimationX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimationX.beginTime = 0.0;
    rotationAnimationX.toValue = @(2*M_PI);
    rotationAnimationX.duration = 1.5;
    rotationAnimationX.repeatCount = HUGE_VALF;
    [rotationViewX.layer addAnimation:rotationAnimationX forKey:@"rotationAnimationX"];

    
    UIView *rotationViewY = [[UIView alloc]initWithFrame:CGRectMake(150, 100, 70, 70)];
    rotationViewY.backgroundColor = VIEW_COLOR;
    [self.view addSubview:rotationViewY];
    CABasicAnimation *rotationAnimationY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimationY.beginTime = 0.0;
    rotationAnimationY.toValue = @(2*M_PI);
    rotationAnimationY.duration = 1.5;
    rotationAnimationY.repeatCount = HUGE_VALF;
    [rotationViewY.layer addAnimation:rotationAnimationY forKey:@"rotationAnimationY"];
    
    
    UIView *rotationViewZ = [[UIView alloc]initWithFrame:CGRectMake(280, 100, 70, 70)];
    rotationViewZ.backgroundColor = VIEW_COLOR;
    [self.view addSubview:rotationViewZ];
    CABasicAnimation *rotationAnimationZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimationZ.beginTime = 0.0;
    rotationAnimationZ.toValue = @(2*M_PI);
    rotationAnimationZ.duration = 1.5;
    rotationAnimationZ.repeatCount = HUGE_VALF;
    [rotationViewZ.layer addAnimation:rotationAnimationZ forKey:@"rotationAnimationZ"];
    
    /****************************比例缩放***********************************************/
    
    UIView *scaleView = [[UIView alloc]initWithFrame:CGRectMake(20, 230, 70, 70)];
    scaleView.backgroundColor = VIEW_COLOR;
    [self.view addSubview:scaleView];
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(0.3);
    scaleAnimation.toValue = @(1.3);
    scaleAnimation.duration = 1.5;
    scaleAnimation.repeatCount = HUGE_VALF;
    scaleAnimation.autoreverses = YES;
    [scaleView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    UIView *scaleViewX = [[UIView alloc]initWithFrame:CGRectMake(150, 230, 70, 70)];
    scaleViewX.backgroundColor = VIEW_COLOR;
    [self.view addSubview:scaleViewX];
    CABasicAnimation *scaleAnimationX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleAnimationX.fromValue = @(0.3);
    scaleAnimationX.toValue = @(1.3);
    scaleAnimationX.duration = 1.5;
    scaleAnimationX.repeatCount = HUGE_VALF;
    scaleAnimationX.autoreverses = YES;
    [scaleViewX.layer addAnimation:scaleAnimationX forKey:@"scaleAnimationX"];
    
    UIView *scaleViewY = [[UIView alloc]initWithFrame:CGRectMake(280, 230, 70, 70)];
    scaleViewY.backgroundColor = VIEW_COLOR;
    [self.view addSubview:scaleViewY];
    CABasicAnimation *scaleAnimationY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleAnimationY.fromValue = @(0.3);
    scaleAnimationY.toValue = @(1.3);
    scaleAnimationY.duration = 1.5;
    scaleAnimationY.repeatCount = HUGE_VALF;
    scaleAnimationY.autoreverses = YES;
    [scaleViewY.layer addAnimation:scaleAnimationY forKey:@"scaleAnimationY"];
    
    
    /****************************圆角***********************************************/
    
    UIView *cornerRadiusView = [[UIView alloc]initWithFrame:CGRectMake(20, 360, 70, 70)];
    cornerRadiusView.backgroundColor = VIEW_COLOR;
    [self.view addSubview:cornerRadiusView];
    CABasicAnimation *cornerRadiusAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnimation.toValue = @(35);
    cornerRadiusAnimation.duration = 1.5;
    cornerRadiusAnimation.repeatCount = HUGE_VALF;
    cornerRadiusAnimation.autoreverses = YES;
    [cornerRadiusView.layer addAnimation:cornerRadiusAnimation forKey:@"cornerRadiusAnimation"];
    
    /****************************背景颜色***********************************************/
    
    UIView *bgColorView = [[UIView alloc]initWithFrame:CGRectMake(150, 360, 70, 70)];
    bgColorView.backgroundColor = VIEW_COLOR;
    [self.view addSubview:bgColorView];
    CABasicAnimation *bgColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    bgColorAnimation.toValue = (__bridge id _Nullable)(VIEW_COLOR.CGColor);
    bgColorAnimation.duration = 1.5;
    bgColorAnimation.repeatCount = HUGE_VALF;
    bgColorAnimation.autoreverses = YES;
    [bgColorView.layer addAnimation:bgColorAnimation forKey:@"bgColorAnimation"];
    
    /****************************指定大小***********************************************/
    
    UIView *boundsView = [[UIView alloc]initWithFrame:CGRectMake(280, 360, 70, 70)];
    boundsView.backgroundColor = VIEW_COLOR;
    [self.view addSubview:boundsView];
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    boundsAnimation.duration = 1.5;
    boundsAnimation.repeatCount = HUGE_VALF;
    boundsAnimation.autoreverses = YES;
    [boundsView.layer addAnimation:boundsAnimation forKey:@"boundsAnimation"];
    
    /****************************位置变化***********************************************/
    
    UIView *positonView = [[UIView alloc]initWithFrame:CGRectMake(20, 490, 70, 70)];
    positonView.backgroundColor = VIEW_COLOR;
    [self.view addSubview:positonView];
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 525)];
    positionAnimation.duration = 1.5;
    positionAnimation.repeatCount = HUGE_VALF;
    positionAnimation.autoreverses = YES;
    [positonView.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    /****************************内容变化***********************************************/
    
    UIImageView *contentsView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 580, 70, 70)];
    contentsView.image = [UIImage imageNamed:@"from"];
    [self.view addSubview:contentsView];
    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnimation.toValue = (__bridge id _Nullable)([UIImage imageNamed:@"to"].CGImage);
    contentsAnimation.duration = 1.5;
    contentsAnimation.repeatCount = HUGE_VALF;
    contentsAnimation.autoreverses = YES;
    [contentsView.layer addAnimation:contentsAnimation forKey:@"contentsAnimation"];
    
    /****************************透明度变化***********************************************/
    
    UIImageView *opacityView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 580, 70, 70)];
    opacityView.backgroundColor = VIEW_COLOR;
    [self.view addSubview:opacityView];
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue = @(0.3);
    opacityAnimation.duration = 1.5;
    opacityAnimation.repeatCount = HUGE_VALF;
    opacityAnimation.autoreverses = YES;
    [opacityView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

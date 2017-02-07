//
//  SpringAnimViewController.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "SpringAnimViewController.h"

@interface SpringAnimViewController ()

@end

@implementation SpringAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 50, 30)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
    spring.damping = 5;
    spring.stiffness = 100;
    spring.mass = 1;
    spring.initialVelocity = 0;
    spring.fromValue = @(label.layer.position.x);
    spring.toValue = @(label.layer.position.x + 100);
    spring.autoreverses = YES;
    spring.repeatCount = HUGE_VALF;
    spring.duration = spring.settlingDuration;
    [label.layer addAnimation:spring forKey:spring.keyPath];
    
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

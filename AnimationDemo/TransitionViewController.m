//
//  TransitionViewController.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()<CAAnimationDelegate>
{

    UILabel *        _transitionLabel;
    NSInteger        _index;

}

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation TransitionViewController

- (NSMutableArray *)dataArray {

    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:@[@"cube", @"suckEffect", @"rippleEffect", @"pageCurl", @"pageUnCurl", @"oglFlip", @"cameraIrisHollowOpen", @"cameraIrisHollowClose", @"spewEffect",@"genieEffect",@"unGenieEffect",@"twist",@"tubey",@"swirl",@"charminUltra", @"zoomyIn", @"zoomyOut", @"oglApplicationSuspend"]];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *label = [[UILabel alloc]init];
    label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    label.bounds = CGRectMake(0, 0, 200, 300);
    label.font = [UIFont systemFontOfSize:20.0];
    label.backgroundColor = [UIColor redColor];
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    _transitionLabel = label;
    
    UIButton *animBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [animBtn setTitle:@"动画" forState:UIControlStateNormal];
    [animBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    animBtn.frame  =CGRectMake(20, 70, 50, 30);
    [animBtn addTarget:self action:@selector(animBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:animBtn];
}

- (void)animBtnClick{

    CATransition *transition = [[CATransition alloc]init];
    transition.delegate = self;
    transition.duration = 1.0;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = self.dataArray[_index];
    transition.subtype = kCATransitionFromLeft;
    transition.repeatCount = 1;
    [transition setValue:@"transitionAnim" forKey:@"anim"];
    [_transitionLabel.layer addAnimation:transition forKey:@"transition"];
    _transitionLabel.text = [NSString stringWithFormat:@"动画效果：%@",self.dataArray[_index]];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    _index = (_index < self.dataArray.count - 1) ? _index + 1 : 0;
    if (flag) {
        
        CATransition *transition = [[CATransition alloc]init];
        transition.delegate = self;
        transition.duration = 1.0;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = self.dataArray[_index];
        transition.subtype = kCATransitionFromLeft;
        transition.repeatCount = 1;
        [transition setValue:@"transitionAnim" forKey:@"anim"];
        [_transitionLabel.layer addAnimation:transition forKey:@"transition"];
        _transitionLabel.text = [NSString stringWithFormat:@"动画效果：%@",self.dataArray[_index]];
    }
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

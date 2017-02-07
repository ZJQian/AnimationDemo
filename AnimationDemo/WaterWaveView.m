//
//  WaterWaveView.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "WaterWaveView.h"

@interface WaterWaveView ()
{

    CGFloat          _waterWaveWidth;//波浪的宽度
    CGFloat          _waveSpeed;//波浪的速度
    CGFloat          _waveA;//水纹振幅
    CGFloat          _waveW;//水纹周期
    CGFloat          _currentK;//当前波浪高度
    CGFloat          _offsetX;//位移
    UIColor *        _firstWaveColor;//波浪的颜色
    CAShapeLayer *   _firstWaveLayer;
    CAShapeLayer *   _secondWaveLayer;
    CADisplayLink*   _waveDisplaylink;
}
@end

@implementation WaterWaveView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = YES;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    // 波浪宽
    _waterWaveWidth = self.bounds.size.width;
    // 波浪颜色
    _firstWaveColor = [UIColor greenColor];
    // 波浪速度
    _waveSpeed = 0.4 /M_PI;
    
    _firstWaveLayer = [[CAShapeLayer alloc]init];
    // 设置闭环的颜色
    _firstWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
    // 设置边缘线的颜色
    //        firstWaveLayer.strokeColor = UIColor.blue.cgColor
    _firstWaveLayer.strokeStart = 0.0;
    _firstWaveLayer.strokeEnd = 0.8;
    
    _secondWaveLayer = [[CAShapeLayer alloc]init];
    // 设置闭环的颜色
    _secondWaveLayer.fillColor =  [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
    // 设置边缘线的颜色
    //        secondWaveLayer.strokeColor = UIColor.blue.cgColor
    _secondWaveLayer.strokeStart = 0.0;
    _secondWaveLayer.strokeEnd = 0.8;
    [self.layer addSublayer:_firstWaveLayer];
    [self.layer addSublayer:_secondWaveLayer];
    
    // 设置波浪流动速度
    _waveSpeed = 0.05;
    // 设置振幅
    _waveA = 8;
    // 设置周期
    _waveW = 2 * M_PI / self.bounds.size.width;
    // 设置波浪纵向位置
    _currentK = self.bounds.size.height / 2; //屏幕居中
    
    _waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [_waveDisplaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}
- (void)getCurrentWave {

    // 实时位移
    _offsetX += _waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}

- (void)setCurrentFirstWaveLayerPath {

    // 创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _currentK;
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (int i=0; i<(int)_waterWaveWidth; i++) {
        y = _waveA *sin(_waveW*i +_offsetX) +_currentK;
        CGPathAddLineToPoint(path, nil, i, y);
    }
   
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    _firstWaveLayer.path = path;
    
    // 创建一个路径
    // 创建一个路径
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGFloat y2 = _currentK;
    CGPathMoveToPoint(path2, nil, 0, y2);
    
    for (int i=0; i<(int)_waterWaveWidth; i++) {
        y2 = _waveA *sin(_waveW*i +_offsetX- _waterWaveWidth/2) +_currentK;
        CGPathAddLineToPoint(path2, nil, i, y2);
    }
    
    CGPathAddLineToPoint(path2, nil, _waterWaveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path2, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path2);
    _secondWaveLayer.path = path2;
}

@end

//
//  ViewController.m
//  AnimationDemo
//
//  Created by ZJQ on 2017/2/7.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView      *      tableView;
@property (nonatomic, strong) NSMutableArray   *      dataArray;

@end

@implementation ViewController

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataArray {

    if (!_dataArray) {
        _dataArray =[NSMutableArray arrayWithArray:
                     @[@[@{@"clsName":@"BasicAnimController",@"title":@"CABasicAnimation基础动画"},
                         @{@"clsName":@"KeyframeAnimController",@"title":@"CAKeyframeAnimation基础动画"},
                         @{@"clsName":@"DrawLineController",@"title":@"画线动画、线条递增、递减动画"},
                         @{@"clsName":@"TransitionViewController",@"title":@"CATransition转场动画"},
                         @{@"clsName":@"SpringAnimViewController",@"title":@"CASpringAnimation弹簧动画"}],
                       @[@{@"clsName":@"DrawLineController",@"title":@"画线动画"},
                         @{@"clsName":@"WaterWaveController",@"title":@"水波纹效果"},
                         @{@"clsName":@"FireAnimController",@"title":@"粒子动画-火苗效果"}]]];

    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class myClass = NSClassFromString(self.dataArray[indexPath.section][indexPath.row][@"clsName"]);
    UIViewController *vc = [[myClass alloc]init];
    vc.title = self.dataArray[indexPath.section][indexPath.row][@"title"];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

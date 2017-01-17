//
//  ViewController.m
//  EBTActivityIndicatorViewDemo
//
//  Created by ebaotong on 2017/1/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTDGActivityInidcatorView.h"
#import "DGActivityIndicatorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(UIButton *)sender {
    
    [EBTDGActivityInidcatorView showActivityIndicatorView:EBTDGActivityIndicatorAnimationTypeBallPulseSync withIndicatorColor:[UIColor redColor] withDescription:@"网络请求数据加载中..."];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [EBTDGActivityInidcatorView dismissActivityIndicatorView];
    });
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

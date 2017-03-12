//
//  IBLHomeViewController.m
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import "IBLHomeViewController.h"
#import "IBLScanViewController.h"
@interface IBLHomeViewController()

@property (nonatomic, strong) UIButton *scanButton;

@end

@implementation IBLHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_scanButton setTitle:@"开始扫描" forState:UIControlStateNormal];
    _scanButton.frame = CGRectMake(100, 100, 100, 44);
    [_scanButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
//    [_scanButton setBackgroundColor:[UIColor cyanColor]];
    
    [_scanButton addTarget:self action:@selector(beginScan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_scanButton];
    
}


- (void)beginScan
{
    IBLScanViewController *scanViewController = [[IBLScanViewController alloc] init];
    [self presentViewController:scanViewController animated:YES completion:nil];
}

@end

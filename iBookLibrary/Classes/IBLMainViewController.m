//
//  IBLMainViewController.m
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import "IBLMainViewController.h"

#import "IBLNavigationController.h"
#import "IBLHomeViewController.h"
#import "IBLSettingViewController.h"
@interface IBLMainViewController ()

@property (nonatomic, strong) UIButton *scanButton;

@end

@implementation IBLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//
    
    [self setUpChilds];
    

    
}

- (void)setUpChilds
{
    IBLHomeViewController *homeViewController = [[IBLHomeViewController  alloc] init];
    [self setupVc:homeViewController title:@"首页" icon:@""];
    
    
    IBLSettingViewController *settingViewController = [[IBLSettingViewController alloc] init];
    [self setupVc:settingViewController title:@"设置" icon:@""];

    
    
}

- (void)setupVc:(UIViewController *)vc title:(NSString *)title icon:(NSString *)iconName
{
    IBLNavigationController *nav = [[IBLNavigationController alloc] initWithRootViewController:vc];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:iconName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_hl", iconName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    [self addChildViewController:nav];
    
}

//- (void)beginScan
//{
//    [[IBLQRCodeTool shareInstance] startScanFromCameraInView:self.view success:^(NSString *result) {
//        NSLog(@"%@", result);
//    }];
//}

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

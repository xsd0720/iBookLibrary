//
//  IBLScanViewController.m
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import "IBLScanViewController.h"
#import "IBLQRCodeTool.h"
#import "IBLSearchCenterRequest.h"
@interface IBLScanViewController ()

@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation IBLScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setTitle:@"close" forState:UIControlStateNormal];
    [self.closeButton setFrame:CGRectMake(0, 20, 44, 44)];
    [self.closeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeButton];
    
    
    [[IBLQRCodeTool shareInstance] startScanFromCameraInView:self.view success:^(NSString *result) {
        if (![result hasPrefix:@"http"]) {
            [self requestWithISBN:result];
        }
    }];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.closeButton];
}

- (void)closeButtonPressed
{
    [[IBLQRCodeTool shareInstance] stopScanFromCamera];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)requestWithISBN:(NSString *)isbn
{
    [IBLSearchCenterRequest searchBookWithISBN:isbn success:^(id responsObject) {
        NSLog(@"%@", responsObject);
        NSLog(@"%@", [responsObject objectForKey:@"title"]);
    } failure:^(NSError *error) {
        
    }];
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

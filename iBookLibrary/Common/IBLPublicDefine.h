//
//  IBLPublicDefine.h
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#ifndef IBLPublicDefine_h
#define IBLPublicDefine_h

//日志开关 仅在debug下会起作用
#ifdef DEBUG
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define LWLog(...)  printf("%s [line%d] --- \n",__func__,__LINE__);NSLog(__VA_ARGS__)
#else
#define LWLog(...)
#endif



//获取屏幕高度宽度的宏
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)

//获取状态栏高度的宏
#define TOP_HEIGHT (20)

//获取导航栏高度的宏
#define NAV_HEIGHT (64)

#define TAB_HEIGHT (49)

#define IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define IOS_9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define IOS_10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

//CGRect CGSize CGPoint 的便利生成
#define Rect(X, Y, W, H) (CGRectMake((X), (Y), (W), (H)))
#define Size(W, H) (CGSizeMake((W), (H)))
#define Point(X, Y) (CGPointMake((X), (Y)))

//获取系统时间戳
#define getCurrentTime [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]

// iOS系统版本
#define SYSTEM_VERSION    [[[UIDevice currentDevice] systemVersion] doubleValue]

// 标准系统状态栏高度
#define SYS_STATUSBAR_HEIGHT                        20

// 热点栏高度
#define HOTSPOT_STATUSBAR_HEIGHT            20

// 导航栏（UINavigationController.UINavigationBar）高度
#define NAVIGATIONBAR_HEIGHT                44

// 工具栏（UINavigationController.UIToolbar）高度
#define TOOLBAR_HEIGHT                              44

// 标签栏（UITabBarController.UITabBar）高度
#define TABBAR_HEIGHT                              49

// APP_STATUSBAR_HEIGHT=SYS_STATUSBAR_HEIGHT+[HOTSPOT_STATUSBAR_HEIGHT]
#define APP_STATUSBAR_HEIGHT                (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))

// 根据APP_STATUSBAR_HEIGHT判断是否存在热点栏
#define IS_HOTSPOT_CONNECTED                (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?YES:NO)

// 无热点栏时，标准系统状态栏高度+导航栏高度
#define NORMAL_STATUS_AND_NAV_BAR_HEIGHT    (SYS_STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT)

// 实时系统状态栏高度+导航栏高度，如有热点栏，其高度包含在APP_STATUSBAR_HEIGHT中。
#define STATUS_AND_NAV_BAR_HEIGHT                    (20+NAVIGATIONBAR_HEIGHT)

// 取到keyWindow
#define KEY_WINDOW  ([[UIApplication sharedApplication]delegate].window)

#define APPDelegate_WINDOW [[UIApplication sharedApplication]delegate].window

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)



#define SCREEN_SCALE (SCREEN_WIDTH/320.)

//G－C－D
#define BACK_GCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN_GCD(block) dispatch_async(dispatch_get_main_queue(),block)

//  屏幕适配
#define SCREEN_X 320.0f * SCREEN_WIDTH
#define SCREEN_Y 568.0f * SCREEN_HEIGHT

//  判断是神马机子
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.width == 320) ? YES : NO)

#define IS_IPhone6 (667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

#define IS_IPhone6plus (736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

//网络注册监听
#define INTERNET_LISTEN_NOTIFICATION     @"INTERNET_LISTEN_NOTIFICATION"

//WIFI 网络
#define WIFI                             @"WIFI"

//无网络
#define NOTREACHABLE                     @"NOTREACHABLE"

//无线网络
#define WWAN                             @"WWAN"

#define ThemeDidChangeNotification       @"ThemeDidChangeNotification"

#define TOUCHUANOWNOTIFICATION           @"TOUCHUANOWNOTIFICATION"

//沙盒路径
#define systemDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#endif /* IBLPublicDefine_h */

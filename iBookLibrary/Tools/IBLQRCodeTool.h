//
//  IBLQRCodeTool.h
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^IBLQRCodeToolSuccessBlock)(NSString *result);

@interface IBLQRCodeTool : NSObject


+ (IBLQRCodeTool *)shareInstance;

- (void)startScanFromCameraInView:(UIView *)superView success:(IBLQRCodeToolSuccessBlock)success;

- (void)stopScanFromCamera;

- (NSString *)startScanWithImage:(UIImage *)image;



@end

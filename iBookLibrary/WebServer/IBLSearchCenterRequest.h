//
//  IBLSearchCenterRequest.h
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBLHttpTool.h"
@interface IBLSearchCenterRequest : NSObject

+ (IBLSearchCenterRequest *)shareInstance;

+ (void)searchBookWithISBN:(NSString *)isbn
                   success:(IBLHttpToolSuccessBlock)success
                   failure:(IBLHttpToolFailBlock)failure;

@end

//
//  IBLSearchCenterRequest.m
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import "IBLSearchCenterRequest.h"

@implementation IBLSearchCenterRequest

+ (IBLSearchCenterRequest *)shareInstance
{
    static IBLSearchCenterRequest *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


+ (void)searchBookWithISBN:(NSString *)isbn success:(IBLHttpToolSuccessBlock)success failure:(IBLHttpToolFailBlock)failure
{
    
    [IBLHttpTool GET:[NSString stringWithFormat:@"%@%@", ISBNSEARCHURL, isbn] parameters:nil success:^(id responsObject) {
        if (responsObject) {
            success(responsObject);
        }
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

@end

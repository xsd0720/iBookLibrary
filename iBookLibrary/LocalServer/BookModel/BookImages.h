//
//  BookImages.h
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BookImages : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *small;
@property (nonatomic, strong) NSString *large;
@property (nonatomic, strong) NSString *medium;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

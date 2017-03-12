//
//  BookRating.h
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BookRating : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double min;
@property (nonatomic, strong) NSString *average;
@property (nonatomic, assign) double max;
@property (nonatomic, assign) double numRaters;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  BookBaseClass.h
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BookImages, BookRating;

@interface BookBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *isbn13;
@property (nonatomic, strong) NSArray *author;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *catalog;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *altTitle;
@property (nonatomic, strong) NSString *isbn10;
@property (nonatomic, strong) BookImages *images;
@property (nonatomic, strong) NSString *alt;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *originTitle;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSArray *translator;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *binding;
@property (nonatomic, strong) BookRating *rating;
@property (nonatomic, strong) NSString *authorIntro;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

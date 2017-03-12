//
//  BookImages.m
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BookImages.h"


NSString *const kBookImagesSmall = @"small";
NSString *const kBookImagesLarge = @"large";
NSString *const kBookImagesMedium = @"medium";


@interface BookImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BookImages

@synthesize small = _small;
@synthesize large = _large;
@synthesize medium = _medium;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.small = [self objectOrNilForKey:kBookImagesSmall fromDictionary:dict];
            self.large = [self objectOrNilForKey:kBookImagesLarge fromDictionary:dict];
            self.medium = [self objectOrNilForKey:kBookImagesMedium fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.small forKey:kBookImagesSmall];
    [mutableDict setValue:self.large forKey:kBookImagesLarge];
    [mutableDict setValue:self.medium forKey:kBookImagesMedium];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.small = [aDecoder decodeObjectForKey:kBookImagesSmall];
    self.large = [aDecoder decodeObjectForKey:kBookImagesLarge];
    self.medium = [aDecoder decodeObjectForKey:kBookImagesMedium];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_small forKey:kBookImagesSmall];
    [aCoder encodeObject:_large forKey:kBookImagesLarge];
    [aCoder encodeObject:_medium forKey:kBookImagesMedium];
}

- (id)copyWithZone:(NSZone *)zone {
    BookImages *copy = [[BookImages alloc] init];
    
    
    
    if (copy) {

        copy.small = [self.small copyWithZone:zone];
        copy.large = [self.large copyWithZone:zone];
        copy.medium = [self.medium copyWithZone:zone];
    }
    
    return copy;
}


@end

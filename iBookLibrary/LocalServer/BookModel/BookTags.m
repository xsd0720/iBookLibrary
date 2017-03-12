//
//  BookTags.m
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BookTags.h"


NSString *const kBookTagsCount = @"count";
NSString *const kBookTagsName = @"name";
NSString *const kBookTagsTitle = @"title";


@interface BookTags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BookTags

@synthesize count = _count;
@synthesize name = _name;
@synthesize title = _title;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.count = [[self objectOrNilForKey:kBookTagsCount fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kBookTagsName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBookTagsTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kBookTagsCount];
    [mutableDict setValue:self.name forKey:kBookTagsName];
    [mutableDict setValue:self.title forKey:kBookTagsTitle];

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

    self.count = [aDecoder decodeDoubleForKey:kBookTagsCount];
    self.name = [aDecoder decodeObjectForKey:kBookTagsName];
    self.title = [aDecoder decodeObjectForKey:kBookTagsTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kBookTagsCount];
    [aCoder encodeObject:_name forKey:kBookTagsName];
    [aCoder encodeObject:_title forKey:kBookTagsTitle];
}

- (id)copyWithZone:(NSZone *)zone {
    BookTags *copy = [[BookTags alloc] init];
    
    
    
    if (copy) {

        copy.count = self.count;
        copy.name = [self.name copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


@end

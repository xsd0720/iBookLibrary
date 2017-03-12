//
//  BookRating.m
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BookRating.h"


NSString *const kBookRatingMin = @"min";
NSString *const kBookRatingAverage = @"average";
NSString *const kBookRatingMax = @"max";
NSString *const kBookRatingNumRaters = @"numRaters";


@interface BookRating ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BookRating

@synthesize min = _min;
@synthesize average = _average;
@synthesize max = _max;
@synthesize numRaters = _numRaters;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.min = [[self objectOrNilForKey:kBookRatingMin fromDictionary:dict] doubleValue];
            self.average = [self objectOrNilForKey:kBookRatingAverage fromDictionary:dict];
            self.max = [[self objectOrNilForKey:kBookRatingMax fromDictionary:dict] doubleValue];
            self.numRaters = [[self objectOrNilForKey:kBookRatingNumRaters fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.min] forKey:kBookRatingMin];
    [mutableDict setValue:self.average forKey:kBookRatingAverage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.max] forKey:kBookRatingMax];
    [mutableDict setValue:[NSNumber numberWithDouble:self.numRaters] forKey:kBookRatingNumRaters];

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

    self.min = [aDecoder decodeDoubleForKey:kBookRatingMin];
    self.average = [aDecoder decodeObjectForKey:kBookRatingAverage];
    self.max = [aDecoder decodeDoubleForKey:kBookRatingMax];
    self.numRaters = [aDecoder decodeDoubleForKey:kBookRatingNumRaters];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_min forKey:kBookRatingMin];
    [aCoder encodeObject:_average forKey:kBookRatingAverage];
    [aCoder encodeDouble:_max forKey:kBookRatingMax];
    [aCoder encodeDouble:_numRaters forKey:kBookRatingNumRaters];
}

- (id)copyWithZone:(NSZone *)zone {
    BookRating *copy = [[BookRating alloc] init];
    
    
    
    if (copy) {

        copy.min = self.min;
        copy.average = [self.average copyWithZone:zone];
        copy.max = self.max;
        copy.numRaters = self.numRaters;
    }
    
    return copy;
}


@end

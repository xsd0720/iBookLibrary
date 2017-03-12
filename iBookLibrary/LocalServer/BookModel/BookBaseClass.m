//
//  BookBaseClass.m
//
//  Created by   on 2017/3/12
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BookBaseClass.h"
#import "BookTags.h"
#import "BookImages.h"
#import "BookRating.h"


NSString *const kBookBaseClassIsbn13 = @"isbn13";
NSString *const kBookBaseClassAuthor = @"author";
NSString *const kBookBaseClassPublisher = @"publisher";
NSString *const kBookBaseClassPages = @"pages";
NSString *const kBookBaseClassUrl = @"url";
NSString *const kBookBaseClassCatalog = @"catalog";
NSString *const kBookBaseClassTags = @"tags";
NSString *const kBookBaseClassTitle = @"title";
NSString *const kBookBaseClassImage = @"image";
NSString *const kBookBaseClassSummary = @"summary";
NSString *const kBookBaseClassAltTitle = @"alt_title";
NSString *const kBookBaseClassIsbn10 = @"isbn10";
NSString *const kBookBaseClassImages = @"images";
NSString *const kBookBaseClassAlt = @"alt";
NSString *const kBookBaseClassPubdate = @"pubdate";
NSString *const kBookBaseClassId = @"id";
NSString *const kBookBaseClassOriginTitle = @"origin_title";
NSString *const kBookBaseClassSubtitle = @"subtitle";
NSString *const kBookBaseClassTranslator = @"translator";
NSString *const kBookBaseClassPrice = @"price";
NSString *const kBookBaseClassBinding = @"binding";
NSString *const kBookBaseClassRating = @"rating";
NSString *const kBookBaseClassAuthorIntro = @"author_intro";


@interface BookBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BookBaseClass

@synthesize isbn13 = _isbn13;
@synthesize author = _author;
@synthesize publisher = _publisher;
@synthesize pages = _pages;
@synthesize url = _url;
@synthesize catalog = _catalog;
@synthesize tags = _tags;
@synthesize title = _title;
@synthesize image = _image;
@synthesize summary = _summary;
@synthesize altTitle = _altTitle;
@synthesize isbn10 = _isbn10;
@synthesize images = _images;
@synthesize alt = _alt;
@synthesize pubdate = _pubdate;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize originTitle = _originTitle;
@synthesize subtitle = _subtitle;
@synthesize translator = _translator;
@synthesize price = _price;
@synthesize binding = _binding;
@synthesize rating = _rating;
@synthesize authorIntro = _authorIntro;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isbn13 = [self objectOrNilForKey:kBookBaseClassIsbn13 fromDictionary:dict];
            self.author = [self objectOrNilForKey:kBookBaseClassAuthor fromDictionary:dict];
            self.publisher = [self objectOrNilForKey:kBookBaseClassPublisher fromDictionary:dict];
            self.pages = [self objectOrNilForKey:kBookBaseClassPages fromDictionary:dict];
            self.url = [self objectOrNilForKey:kBookBaseClassUrl fromDictionary:dict];
            self.catalog = [self objectOrNilForKey:kBookBaseClassCatalog fromDictionary:dict];
    NSObject *receivedBookTags = [dict objectForKey:kBookBaseClassTags];
    NSMutableArray *parsedBookTags = [NSMutableArray array];
    
    if ([receivedBookTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBookTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBookTags addObject:[BookTags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBookTags isKindOfClass:[NSDictionary class]]) {
       [parsedBookTags addObject:[BookTags modelObjectWithDictionary:(NSDictionary *)receivedBookTags]];
    }

    self.tags = [NSArray arrayWithArray:parsedBookTags];
            self.title = [self objectOrNilForKey:kBookBaseClassTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kBookBaseClassImage fromDictionary:dict];
            self.summary = [self objectOrNilForKey:kBookBaseClassSummary fromDictionary:dict];
            self.altTitle = [self objectOrNilForKey:kBookBaseClassAltTitle fromDictionary:dict];
            self.isbn10 = [self objectOrNilForKey:kBookBaseClassIsbn10 fromDictionary:dict];
            self.images = [BookImages modelObjectWithDictionary:[dict objectForKey:kBookBaseClassImages]];
            self.alt = [self objectOrNilForKey:kBookBaseClassAlt fromDictionary:dict];
            self.pubdate = [self objectOrNilForKey:kBookBaseClassPubdate fromDictionary:dict];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kBookBaseClassId fromDictionary:dict];
            self.originTitle = [self objectOrNilForKey:kBookBaseClassOriginTitle fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kBookBaseClassSubtitle fromDictionary:dict];
            self.translator = [self objectOrNilForKey:kBookBaseClassTranslator fromDictionary:dict];
            self.price = [self objectOrNilForKey:kBookBaseClassPrice fromDictionary:dict];
            self.binding = [self objectOrNilForKey:kBookBaseClassBinding fromDictionary:dict];
            self.rating = [BookRating modelObjectWithDictionary:[dict objectForKey:kBookBaseClassRating]];
            self.authorIntro = [self objectOrNilForKey:kBookBaseClassAuthorIntro fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isbn13 forKey:kBookBaseClassIsbn13];
    NSMutableArray *tempArrayForAuthor = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.author) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAuthor addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAuthor addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAuthor] forKey:kBookBaseClassAuthor];
    [mutableDict setValue:self.publisher forKey:kBookBaseClassPublisher];
    [mutableDict setValue:self.pages forKey:kBookBaseClassPages];
    [mutableDict setValue:self.url forKey:kBookBaseClassUrl];
    [mutableDict setValue:self.catalog forKey:kBookBaseClassCatalog];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.tags) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kBookBaseClassTags];
    [mutableDict setValue:self.title forKey:kBookBaseClassTitle];
    [mutableDict setValue:self.image forKey:kBookBaseClassImage];
    [mutableDict setValue:self.summary forKey:kBookBaseClassSummary];
    [mutableDict setValue:self.altTitle forKey:kBookBaseClassAltTitle];
    [mutableDict setValue:self.isbn10 forKey:kBookBaseClassIsbn10];
    [mutableDict setValue:[self.images dictionaryRepresentation] forKey:kBookBaseClassImages];
    [mutableDict setValue:self.alt forKey:kBookBaseClassAlt];
    [mutableDict setValue:self.pubdate forKey:kBookBaseClassPubdate];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kBookBaseClassId];
    [mutableDict setValue:self.originTitle forKey:kBookBaseClassOriginTitle];
    [mutableDict setValue:self.subtitle forKey:kBookBaseClassSubtitle];
    NSMutableArray *tempArrayForTranslator = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.translator) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTranslator addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTranslator addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTranslator] forKey:kBookBaseClassTranslator];
    [mutableDict setValue:self.price forKey:kBookBaseClassPrice];
    [mutableDict setValue:self.binding forKey:kBookBaseClassBinding];
    [mutableDict setValue:[self.rating dictionaryRepresentation] forKey:kBookBaseClassRating];
    [mutableDict setValue:self.authorIntro forKey:kBookBaseClassAuthorIntro];

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

    self.isbn13 = [aDecoder decodeObjectForKey:kBookBaseClassIsbn13];
    self.author = [aDecoder decodeObjectForKey:kBookBaseClassAuthor];
    self.publisher = [aDecoder decodeObjectForKey:kBookBaseClassPublisher];
    self.pages = [aDecoder decodeObjectForKey:kBookBaseClassPages];
    self.url = [aDecoder decodeObjectForKey:kBookBaseClassUrl];
    self.catalog = [aDecoder decodeObjectForKey:kBookBaseClassCatalog];
    self.tags = [aDecoder decodeObjectForKey:kBookBaseClassTags];
    self.title = [aDecoder decodeObjectForKey:kBookBaseClassTitle];
    self.image = [aDecoder decodeObjectForKey:kBookBaseClassImage];
    self.summary = [aDecoder decodeObjectForKey:kBookBaseClassSummary];
    self.altTitle = [aDecoder decodeObjectForKey:kBookBaseClassAltTitle];
    self.isbn10 = [aDecoder decodeObjectForKey:kBookBaseClassIsbn10];
    self.images = [aDecoder decodeObjectForKey:kBookBaseClassImages];
    self.alt = [aDecoder decodeObjectForKey:kBookBaseClassAlt];
    self.pubdate = [aDecoder decodeObjectForKey:kBookBaseClassPubdate];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kBookBaseClassId];
    self.originTitle = [aDecoder decodeObjectForKey:kBookBaseClassOriginTitle];
    self.subtitle = [aDecoder decodeObjectForKey:kBookBaseClassSubtitle];
    self.translator = [aDecoder decodeObjectForKey:kBookBaseClassTranslator];
    self.price = [aDecoder decodeObjectForKey:kBookBaseClassPrice];
    self.binding = [aDecoder decodeObjectForKey:kBookBaseClassBinding];
    self.rating = [aDecoder decodeObjectForKey:kBookBaseClassRating];
    self.authorIntro = [aDecoder decodeObjectForKey:kBookBaseClassAuthorIntro];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isbn13 forKey:kBookBaseClassIsbn13];
    [aCoder encodeObject:_author forKey:kBookBaseClassAuthor];
    [aCoder encodeObject:_publisher forKey:kBookBaseClassPublisher];
    [aCoder encodeObject:_pages forKey:kBookBaseClassPages];
    [aCoder encodeObject:_url forKey:kBookBaseClassUrl];
    [aCoder encodeObject:_catalog forKey:kBookBaseClassCatalog];
    [aCoder encodeObject:_tags forKey:kBookBaseClassTags];
    [aCoder encodeObject:_title forKey:kBookBaseClassTitle];
    [aCoder encodeObject:_image forKey:kBookBaseClassImage];
    [aCoder encodeObject:_summary forKey:kBookBaseClassSummary];
    [aCoder encodeObject:_altTitle forKey:kBookBaseClassAltTitle];
    [aCoder encodeObject:_isbn10 forKey:kBookBaseClassIsbn10];
    [aCoder encodeObject:_images forKey:kBookBaseClassImages];
    [aCoder encodeObject:_alt forKey:kBookBaseClassAlt];
    [aCoder encodeObject:_pubdate forKey:kBookBaseClassPubdate];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kBookBaseClassId];
    [aCoder encodeObject:_originTitle forKey:kBookBaseClassOriginTitle];
    [aCoder encodeObject:_subtitle forKey:kBookBaseClassSubtitle];
    [aCoder encodeObject:_translator forKey:kBookBaseClassTranslator];
    [aCoder encodeObject:_price forKey:kBookBaseClassPrice];
    [aCoder encodeObject:_binding forKey:kBookBaseClassBinding];
    [aCoder encodeObject:_rating forKey:kBookBaseClassRating];
    [aCoder encodeObject:_authorIntro forKey:kBookBaseClassAuthorIntro];
}

- (id)copyWithZone:(NSZone *)zone {
    BookBaseClass *copy = [[BookBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.isbn13 = [self.isbn13 copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.publisher = [self.publisher copyWithZone:zone];
        copy.pages = [self.pages copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.catalog = [self.catalog copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.summary = [self.summary copyWithZone:zone];
        copy.altTitle = [self.altTitle copyWithZone:zone];
        copy.isbn10 = [self.isbn10 copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.alt = [self.alt copyWithZone:zone];
        copy.pubdate = [self.pubdate copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.originTitle = [self.originTitle copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.translator = [self.translator copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.binding = [self.binding copyWithZone:zone];
        copy.rating = [self.rating copyWithZone:zone];
        copy.authorIntro = [self.authorIntro copyWithZone:zone];
    }
    
    return copy;
}


@end

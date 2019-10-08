//
//  MOEntry.m
//  journal-objc
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOEntry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimestampKey = @"timestamp";

@implementation MOEntry

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timeStamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title
                          text:text
                     timeStamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.text,
             TimestampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[MOEntry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(MOEntry *)object dictionaryRepresentation]];
}

@end

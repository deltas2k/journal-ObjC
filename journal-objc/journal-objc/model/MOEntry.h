//
//  MOEntry.h
//  journal-objc
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOEntry : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * text;
@property (nonatomic) NSDate * timestamp;

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timeStamp:(NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END

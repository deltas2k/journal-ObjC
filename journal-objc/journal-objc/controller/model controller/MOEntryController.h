//
//  MOEntryController.h
//  journal-objc
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOEntry.h"


@interface MOEntryController : NSObject

+ (MOEntryController *) sharedController;

@property (nonatomic,copy,readonly) NSArray * entries;
- (void)addEntry:(MOEntry *) entry;
- (void)deleteEntry:(MOEntry *) entry;

- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;

@end

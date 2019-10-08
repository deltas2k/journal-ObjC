//
//  MOEntryController.m
//  journal-objc
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOEntryController.h"

static NSString * const EntriesKey = @"entries";

@interface MOEntryController ()

@property (nonatomic) NSMutableArray *internalEntries;

@end

@implementation MOEntryController

+ (MOEntryController *)sharedController
{
    static MOEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MOEntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (MOEntry *entry in self.entries) {
          [entryDictionaries addObject:entry.dictionaryRepresentation];
      }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        MOEntry *entry = [[MOEntry alloc] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

#pragma mark - Properties

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntry:(MOEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)deleteEntry:(MOEntry *)entry
{
    [self.internalEntries removeObject:entry];
}

@end

//
//  ASWeakSet.m
//  AsyncDisplayKit
//
//  Created by Adlai Holler on 1/7/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ASWeakSet.h"

@interface ASWeakSet<__covariant ObjectType> ()
@property (nonatomic, strong, readonly) NSMapTable<NSNull *, NSNull *> *mapTable;
@end

@implementation ASWeakSet

- (instancetype)init
{
  self = [super init];
  if (self) {
    _mapTable = [NSMapTable weakToStrongObjectsMapTable];
  }
  return self;
}

- (void)addObject:(id)object
{
  [_mapTable setObject:[NSNull null] forKey:object];
}

- (void)removeObject:(id)object
{
  [_mapTable removeObjectForKey:object];
}

- (void)removeAllObjects
{
  [_mapTable removeAllObjects];
}

- (BOOL)containsObject:(id)object
{
  return [_mapTable objectForKey:object] != nil;
}

- (BOOL)isEmpty
{
  for (__unused id object in _mapTable) {
    return NO;
  }
  return YES;
}

- (NSUInteger)count
{
  NSInteger count = 0;
  for (__unused id object in _mapTable) {
    count += 1;
  }
  return count;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nonnull *)buffer count:(NSUInteger)len
{
  return [_mapTable countByEnumeratingWithState:state objects:buffer count:len];
}

@end

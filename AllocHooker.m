//
//  AllocHooker.m
//  luatest
//
//  Created by lujb on 15/8/5.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "AllocHooker.h"

static NSHashTable *hashTable;

@interface UIView (AllocHook)
@end

@implementation UIView (AllocHook)

-(instancetype)customInit
{
    if (!hashTable) {
        hashTable = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
    }
    
    [hashTable addObject:self];
    
    return [self customInit];
}

@end


@implementation ViewAllocHooker


-(void)startRecord
{
    
    Class class = [UIView class];
    
    SEL originalSelector = @selector(init);
    SEL swizzledSelector = @selector(customInit);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

-(void)stopRecord
{
    Class class = [UIView class];
    
    SEL originalSelector = @selector(customInit);
    SEL swizzledSelector = @selector(init);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

-(NSArray*)showRecords
{
    NSLog(@"records==>%@",hashTable.allObjects);
    return hashTable.allObjects;
}

@end

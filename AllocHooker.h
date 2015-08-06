//
//  AllocHooker.h
//  luatest
//
//  Created by lujb on 15/8/5.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewAllocHooker : NSObject

-(void)startRecord;

-(void)stopRecord;

-(NSArray*)showRecords;


@end

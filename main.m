//
//  main.m
//  luatest
//
//  Created by lujb on 15/7/20.
//  Copyright (c) 2015年 lujb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllocHooker.h"

@interface View : UIView

@end

@implementation View


@end

@interface ViewTest : View

@end

@implementation ViewTest


@end

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        
        UIView *view1 = [[UIView alloc] init];
        
        ViewAllocHooker *hooker = [[ViewAllocHooker alloc] init];
        
        [hooker startRecord];
        UIView *view2 = [[UIView alloc] init];
        
        View *view3 = [[View alloc] init];
        
        @autoreleasepool {
            UIView *view4 = [[UIView alloc] init];
        }
        ViewTest *view5 = [[ViewTest alloc] init];
        
        UIImageView  *imageView = [[UIImageView alloc] init];

        UIImage *image = [[UIImage alloc] init];
        
        [hooker stopRecord];
        
        UIView *view6 = [[UIView alloc] init];
        
        [hooker showRecords];
        
        
        return 0;
    }
}

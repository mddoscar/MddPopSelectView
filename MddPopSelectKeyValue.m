//
//  MddPopSelectKeyValue.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddPopSelectKeyValue.h"


@implementation MddPopSelectKeyValue
@synthesize mTitle;
@synthesize mIsSelected;
-(id) initWithDataTitle:(NSString *) pTitle mIsSelected:(BOOL)pIsSelected
{
    if (self=[super init]) {
        self.mTitle=pTitle;
        self.mIsSelected=pIsSelected;
    }

    return self;
}

@end

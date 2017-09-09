//
//  PopObjKeyValue.m
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PopObjKeyValue.h"

@implementation PopObjKeyValue

-(id) initWithDataText:(NSString *)pText mData:(NSString *)pData
{
    if (self=[super init]) {
        self.mText=pText;
        self.mData=pData;
    }
    return self;
}
@end

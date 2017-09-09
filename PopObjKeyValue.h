//
//  PopObjKeyValue.h
//  com.mddoscar.mddhelper
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PopObjKeyValue : NSObject
//
#pragma mark data
@property (nonatomic,strong) NSString * mText;
@property (nonatomic,strong) NSString * mData;
-(id) initWithDataText:(NSString *) pText mData:(NSString *) pData;

@end

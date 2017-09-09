//
//  MddPopSelectKeyValue.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 弹出选中实体
 */
@interface MddPopSelectKeyValue : NSObject

@property(nonatomic ,copy) NSString * mTitle;
@property(nonatomic,assign) BOOL mIsSelected;
-(id) initWithDataTitle:(NSString *) pTitle mIsSelected:(BOOL)pIsSelected;

@end

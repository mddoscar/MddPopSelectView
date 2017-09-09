//
//  MddPopSelectTableViewController.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MddPopSelectKeyValue.h"
//传参数协议
@protocol MddPopSelectTableDelegate
//设置
-(void) mddPopSetValue:(NSMutableArray *)pValue;
//可选
@optional
//取消事件
-(void) mddPopCancelWtihCallBack:(NSMutableArray *)pValue;
//ok事件
-(void) mddPopOkWtihCallBack:(NSMutableArray *)pValue;
@end

/*
 举个例子
 NSMutableArray * result=[NSMutableArray array];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Repeat" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Sunday" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Monday" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Tuesday" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Wednesday" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Thursday" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Friday" mIsSelected:YES]];
 [result addObject:[[MddPopSelectKeyValue alloc]initWithDataTitle:@"Saturday" mIsSelected:YES]];
 mRepeatVc=[MddPopSelectTableViewController initializeForNibWtihData:gRepeatArray forDelegate:self];
 //推出隐藏底部
 mDateVc.hidesBottomBarWhenPushed = YES;
 NSLog(@"med:%d:%s",__LINE__,__FUNCTION__);
 [self presentPopupViewController:mRepeatVc animationType:MJPopupViewAnimationSlideBottomTop];
 */

/*
 弹出选择控制器
 */
@interface MddPopSelectTableViewController : UIViewController<MddPopSelectTableDelegate>
{
    //代理
    id <MddPopSelectTableDelegate> mddDelegate;
    
}

#pragma mark 成员
@property (nonatomic,strong) id<MddPopSelectTableDelegate> mddDelegate;
#pragma mark ib
@property (weak, nonatomic) IBOutlet UITableView *mUiConextTableView;
@property (weak, nonatomic) IBOutlet UIButton *mUiCancelButton;
@property (weak, nonatomic) IBOutlet UIButton *mUiOkButton;
//action
- (IBAction)doCancel:(id)sender;
- (IBAction)doOk:(id)sender;
#pragma mark data
//选择
@property (nonatomic,strong) NSMutableArray * mSelectArray;
#pragma mark 设置
//设置值
-(void) mddPopSetValue:(NSMutableArray *)pValue;
#pragma mark ctor
//构造函数
+ (instancetype)initializeForNib;
//构造函数
+ (instancetype)initializeForNibWtihData:(NSMutableArray *)pData forDelegate:(id<MddPopSelectTableDelegate>)pDelegate;

@end

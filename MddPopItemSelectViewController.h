//
//  MddPopItemSelectViewController.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/24.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>
//简直对
@class PopObjKeyValue;
//传参数协议
@protocol MddPopItemSelectTableDelegate
//设置
-(void) mddPopItemSetValue:(NSMutableArray *)pValue;
//可选
@optional
//取消事件
-(void) mddPopSelectItemWtihCallBack:(PopObjKeyValue *)pValue  onIndexPath:(NSIndexPath *)pNSIndexPath;
@end

/*
 选择器控件
 
 举个栗子
 mThemeArray =[ThemeService getValueList];
 NSString * tPrix=[ThemeService getLocalPrix];
 NSMutableArray * result=[NSMutableArray array];
 for (int i=0; i<mThemeArray.count; i++) {
 NSString * mData=mThemeArray[i];
 NSString * tStrKey=[NSString stringWithFormat:@"%@%@",tPrix,mData];
 PopObjKeyValue * obj=[[PopObjKeyValue alloc] initWithDataText:_LS_(tStrKey, nil) mData:mData];
 [result addObject:obj];
 }
 gThemeVc=[MddPopItemSelectViewController initializeForNibWtihData:result forDelegate:self];
 //推出隐藏底部
 gThemeVc.hidesBottomBarWhenPushed = YES;
 NSLog(@"med:%d:%s",__LINE__,__FUNCTION__);
 [self presentPopupViewController:gThemeVc animationType:MJPopupViewAnimationSlideBottomTop];
 */
@interface MddPopItemSelectViewController : UIViewController<MddPopItemSelectTableDelegate>
{
    //代理
    id <MddPopItemSelectTableDelegate> mddDelegate;
    
}
#pragma mark 成员
@property (nonatomic,strong) id<MddPopItemSelectTableDelegate> mddDelegate;
#pragma mark ib
@property (weak, nonatomic) IBOutlet UITableView *mUiConextTableView;
#pragma mark data
//选择
@property (nonatomic,strong) NSMutableArray * mSelectArray;
//回调tag(回调tag)
@property(nonatomic,copy) NSString * mSendCallBackTag;
#pragma mark 设置
//设置值
-(void) mddPopItemSetValue:(NSMutableArray *)pValue;
#pragma mark ctor
//构造函数
+ (instancetype)initializeForNib;
//构造函数
+ (instancetype)initializeForNibWtihData:(NSMutableArray *)pData forDelegate:(id<MddPopItemSelectTableDelegate>)pDelegate;
//获取新版
+(NSMutableArray *) getItemArrWithStrArr:(NSArray *) pStrArray;




@end

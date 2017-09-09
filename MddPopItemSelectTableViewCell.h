//
//  MddPopItemSelectTableViewCell.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/24.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PopObjKeyValue.h"
/*
 子项选择器单元格
 */
@interface MddPopItemSelectTableViewCell : UITableViewCell
#pragma mark ib

@property (weak, nonatomic) IBOutlet UILabel *mUiTitleLabel;
#pragma mark data
@property (nonatomic,strong) PopObjKeyValue * mData;
-(void) setMData:(PopObjKeyValue *)pData ;
@end

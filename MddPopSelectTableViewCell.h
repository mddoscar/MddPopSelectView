//
//  MddPopSelectTableViewCell.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MddPopSelectKeyValue;


/*
 选中单元格
 xib 复用标识要加MddPopSelectTableViewCell
 */
@interface MddPopSelectTableViewCell : UITableViewCell

#pragma mark ib 

@property (weak, nonatomic) IBOutlet UILabel *mUiTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mUiRightImage;


#pragma mark data
@property (nonatomic,strong) MddPopSelectKeyValue * mData;
-(void) setMData:(MddPopSelectKeyValue *)pData;
@end

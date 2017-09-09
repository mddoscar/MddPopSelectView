//
//  MddPopItemSelectTableViewCell.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/24.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddPopItemSelectTableViewCell.h"
//选中
#import "MddPopSelectKeyValue.h"
//选中图片
@implementation MddPopItemSelectTableViewCell
@synthesize mUiTitleLabel=_mUiTitleLabel;
@synthesize mData=_mData;
- (void)awakeFromNib {
    // Initialization code
    //字体
    self.mUiTitleLabel.font=kBaseFontMediaFontSizeB;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void) setMData:(PopObjKeyValue *)pData
{
    if (pData) {
        _mData=pData;
        //设置状态位
        self.mUiTitleLabel.text=_mData.mText;
    }
}


@end

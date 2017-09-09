//
//  MddPopSelectTableViewCell.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddPopSelectTableViewCell.h"
//选中
#import "MddPopSelectKeyValue.h"
//选中图片
#define kSelectImage @"mddpopSelected.png"
#define kUnSelectImage @"mddpopUnSelect.png"
@implementation MddPopSelectTableViewCell
@synthesize mUiRightImage=_mUiRightImage;
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
-(void) setMData:(MddPopSelectKeyValue *)pData
{
    if (pData) {
        _mData=pData;
        //自己的怎么没有??
        //设置状态位
        self.mUiTitleLabel.text=self.mData.mTitle;
      
        if (self.mData.mIsSelected) {
            self.mUiRightImage.image=[UIImage imageNamed:kSelectImage];
        }else{
            self.mUiRightImage.image=[UIImage imageNamed:kUnSelectImage];
        }
//        //
//        self.textLabel.text=self.mData.mTitle;
//        UIImageView * img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        if (self.mData.mIsSelected) {
//            img.image=[UIImage imageNamed:kSelectImage];
//            
//
//        }else{
//           img.image=[UIImage imageNamed:kUnSelectImage];
//        }
//        [self.accessoryView addSubview:img];
    }
}


@end

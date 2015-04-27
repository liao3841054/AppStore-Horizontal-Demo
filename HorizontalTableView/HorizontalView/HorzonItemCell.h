//
//  GoodsCollectionCell.h
//  BanTang
//
//  Created by liaoyp on 15/4/13.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
@interface HorzonItemCell : UICollectionViewCell
{
    UIImageView *_mCoverView;
    UIView      *_mDescView;
    UILabel     *_mDecLabel;
    UILabel     *_mTitleLabel;
}

- (void)isFristTypeCell:(NSString *)type;
- (void)isLastTypeCell;
- (void)isNormalCell:(BaseModel *)model;

- (UIColor *)randomColor;
@end

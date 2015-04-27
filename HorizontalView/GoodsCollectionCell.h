//
//  GoodsCollectionCell.h
//  BanTang
//
//  Created by liaoyp on 15/4/13.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
@interface GoodsCollectionCell : UICollectionViewCell
{
    UIImageView *_mGoodsPic;
    UIView      *_mDescView;
    UILabel     *_mPrice;
    UILabel     *_mTitle;
}

- (void)isFristTypeCell:(NSString *)type;
- (void)isLastTypeCell;
- (void)isNormalCell:(BaseModel *)model;

- (UIColor *)randomColor;
@end

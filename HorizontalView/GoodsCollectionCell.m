//
//  GoodsCollectionCell.m
//  BanTang
//
//  Created by liaoyp on 15/4/13.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import "GoodsCollectionCell.h"
#import "UIView+ViewConstraint.h"
#import "BaseModel.h"
#import "LikeitemModel.h"

@implementation GoodsCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpView];
    }
    return self;
}

- (void)setUpView
{
    UIView *superView = self.contentView;
    _mGoodsPic = [[UIImageView alloc] initWithFrame:CGRectZero];
    _mGoodsPic.backgroundColor = RGB(245, 245, 245);
    _mGoodsPic.layer.cornerRadius =4;
    _mGoodsPic.layer.masksToBounds = YES;
    _mGoodsPic.contentMode = UIViewContentModeScaleAspectFill;
    _mGoodsPic.opaque = YES;
    [superView addSubview:_mGoodsPic];
    
    _mTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _mTitle.textAlignment = NSTextAlignmentCenter;
    _mTitle.textColor = RGB(150, 150, 150);
    _mTitle.font = [UIFont systemFontOfSize:12];
    [superView addSubview:_mTitle];
    
    _mPrice = [[UILabel alloc] initWithFrame:CGRectZero];
    _mPrice.textAlignment = NSTextAlignmentCenter;
    _mPrice.textColor = RGB(150, 150, 150);
    _mPrice.font = [UIFont systemFontOfSize:12];;
    [superView addSubview:_mPrice];
    
    
    //上面和_mGoodsPic 底部对其
    _mGoodsPic.translatesAutoresizingMaskIntoConstraints = NO;
    [_mGoodsPic addConstraint:NSLayoutAttributeTop toItem:superView targetlayoutAttribte:NSLayoutAttributeTop withValue:10];
    [_mGoodsPic addConstraint:NSLayoutAttributeWidth toItem:superView targetlayoutAttribte:NSLayoutAttributeWidth withValue:0];
    [_mGoodsPic addConstraint:NSLayoutAttributeLeading toItem:superView targetlayoutAttribte:NSLayoutAttributeLeading withValue:0];
    [_mGoodsPic addConstraintHeightWithValue:70];
    
    _mTitle.translatesAutoresizingMaskIntoConstraints = NO;
    //上面和_mGoodsPic 底部对其
    [_mTitle addConstraint:NSLayoutAttributeTop toItem:_mGoodsPic targetlayoutAttribte:NSLayoutAttributeBottom withValue:10];
    //上面和_mGoodsPic 底部对其
    [_mTitle addConstraint:NSLayoutAttributeWidth toItem:_mGoodsPic targetlayoutAttribte:NSLayoutAttributeWidth withValue:0];
    [_mTitle addConstraint:NSLayoutAttributeCenterX toItem:_mGoodsPic targetlayoutAttribte:NSLayoutAttributeCenterX withValue:0];

    _mPrice.translatesAutoresizingMaskIntoConstraints = NO;
    //上面和_mGoodsPic 底部对其
    [_mPrice addConstraint:NSLayoutAttributeTop toItem:_mTitle targetlayoutAttribte:NSLayoutAttributeBottom withValue:2];
    //上面和_mGoodsPic 底部对其
    [_mPrice addConstraint:NSLayoutAttributeWidth toItem:_mGoodsPic targetlayoutAttribte:NSLayoutAttributeWidth withValue:0];
    [_mPrice addConstraint:NSLayoutAttributeCenterX toItem:_mGoodsPic targetlayoutAttribte:NSLayoutAttributeCenterX withValue:0];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)hiddenDescView:(BOOL)hidden
{
    _mTitle.hidden = hidden;
    _mPrice.hidden = hidden;

}

- (BOOL)isEmpty:(NSString *)str
{
    return ((str == nil)||[str isKindOfClass:[NSNull class]]);
}


- (void)isFristTypeCell:(NSString *)typeName
{
    [self hiddenDescView:YES];
    
    UIImage *categateIcon = [UIImage imageNamed:typeName];
    if (categateIcon) {
        [_mGoodsPic setImage:categateIcon];
    }else
        [_mGoodsPic setImage:[UIImage imageNamed:@"center_default_category"]];
        
}

- (void)isLastTypeCell
{
    [self hiddenDescView:YES];
    [_mGoodsPic setImage:[UIImage imageNamed:@"center_item_more"]];
}


- (void)isNormalCell:(BaseModel *)model
{
    [self hiddenDescView:NO];

    LikeitemModel *likeItem = (LikeitemModel *)model;
    _mTitle.text = likeItem.title;
    
    if (![self isEmpty:likeItem.price])
    {
        _mDescView.hidden = NO;
        _mPrice.text  = likeItem.price;
        
    }else
    {
        _mPrice.hidden = YES;

    }
    _mGoodsPic.backgroundColor = [likeItem backgroundColor];
    _mGoodsPic.image = nil;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end

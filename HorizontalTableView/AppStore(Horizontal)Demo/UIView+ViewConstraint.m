//
//  UIView+ViewConstraint.m
//  AppStore(Horizontal)Demo
//
//  Created by liaoyp on 15/4/24.
//  Copyright (c) 2015年 liaoyp. All rights reserved.
//

#import "UIView+ViewConstraint.h"

@implementation UIView (ViewConstraint)


- (void)addConstraintHeightWithValue:(CGFloat)heightValue
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeHeight
                                                              multiplier:1.0
                                                                constant:heightValue]];
}

- (void)addConstraint:(NSLayoutAttribute )layoutAttribte toItem:(UIView *)toItem withValue:(CGFloat)value
{
    [self addConstraint:layoutAttribte toItem:toItem targetlayoutAttribte:layoutAttribte withValue:value];
}


- (void)addConstraint:(NSLayoutAttribute )layoutAttribte toItem:(UIView *)toItem targetlayoutAttribte:(NSLayoutAttribute )targetlayoutAttribte withValue:(CGFloat)value
{

    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:layoutAttribte
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toItem
                                                               attribute:targetlayoutAttribte
                                                              multiplier:1.0
                                                                constant:value]];
}




@end

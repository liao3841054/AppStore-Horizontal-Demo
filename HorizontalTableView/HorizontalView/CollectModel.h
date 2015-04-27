//
//  LikeitemModel.h
//  BanTang
//
//  Created by liaoyp on 15/4/15.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import "BaseModel.h"
#import <UIKit/UIKit.h>
@interface CollectModel : BaseModel
{
}
@property (nonatomic, copy) NSString *object_id;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *price;
@property(nonatomic,copy) UIColor *backgroundColor ;
@end

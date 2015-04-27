//
//  CategoryModel.h
//  BanTang
//
//  Created by liaoyp on 15/4/15.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import "BaseModel.h"

@interface CategoryModel : BaseModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *datalist;
@property (nonatomic, assign) id list;


@end

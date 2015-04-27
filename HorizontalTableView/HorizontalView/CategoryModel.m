//
//  CategoryModel.m
//  BanTang
//
//  Created by liaoyp on 15/4/15.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import "CategoryModel.h"
#import "CollectModel.h"

@implementation CategoryModel

- (void)setList:(NSArray *)list
{
    if ([list isKindOfClass:[NSArray class]]) {
        
        if (list.count > 0) {
            NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:list.count];
            [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//                LikeitemModel *model = [[LikeitemModel alloc] initWithDictionary:obj];
//                [tempArray addObject:model];
            }];
            _datalist = tempArray;
        }
    }
}
@end

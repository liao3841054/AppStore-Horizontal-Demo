//
//  CenterTableView.h
//  BanTang
//
//  Created by liaoyp on 15/4/13.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalScrollCell.h"
#import "HorizontalScrollCellDeleagte.h"

typedef NS_ENUM(NSUInteger, CenterTableViewType) {
    CenterTableViewTopic,
    CenterTableViewGoods,
};

@protocol HorizontalTableViewDelegate <NSObject>

- (void)horizontalTableView:(CenterTableViewType)type didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;

@end

@interface HorizonScrollTableView : UIView<UITableViewDataSource,UITableViewDelegate,HorizontalScrollCellDeleagte>
{

}
- (instancetype)initWithFrame:(CGRect)frame withType:(CenterTableViewType )type;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) CenterTableViewType type;

@property (nonatomic, weak) id<HorizontalTableViewDelegate> delegate;

@end

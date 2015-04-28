//
//  CenterTableView.m
//  BanTang
//
//  Created by liaoyp on 15/4/13.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import "HorizonScrollTableView.h"
#import "HorzonItemCell.h"
#import "CategoryModel.h"
#import "CollectModel.h"
//#import "CenterEmptyView.h"

 NSString *const cellIdentifier = @"HorzonItemCell";

@interface HorizonScrollTableView()
{
//    CenterEmptyView *_emptyView;
}
@end

@implementation HorizonScrollTableView

- (instancetype)initWithFrame:(CGRect)frame withType:(CenterTableViewType )type
{
    self = [super initWithFrame:frame];
    if (self) {
        _type = type;
        [self setUpTableView];
    }
    return self;
}

- (void)setUpTableView
{
    CGRect rect  =self.bounds;
    _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundView = nil;
    [_tableView registerClass:[HorizontalScrollCell class] forCellReuseIdentifier:cellIdentifier];
    [self addSubview:_tableView];
}

- (void)setDataSource:(NSMutableArray *)dataSource
{
     _dataSource = dataSource;
    [_tableView removeFromSuperview];
    [self setUpTableView];
    
    if ([_dataSource count] == 0) {
//        CenterEmptyView *emptyView = [[CenterEmptyView alloc] initWithFrame:CGRectZero];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.tableFooterView = emptyView;
    }else
    {
        _tableView.tableFooterView = nil;
    }
}

#pragma mark -
#pragma mark TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height =140;
    if (_type == CenterTableViewTopic) {
        return height - 20;
    }
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HorizontalScrollCell *_centerCell;
    _centerCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    _centerCell.delegate =self;
    _centerCell.tableViewIndexPath = indexPath;
    return _centerCell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[HorizontalScrollCell class]]) {
        
        [(HorizontalScrollCell *)cell reloadData];
    }
}

#pragma mark - ASOXScrollTableViewCellDelegate

- (NSInteger)horizontalCellContentsView:(UICollectionView *)horizontalCellContentsView numberOfItemsInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath{
    
//    CategoryModel *category = [_dataSource objectAtIndex:tableViewIndexPath.row];
//    NSInteger count = category.datalist.count;
    NSInteger count = 5;
    if (count > 4) {
        return count +2;
    }
    return count +1;
}

- (UICollectionViewCell *)horizontalCellContentsView:(UICollectionView *)horizontalCellContentsView cellForItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath{
    
    HorzonItemCell *cell;
    {
        cell = (HorzonItemCell *)[horizontalCellContentsView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:contentIndexPath];
    }
    CategoryModel *category = [_dataSource objectAtIndex:tableViewIndexPath.row];
    if (contentIndexPath.row == 0 || contentIndexPath.row ==6 ) {
        if (contentIndexPath.row == 0) {
            
            [cell isFristTypeCell:category.name];
        }else
        {
            [cell isLastTypeCell];
        }
    }else
    {
        if (category.datalist.count > 0) {
            if ((contentIndexPath.row-1) < category.datalist.count) {
                CollectModel *item = [category.datalist objectAtIndex:contentIndexPath.row-1];
                if (item) {
                    [cell isNormalCell:item];
                }
                [cell isNormalCell:item];

            }
        }
    }
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view  =[UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (CGFloat)tableViewHeightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    if (_type == CenterTableViewTopic) {
        return 140 - 20;
    }
    return 140;
}

- (CGSize)horizontalCellContentsView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize = CGSizeMake(70, 140);
    if (_type == CenterTableViewTopic) {
        itemSize.width = 312/2;
        itemSize.height = itemSize.height-20;
    }else
    {
        itemSize.width = 70;
    }
    if (indexPath.row == 0 ||indexPath.row == 6) {
        return CGSizeMake(70, itemSize.height);
    }
    return itemSize;
}

- (void)horizontalCellContentsView:(UICollectionView *)horizontalCellContentsView didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath
{
    [horizontalCellContentsView deselectItemAtIndexPath:contentIndexPath animated:YES]; // A custom behaviour in this example for removing highlight from the cell immediately after it had been selected
    
    NSLog(@"Section %ld Row %ld Item %ld is selected", (unsigned long)tableViewIndexPath.section, (unsigned long)tableViewIndexPath.row, (unsigned long)contentIndexPath.item);

    // 跳转界面
    if ([_delegate respondsToSelector:@selector(horizontalTableView:didSelectItemAtContentIndexPath:inTableViewIndexPath:)]) {
        
        [_delegate horizontalTableView:_type didSelectItemAtContentIndexPath:contentIndexPath inTableViewIndexPath:tableViewIndexPath];
    }
}

@end

//
//  CenterCell.h
//  BanTang
//
//  Created by liaoyp on 15/4/22.
//  Copyright (c) 2015年 JiuZhouYunDong. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "HorizontalScrollCellDeleagte.h"

@interface HorizontalScrollCell : BaseTableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>
{

}
@property(nonatomic ,strong)UICollectionView *collectionView;

@property (weak, nonatomic) id <HorizontalScrollCellDeleagte> delegate;

///**
// Control the Collection View of all Content Cells in each horizontally scrolled row
// */
//@property (strong, nonatomic) UICollectionView *horizontalScrollContentsView;
//
///**
// Set the content cell Class Name
// */
//@property (weak, nonatomic) NSString *contentCellClass;
//
///**
// Tell the size of Content Cell frame.
// Read-only property.
// */
//@property (nonatomic, readonly) CGSize contentCellSize;
//
///**
// Store the table-view index path where each ASOXScrollTableViewCell object is attached to.
// */
@property (strong, nonatomic) NSIndexPath *tableViewIndexPath;


- (void)reloadData;

@end

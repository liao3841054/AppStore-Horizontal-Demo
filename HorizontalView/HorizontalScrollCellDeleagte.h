//
//  HorizontalCellDeleagte.h
//  AppStore(Horizontal)Demo 参考的是ASOXScrollTableViewDelegate
//
//  Created by liaoyp on 15/4/24.
//  Copyright (c) 2015年 liaoyp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HorizontalScrollCellDeleagte <NSObject>

@optional

/**
 Set the number of items in each horizontally scrolled row.
 
 @param horizontalCellContentsView The Collection View of all Content Cells in each horizontally scrolled row.
 @param tableViewIndexPath The index path of HorizontalCell object related to its position in the tableView.
 
 @return Returns the number of item in the specified tableViewIndexPath.
 
 */
- (NSInteger)horizontalCellContentsView:(UICollectionView *)horizontalCellContentsView numberOfItemsInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;

/**
 Configure each item in the content-cell.
 
 @param horizontalCellContentsView The Collection View of all Content Cells in each horizontally scrolled row.
 @param contentIndexPath The index path of content-cell object related to its position in the horizontalCellContentsView.
 @param tableViewIndexPath The index path of HorizontalCell object related to its position in the tableView.
 
 @return Content-cell object
 */
- (UICollectionViewCell *)horizontalCellContentsView:(UICollectionView *)horizontalCellContentsView cellForItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;


- (CGSize)horizontalCellContentsView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 Manage the item selection.
 
 @param horizontalCellContentsView The Collection View of all Content Cells in each horizontally scrolled row.
 @param contentIndexPath The index path of content-cell object related to its position in the horizontalCellContentsView.
 @param tableViewIndexPath The index path of HorizontalCell object related to its position in the tableView.
 */
- (void)horizontalCellContentsView:(UICollectionView *)horizontalCellContentsView didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;


- (CGFloat)tableViewHeightForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

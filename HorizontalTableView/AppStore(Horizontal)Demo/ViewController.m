//
//  ViewController.m
//  AppStore(Horizontal)Demo
//
//  Created by liaoyp on 15/4/24.
//  Copyright (c) 2015年 liaoyp. All rights reserved.
//

#import "ViewController.h"
#import "HorizonScrollTableView.h"
#import "CategoryModel.h"
#import "LikeitemModel.h"

#import "DetailViewCtroller.h"

#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define AFTER(time, block)  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC), dispatch_get_main_queue(), block);



@interface ViewController ()<HorizontalTableViewDelegate>
{
    NSMutableArray *_dataSource;
    
    HorizonScrollTableView *_horizonTableView;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *mSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpHorizontalScrollView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self mSegmentAction:_mSegmentControl];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (NSMutableArray *)loadDataByType:(CenterTableViewType )type;
{

    NSArray *nameArray = @[@"办公",@"厨具",@"创意",@"护肤",@"家居",@"美食",@"数码",@"卫浴",@"运动",@"杂货",@"植物",@"主题"];
    
    NSMutableArray *colorArray = [NSMutableArray arrayWithCapacity:10];
    for (int i =0; i< 5; i++) {
        [colorArray addObject:[self randomColor]];
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    [nameArray enumerateObjectsUsingBlock:^(NSString *objname, NSUInteger idx, BOOL *stop) {
        CategoryModel *categoty = [[CategoryModel alloc] init];
        categoty.name = objname;
        
        NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0 ; i< 5; i++) {
            LikeitemModel *item = [[LikeitemModel alloc] init];
            item.title = [NSString stringWithFormat:@"%@--(%ld)",objname,i*idx];
            if (type != CenterTableViewTopic) {
                item.price = [NSString stringWithFormat:@"￥%ld",(i+1)*(idx+1)*2];
            }
            item.backgroundColor = colorArray[i];
            [itemArray addObject:item];
        }
        categoty.datalist = itemArray;
        [array addObject:categoty];
    }];
    return  array;
   
}
- (void)setUpHorizontalScrollView
{
    
//    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 256/2)];
//    topView.contentMode = UIViewContentModeScaleAspectFill;
//    topView.backgroundColor = [UIColor lightGrayColor];
//    NSString *imageUrl = @"https://drscdn.500px.org/photo/22693353/m%3D1170/de1920228d792736a3bc3e7414332691";
//   
//    __weak typeof(UIImageView *)weakSelf = topView;
//    BACK(^{
//        UIImage *image =     [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
//        if (image) {
//            MAIN(^{
//                weakSelf.image = image;
//            });
//        }
//    });
//    [self.view addSubview:topView];
    //CGRectMake(0, 256/2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 256/2)
    _horizonTableView = [[HorizonScrollTableView alloc] initWithFrame: CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64)];
     _horizonTableView.delegate = self;
    [self.view addSubview:_horizonTableView];
}

- (IBAction)mSegmentAction:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0 ) {
    
        _horizonTableView.dataSource = [self loadDataByType:CenterTableViewGoods];
        _horizonTableView.type = CenterTableViewGoods;

    }else
    {
        _horizonTableView.dataSource  = [self loadDataByType:CenterTableViewTopic];
        _horizonTableView.type = CenterTableViewTopic;
    }
}


#pragma mark - 
#pragma mark - HorizontalTableViewDelegate
- (void)horizontalTableView:(CenterTableViewType)type didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath
{
    if (contentIndexPath.row == 0 || contentIndexPath.row ==6 ) {
        
        if (type == CenterTableViewTopic)
        {
            // 跳转的主题列表
            
        }else
        {
            //跳转的主题单品列表
        }
    }else
    {
        DetailViewCtroller *detailVC = [[DetailViewCtroller alloc] init];
        CategoryModel *model = _dataSource[tableViewIndexPath.row];
        LikeitemModel *likeModel =  model.datalist[contentIndexPath.row];
        detailVC.title = likeModel.title;
        detailVC.view.backgroundColor = likeModel.backgroundColor;
        [self.navigationController pushViewController:detailVC animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

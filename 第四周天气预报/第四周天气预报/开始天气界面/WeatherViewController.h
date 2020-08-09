//
//  WeatherViewController.h
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/4.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class cityweather;
@interface WeatherViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) UIScrollView *sv;
@property (nonatomic,strong) UIPageControl *pc;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *cityNumber;
@property (nonatomic) NSMutableArray *cell1Array;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray *timehourArray;
@property (nonatomic) NSMutableArray *tmphourArray;
@property (nonatomic) NSMutableArray *weahourArray;


@property (nonatomic,strong)UILabel *labelcity;


@end

NS_ASSUME_NONNULL_END

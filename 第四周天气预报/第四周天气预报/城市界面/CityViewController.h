//
//  CityViewController.h
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/4.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Add2ViewController.h"
#import "WeatherViewController.h"
#import "CityTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@class cityweather;

@interface CityViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CityViewControllerDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *nameArray;
@property (nonatomic,strong)NSMutableArray *tmpArray;
@property (nonatomic,strong)NSMutableArray *timeArray;
@property (nonatomic,strong)NSMutableDictionary *tmpDictionary;
@property (nonatomic,strong)NSMutableDictionary *timeDictionary;
@property (nonatomic,strong)NSMutableArray *hourtimeArray;
@property (nonatomic,strong)NSMutableArray *hourtmpArray;
@property (nonatomic,strong)NSMutableArray *hourweaArray;



@property (nonatomic,strong)NSMutableArray *arraycell1;


@end

NS_ASSUME_NONNULL_END

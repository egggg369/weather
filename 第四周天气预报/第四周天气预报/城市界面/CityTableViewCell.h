//
//  CityTableViewCell.h
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/5.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *labeltime;
@property (nonatomic,strong) UILabel *labelname;
@property (nonatomic,strong) UILabel *labeltmp;

@end

NS_ASSUME_NONNULL_END

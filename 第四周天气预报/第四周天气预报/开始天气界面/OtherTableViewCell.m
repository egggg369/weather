//
//  OtherTableViewCell.m
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/7.
//  Copyright © 2020 无. All rights reserved.
//

#import "OtherTableViewCell.h"

@implementation OtherTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"cell4"]) {
        _labelsunr = [[UILabel alloc]init];
        //_labelsunr.frame = CGRectMake(10,0, 400, 90);
        _labelsunr.font = [UIFont systemFontOfSize:25];
        _labelsunr.textColor = [UIColor whiteColor];
        _labelsunr.numberOfLines = 0;
        [self.contentView addSubview:self.labelsunr];
        
        _labelsuns = [[UILabel alloc]init];
               //_labelsuns.frame = CGRectMake(205,0, 400, 90);
               _labelsuns.font = [UIFont systemFontOfSize:25];
               _labelsuns.textColor = [UIColor whiteColor];
               _labelsuns.numberOfLines = 0;
               [self.contentView addSubview:self.labelsuns];
        
        _labelvis = [[UILabel alloc]init];
               //_labelvis.frame = CGRectMake(10,100, 400, 90);
               _labelvis.font = [UIFont systemFontOfSize:25];
               _labelvis.textColor = [UIColor whiteColor];
               _labelvis.numberOfLines = 0;
                [self.contentView addSubview:self.labelvis];
    
        _labelhum = [[UILabel alloc]init];
               //_labelhum.frame = CGRectMake(205,100, 400, 90);
               _labelhum.font = [UIFont systemFontOfSize:25];
               _labelhum.textColor = [UIColor whiteColor];
               _labelhum.numberOfLines = 0;
               [self.contentView addSubview:self.labelhum];
        
        _labelairlevel = [[UILabel alloc]init];
              // _labelairlevel.frame = CGRectMake(10,200, 400, 90);
               _labelairlevel.font = [UIFont systemFontOfSize:25];
               _labelairlevel.textColor = [UIColor whiteColor];
               _labelairlevel.numberOfLines = 0;
               [self.contentView addSubview:self.labelairlevel];
        
        _labelpre = [[UILabel alloc]init];
               //_labelpre.frame = CGRectMake(205,200, 400, 90);
               _labelpre.font = [UIFont systemFontOfSize:25];
               _labelpre.textColor = [UIColor whiteColor];
               _labelpre.numberOfLines = 0;
               [self.contentView addSubview:self.labelpre];
        
        _labelwinmeter = [[UILabel alloc]init];
               //_labelwinmeter.frame = CGRectMake(10,300, 400, 90);
               _labelwinmeter.font = [UIFont systemFontOfSize:25];
               _labelwinmeter.textColor = [UIColor whiteColor];
               _labelwinmeter.numberOfLines = 0;
               [self.contentView addSubview:self.labelwinmeter];
        
        _labelwinspeed = [[UILabel alloc]init];
               //_labelwinspeed.frame = CGRectMake(205,300, 400, 90);
               _labelwinspeed.font = [UIFont systemFontOfSize:25];
               _labelwinspeed.textColor = [UIColor whiteColor];
               _labelwinspeed.numberOfLines = 0;
               [self.contentView addSubview:self.labelwinspeed];
        
        _labelsunr1 = [[UILabel alloc] init];
        [self.contentView addSubview:_labelsunr1];
        _labelsunr1.textColor = [UIColor whiteColor];
        _labelsunr1.text = @"日出时间";
        
        _labelsuns1 = [[UILabel alloc] init];
        [self.contentView addSubview:_labelsuns1];
        _labelsuns1.textColor = [UIColor whiteColor];
        _labelsuns1.text = @"日落时间";
        
        _labelairlevel1 = [[UILabel alloc] init];
        [self.contentView addSubview:_labelairlevel1];
        _labelairlevel1.textColor = [UIColor whiteColor];
        _labelairlevel1.text = @"空气质量";
        
        _labelpre1 = [[UILabel alloc] init];
        [self.contentView addSubview:_labelpre1];
        _labelpre1.textColor = [UIColor whiteColor];
        _labelpre1.text = @"压强";
        
        _labelwinspeed1 = [[UILabel alloc] init];
        [self.contentView addSubview:_labelwinspeed1];
        _labelwinspeed1.textColor = [UIColor whiteColor];
        _labelwinspeed1.text = @"风速等级";
        
        _labelwinmeter1= [[UILabel alloc] init];
        [self.contentView addSubview:_labelwinmeter1];
        _labelwinmeter1.textColor = [UIColor whiteColor];
        _labelwinmeter1.text = @"风速";
        
        _labelvis1= [[UILabel alloc] init];
        _labelvis1.font = [UIFont systemFontOfSize:17];
        _labelvis1.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_labelvis1];
        _labelvis1.text = @"能见度";
        
        _labelhum1 = [[UILabel alloc] init];
        [self.contentView addSubview:_labelhum1];
        _labelhum1.textColor = [UIColor whiteColor];
        _labelhum1.text = @"湿度";
        
    }
    return self;
}

- (void)layoutSubviews
{
    _labelsunr.frame = CGRectMake(10,10, 400, 90);
    _labelsunr1.frame = CGRectMake(10,5, 400, 30);
    _labelsuns.frame = CGRectMake(215,10, 400, 90);
    _labelsuns1.frame = CGRectMake(215,5, 400, 30);
    _labelvis.frame = CGRectMake(10,110, 400, 90);
    _labelvis1.frame = CGRectMake(10,95, 400, 30);
    _labelhum.frame = CGRectMake(215,110, 400, 90);
    _labelhum1.frame = CGRectMake(215,95, 400, 30);
    _labelairlevel.frame = CGRectMake(10,210, 400, 90);
    _labelairlevel1.frame = CGRectMake(10,200, 400, 30);
    _labelpre.frame = CGRectMake(215,210, 400, 90);
    _labelpre1.frame = CGRectMake(215,200, 400, 30);
    _labelwinmeter.frame = CGRectMake(10,310, 400, 90);
    _labelwinmeter1.frame = CGRectMake(10,300, 400, 30);
    _labelwinspeed.frame = CGRectMake(215,310, 400, 90);
    _labelwinspeed1.frame = CGRectMake(215,300, 400, 30);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

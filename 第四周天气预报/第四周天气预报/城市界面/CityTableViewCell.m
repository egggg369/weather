//
//  CityTableViewCell.m
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/5.
//  Copyright © 2020 无. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        _labeltime = [[UILabel alloc] init];
        _labeltime.textColor = [UIColor whiteColor];
        _labeltime.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_labeltime];
        
        _labelname = [[UILabel alloc] init];
        _labelname.textColor = [UIColor whiteColor];
        _labelname.font = [UIFont systemFontOfSize:27];
        [self.contentView addSubview:_labelname];
        
        _labeltmp= [[UILabel alloc] init];
        _labeltmp.textColor = [UIColor whiteColor];
        _labeltmp.font = [UIFont systemFontOfSize:52];
        [self.contentView addSubview:_labeltmp];
        
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    _labeltime.frame = CGRectMake(20, 19, 200, 15);
    _labelname.frame = CGRectMake(20, 41, 280, 24);
    _labeltmp.frame = CGRectMake(310, 20, 86, 44);
    
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

//
//  DayTableViewCell.m
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/7.
//  Copyright © 2020 无. All rights reserved.
//

#import "DayTableViewCell.h"

@implementation DayTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"cell2"]) {
        _labeltime1 = [[UILabel alloc]init];
        _labeltime1.font = [UIFont systemFontOfSize:25];
        _labeltime1.textColor = [UIColor whiteColor];
        _labeltime1.numberOfLines = 0;
        [self.contentView addSubview:self.labeltime1];
        
        _labeltmp1 = [[UILabel alloc]init];
        _labeltmp1.font = [UIFont systemFontOfSize:25];
        _labeltmp1.textColor = [UIColor whiteColor];
        _labeltmp1.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmp1];
        
        _labeltmp2 = [[UILabel alloc]init];
        _labeltmp2.font = [UIFont systemFontOfSize:25];
        _labeltmp2.textColor = [UIColor whiteColor];
        _labeltmp2.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmp2];
        
        
        _labeltime2 = [[UILabel alloc]init];
        _labeltime2.font = [UIFont systemFontOfSize:25];
        _labeltime2.textColor = [UIColor whiteColor];
        _labeltime2.numberOfLines = 0;
        [self.contentView addSubview:self.labeltime2];
        
        _labeltmphigh2 = [[UILabel alloc]init];
        _labeltmphigh2.font = [UIFont systemFontOfSize:25];
        _labeltmphigh2.textColor = [UIColor whiteColor];
        _labeltmphigh2.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmphigh2];
        
        _labeltmplow2 = [[UILabel alloc]init];
        _labeltmplow2.font = [UIFont systemFontOfSize:25];
        _labeltmplow2.textColor = [UIColor whiteColor];
        _labeltmplow2.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmplow2];
        
        _labeltime3 = [[UILabel alloc]init];
        _labeltime3.font = [UIFont systemFontOfSize:25];
        _labeltime3.textColor = [UIColor whiteColor];
        _labeltime3.numberOfLines = 0;
        [self.contentView addSubview:self.labeltime3];
        
        _labeltmphigh3 = [[UILabel alloc]init];
        _labeltmphigh3.font = [UIFont systemFontOfSize:25];
        _labeltmphigh3.textColor = [UIColor whiteColor];
        _labeltmphigh3.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmphigh3];
        
        _labeltmplow3 = [[UILabel alloc]init];
        _labeltmplow3.font = [UIFont systemFontOfSize:25];
        _labeltmplow3.textColor = [UIColor whiteColor];
        _labeltmplow3.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmplow3];
        
        _labeltime4 = [[UILabel alloc]init];
        _labeltime4.font = [UIFont systemFontOfSize:25];
        _labeltime4.textColor = [UIColor whiteColor];
        _labeltime4.numberOfLines = 0;
        [self.contentView addSubview:self.labeltime4];
        
        _labeltmphigh4 = [[UILabel alloc]init];
        _labeltmphigh4.font = [UIFont systemFontOfSize:25];
        _labeltmphigh4.textColor = [UIColor whiteColor];
        _labeltmphigh4.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmphigh4];
        
        _labeltmplow4 = [[UILabel alloc]init];
        _labeltmplow4.font = [UIFont systemFontOfSize:25];
        _labeltmplow4.textColor = [UIColor whiteColor];
        _labeltmplow4.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmplow4];
        
        _labeltime5 = [[UILabel alloc]init];
        _labeltime5.font = [UIFont systemFontOfSize:25];
        _labeltime5.textColor = [UIColor whiteColor];
        _labeltime5.numberOfLines = 0;
        [self.contentView addSubview:self.labeltime5];
        
        _labeltmphigh5 = [[UILabel alloc]init];
        _labeltmphigh5.font = [UIFont systemFontOfSize:25];
        _labeltmphigh5.textColor = [UIColor whiteColor];
        _labeltmphigh5.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmphigh5];
        
        _labeltmplow5 = [[UILabel alloc]init];
        _labeltmplow5.font = [UIFont systemFontOfSize:25];
        _labeltmplow5.textColor = [UIColor whiteColor];
        _labeltmplow5.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmplow5];
        
        _labeltime6 = [[UILabel alloc]init];
        _labeltime6.font = [UIFont systemFontOfSize:25];
        _labeltime6.textColor = [UIColor whiteColor];
        _labeltime6.numberOfLines = 0;
        [self.contentView addSubview:self.labeltime6];
        
        _labeltmphigh6 = [[UILabel alloc]init];
        _labeltmphigh6.font = [UIFont systemFontOfSize:25];
        _labeltmphigh6.textColor = [UIColor whiteColor];
        _labeltmphigh6.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmphigh6];
        
        _labeltmplow6 = [[UILabel alloc]init];
        _labeltmplow6.font = [UIFont systemFontOfSize:25];
        _labeltmplow6.textColor = [UIColor whiteColor];
        _labeltmplow6.numberOfLines = 0;
        [self.contentView addSubview:self.labeltmplow6];
        
        _imageView1 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView1];
        
        _imageView2 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView2];
        _imageView3 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView3];
        _imageView4 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView4];
        _imageView5 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView5];
        _imageView6 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView6];
    }
    return self;
}


- (void)layoutSubviews
{
    _labeltime1.frame = CGRectMake(20, 5, 100, 40);
    _labeltmp1.frame = CGRectMake(290, 5, 60, 40);
    _labeltmp2.frame = CGRectMake(350, 5, 60, 40);
    
    _labeltime2.frame = CGRectMake(20, 45, 100, 40);
    _labeltmphigh2.frame = CGRectMake(290, 45, 60, 40);
    _labeltmplow2.frame = CGRectMake(350, 45, 60, 40);
    
    _labeltime3.frame = CGRectMake(20, 90, 100, 40);
    _labeltmphigh3.frame = CGRectMake(290, 90, 60, 40);
    _labeltmplow3.frame = CGRectMake(350, 90, 60, 40);
    
    _labeltime4.frame = CGRectMake(20, 135, 100, 40);
    _labeltmphigh4.frame = CGRectMake(290, 135, 60, 40);
    _labeltmplow4.frame = CGRectMake(350, 135, 60, 40);
    
    _labeltime5.frame = CGRectMake(20, 180, 100, 40);
    _labeltmphigh5.frame = CGRectMake(290, 180, 60, 40);
    _labeltmplow5.frame = CGRectMake(350, 180, 60, 40);
    
    _labeltime6.frame = CGRectMake(20, 225, 100, 40);
    _labeltmphigh6.frame = CGRectMake(290, 225, 60, 40);
    _labeltmplow6.frame = CGRectMake(350, 225, 60, 40);
    
    _imageView1.frame = CGRectMake(160, 7, 35, 35);
    _imageView2.frame = CGRectMake(160, 47, 35, 35);
    _imageView3.frame = CGRectMake(160, 92, 35, 35);
    _imageView4.frame = CGRectMake(160, 137, 35, 35);
    _imageView5.frame = CGRectMake(160, 182, 35, 35);
    _imageView6.frame = CGRectMake(160, 227, 35, 35);
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

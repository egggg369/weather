//
//  WeatherViewController.m
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/4.
//  Copyright © 2020 无. All rights reserved.
//

#import "WeatherViewController.h"

#import "CityViewController.h"
#import "DayTableViewCell.h"
#import "OtherTableViewCell.h"
#import "cityweather.h"
#import "ScollerView.h"
@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backgroundImage = [UIImage imageNamed:@"背景1.jpg"];
    self.view.layer.contents = (id)backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
    //underView.backgroundColor = [UIColor blackColor];
    self.view.layer.contents = (id)backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(self.view.frame.size.width - 50, /*self.view.frame.size.height - 50*/ 10, 40, 40);
    [btn setImage:[UIImage imageNamed:@"进入城市界面按钮"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:underView];
    [underView addSubview:btn];
    
    //初始化传值数组
    if(_cityNumber == nil) {
        _cityNumber = [[NSMutableArray alloc]init];
    }

    _sv = [[UIScrollView alloc] init];
    _sv.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60);
    _sv.pagingEnabled = YES;
    _sv.scrollEnabled = YES;
    _sv.showsHorizontalScrollIndicator = NO;
    _sv.contentOffset = CGPointMake(self.view.frame.size.width * self.page, 0);
    _sv.contentSize = CGSizeMake(self.view.frame.size.width * _cityNumber.count, 0);
    _sv.delegate = self;
    _sv.backgroundColor = [UIColor clearColor];
//    for (int i = 0; i < _cityNumber.count; i++) {
//        ScollerTableView *scollerTableView = [[ScollerTableView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
//
//
//        [_sv addSubview:scollerTableView];
//    }
    [self.view addSubview:_sv];

    _pc = [[UIPageControl alloc] initWithFrame:CGRectMake(30, 20, 300, 30)];
    _pc.backgroundColor = [UIColor clearColor];
    _pc.numberOfPages = _cityNumber.count;
    _pc.currentPage = self.page;
    _pc.currentPageIndicatorTintColor = [UIColor whiteColor];
    [_pc addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [underView addSubview:_pc];
    
    for(int i = 0; i < _cityNumber.count; i++) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(414 * i, 0, 414, self.view.frame.size.height-70) style:UITableViewStylePlain];
        [_tableView registerClass:[DayTableViewCell class] forCellReuseIdentifier:@"cell2"];
        [_tableView registerClass:[OtherTableViewCell class] forCellReuseIdentifier:@"cell4"];
        _tableView.tag = i;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_sv addSubview:_tableView];
    }
    
    if(_cell1Array == nil) {
        _cell1Array = [[NSMutableArray alloc]init];
    }
    if(_timehourArray == nil) {
        _timehourArray = [[NSMutableArray alloc]init];
    }
    if(_tmphourArray == nil) {
        _tmphourArray = [[NSMutableArray alloc]init];
    }
    if(_weahourArray == nil) {
        _weahourArray = [[NSMutableArray alloc]init];
    }
    
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        return 300;
    }else if(indexPath.row  == 1){
        return 140;
    }else if(indexPath.row == 2) {
        return 270;
    }else if(indexPath.row == 3) {
        return 90;
    }
    return 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    for(int i = 0; i < _cell1Array.count;i++) {
        if(tableView.tag == i) {
            cityweather *big = [[cityweather alloc] init];
            big = _cell1Array[i];
            if(indexPath.row == 0) {
                    UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
                    if(cell0 == nil) {
                        cell0 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell0"];
//                        cityweather *big = [[cityweather alloc] init];
//                        big = _cell1Array[0];
                        NSLog(@"big = %@", big);
                        cell0.backgroundColor = [UIColor clearColor];
                        cell0.contentView.backgroundColor = [UIColor clearColor];
                        UILabel *labelcity = [[UILabel alloc] init];
                        labelcity.frame = CGRectMake(180,30, 100, 60);
                        labelcity.font = [UIFont systemFontOfSize:30];
                        labelcity.textColor = [UIColor whiteColor];
                        labelcity.text = big.cityname;
                        NSLog(@"big.cityname = %@",big.cityname);
                        self.labelcity.text = [_cell1Array[indexPath.row] cityname];
                        
                        [cell0.contentView addSubview:labelcity];
                        
                        
                        UILabel *labelweather = [[UILabel alloc] init];
                        labelweather.frame = CGRectMake(180,80, 200, 30);
                        labelweather.font = [UIFont systemFontOfSize:18];
                        labelweather.textColor = [UIColor whiteColor];
                        labelweather.text = big.cityweather2;
                        NSLog(@"big.cityweather2 = %@",big.cityweather2);
                        [cell0.contentView addSubview:labelweather];
                        
                        UILabel *labeltemp = [[UILabel alloc] init];
                        labeltemp.frame = CGRectMake(165,120, 200, 100);
                        labeltemp.font = [UIFont systemFontOfSize:100];
                        labeltemp.textColor = [UIColor whiteColor];
                        labeltemp.text = big.citytemp;
                        NSLog(@"big.cityweather2 = %@",big.citytemp);
                        [cell0.contentView addSubview:labeltemp];
                        
                        UILabel *labeltemp1 = [[UILabel alloc] init];
                        labeltemp1.frame = CGRectMake(290,255, 50, 50);
                        labeltemp1.font = [UIFont systemFontOfSize:25];
                        labeltemp1.textColor = [UIColor whiteColor];
                        labeltemp1.text = big.citytemp1;
                        NSLog(@"big.cityweather2 = %@",big.citytemp1);
                        [cell0.contentView addSubview:labeltemp1];
                        
                        UILabel *labeltemp2 = [[UILabel alloc] init];
                        labeltemp2.frame = CGRectMake(350,255, 50, 50);
                        labeltemp2.font = [UIFont systemFontOfSize:25];
                        labeltemp2.textColor = [UIColor whiteColor];
                        labeltemp2.text = big.citytemp2;
                        NSLog(@"big.cityweather2 = %@",big.citytemp2);
                        [cell0.contentView addSubview:labeltemp2];
                        
                        UILabel *labelweek = [[UILabel alloc] init];
                        labelweek.frame = CGRectMake(50,255, 100, 50);
                        labelweek.font = [UIFont systemFontOfSize:23];
                        labelweek.textColor = [UIColor whiteColor];
                        labelweek.text = big.cityweek;
                        NSLog(@"big.cityweather2 = %@",big.cityweek);
                        [cell0.contentView addSubview:labelweek];
                    }
                    return cell0;
                }
            else if(indexPath.row == 1){
                    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
                    if(cell1 == nil){
                        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
                        cell1.backgroundColor = [UIColor clearColor];
                        cell1.contentView.backgroundColor = [UIColor clearColor];
                                    
                        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 153)];
                        _scrollView.contentSize = CGSizeMake(90*11, 0);
                        _scrollView.bounces = NO;
                        _scrollView.showsHorizontalScrollIndicator = NO;
                        _scrollView.backgroundColor = [UIColor clearColor];
                        for (int i = 0; i < 11; i++) {
                            ScollerView *scollerView = [[ScollerView alloc] initWithFrame:CGRectMake(90*i, 0, 90, 153)];
                            scollerView.tag = i;
                            
                            [_scrollView addSubview:scollerView];
                            
                        }
                        [cell1.contentView addSubview:_scrollView];
                    }
                int i = 0;
                for (ScollerView *scollerView in [_scrollView subviews]) {
                    if (i > 10) {
                        break;
                    }
                    //NSLog(@"scoller.tag = %@",_timehourArray[scollerView.tag]);
                    scollerView.label.text = self.timehourArray[scollerView.tag];
                    UIImage *image = [UIImage imageNamed:self.weahourArray[scollerView.tag]];
                    scollerView.imageView.image = image;
                    scollerView.label1.text = self.tmphourArray[scollerView.tag];
                    i++;
                }
                    return cell1;
                }
            else if(indexPath.row == 2) {
                    DayTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
                    cell2.backgroundColor = [UIColor clearColor];
                    cell2.contentView.backgroundColor = [UIColor clearColor];
//                cityweather *big = [[cityweather alloc] init];
//                big = _cell1Array[0];
                NSLog(@"%@", big.cell2time1);
                cell2.labeltime1.text = big.cell2time1;
                [cell2.contentView addSubview:cell2.labeltime1];
                cell2.labeltmp1.text = big.cell2tmphigh1;
                [cell2.contentView addSubview:cell2.labeltmp1];
                cell2.labeltmp2.text = big.cell2tmplow1;
                [cell2.contentView addSubview:cell2.labeltmp2];
                
                cell2.labeltime2.text = big.cell2time2;
                [cell2.contentView addSubview:cell2.labeltime2];
                cell2.labeltmphigh2.text = big.cell2tmphigh2;
                [cell2.contentView addSubview:cell2.labeltmphigh2];
                cell2.labeltmplow2.text = big.cell2tmplow2;
                [cell2.contentView addSubview:cell2.labeltmplow2];
                
                cell2.labeltime3.text = big.cell2time3;
                [cell2.contentView addSubview:cell2.labeltime3];
                cell2.labeltmphigh3.text = big.cell2tmphigh3;
                [cell2.contentView addSubview:cell2.labeltmphigh3];
                cell2.labeltmplow3.text = big.cell2tmplow3;
                [cell2.contentView addSubview:cell2.labeltmplow3];
                
                cell2.labeltime4.text = big.cell2time4;
                [cell2.contentView addSubview:cell2.labeltime4];
                cell2.labeltmphigh4.text = big.cell2tmphigh4;
                [cell2.contentView addSubview:cell2.labeltmphigh4];
                cell2.labeltmplow4.text = big.cell2tmplow4;
                [cell2.contentView addSubview:cell2.labeltmplow4];
                
                cell2.labeltime5.text = big.cell2time5;
                [cell2.contentView addSubview:cell2.labeltime5];
                cell2.labeltmphigh5.text = big.cell2tmphigh5;
                [cell2.contentView addSubview:cell2.labeltmphigh5];
                cell2.labeltmplow5.text = big.cell2tmplow5;
                [cell2.contentView addSubview:cell2.labeltmplow5];
                
                cell2.labeltime6.text = big.cell2time6;
                [cell2.contentView addSubview:cell2.labeltime6];
                cell2.labeltmphigh6.text = big.cell2tmphigh6;
                [cell2.contentView addSubview:cell2.labeltmphigh6];
                cell2.labeltmplow6.text = big.cell2tmplow6;
                [cell2.contentView addSubview:cell2.labeltmplow6];
                
                //NSString *str = [NSString stringWithFormat:@"%@.png",big.cell2pic1];
                cell2.imageView1.image = [UIImage imageNamed:big.cell2pic1];
                [cell2.contentView addSubview:cell2.imageView1];
                
                cell2.imageView2.image = [UIImage imageNamed:big.cell2pic2];
                [cell2.contentView addSubview:cell2.imageView2];
                
                cell2.imageView3.image = [UIImage imageNamed:big.cell2pic3];
                [cell2.contentView addSubview:cell2.imageView3];
                cell2.imageView4.image = [UIImage imageNamed:big.cell2pic4];
                [cell2.contentView addSubview:cell2.imageView3];
                cell2.imageView5.image = [UIImage imageNamed:big.cell2pic5];
                [cell2.contentView addSubview:cell2.imageView3];
                cell2.imageView6.image = [UIImage imageNamed:big.cell2pic6];
                [cell2.contentView addSubview:cell2.imageView3];
                
                return cell2;
            }
            else if(indexPath.row == 3) {
                UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
                if(cell3 == nil){
                    cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
                    cell3.backgroundColor = [UIColor clearColor];
                    cell3.contentView.backgroundColor = [UIColor clearColor];
//                    cityweather *big = [[cityweather alloc] init];
//                    big = _cell1Array[0];
                    UILabel *labeltip = [[UILabel alloc]init];
                    labeltip.frame = CGRectMake(10,0, 400, 90);
                    labeltip.font = [UIFont systemFontOfSize:18];
                    labeltip.textColor = [UIColor whiteColor];
                    labeltip.numberOfLines = 0;
                    labeltip.text = big.citytip;
                    [cell3.contentView addSubview:labeltip];
                }
                return cell3;
            }else {
                OtherTableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
                cell4.backgroundColor = [UIColor clearColor];
                cell4.contentView.backgroundColor = [UIColor clearColor];
//                    cityweather *big = [[cityweather alloc] init];
//                    big = _cell1Array[0];
                    cell4.labelsunr.text = big.citysunr;
                    [cell4.contentView addSubview:cell4.labelsunr];
                cell4.labelsuns.text = big.citysuns;
                [cell4.contentView addSubview:cell4.labelsuns];
                cell4.labelairlevel.text = big.cityairlevel;
                [cell4.contentView addSubview:cell4.labelairlevel];
                cell4.labelpre.text = big.citypre;
                [cell4.contentView addSubview:cell4.labelpre];
                cell4.labelvis.text = big.cityvis;
                [cell4.contentView addSubview:cell4.labelvis];
                cell4.labelhum.text = big.cityhum;
                [cell4.contentView addSubview:cell4.labelhum];
                cell4.labelwinspeed.text = big.citywinspeed;
                [cell4.contentView addSubview:cell4.labelwinspeed];
                cell4.labelwinmeter.text = big.citywinmeter;
                [cell4.contentView addSubview:cell4.labelwinmeter];
                
                return cell4;
            }
       }
    }
    return 0;
}

- (void)press
{
    CityViewController *cityViewController = [[CityViewController alloc] init];
    cityViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)change:(UIPageControl *)pc
{
    [_sv setContentOffset:CGPointMake(_pc.currentPage * self.view.frame.size.width, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pc.currentPage = _sv.contentOffset.x/self.view.frame.size.width;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

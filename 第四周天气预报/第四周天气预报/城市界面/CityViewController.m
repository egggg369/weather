//
//  CityViewController.m
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/4.
//  Copyright © 2020 无. All rights reserved.
//

#import "CityViewController.h"

#import "Add2ViewController.h"
#import "cityweather.h"
@interface CityViewController ()

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor colorWithRed:0.70 green:0.75 blue:0.88 alpha:1.00];
    UIImage *backgroundImage = [UIImage imageNamed:@"城市界面.jpg"];
    self.view.layer.contents = (id)backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
    underView.backgroundColor = [UIColor clearColor];
//    self.view.layer.contents = (id)backgroundImage.CGImage;
//    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;

    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(self.view.frame.size.width - 70, /*self.view.frame.size.height - 50*/ 0, 60, 60);
    [btn setImage:[UIImage imageNamed:@"增加按钮"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:underView];
    [underView addSubview:btn];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 60) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CityTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
//    _tmpDictionary = [[NSMutableDictionary alloc] init];
//    _timeDictionary = [[NSMutableDictionary alloc] init];
    
    //设置传递数组
    if(_nameArray == nil){
        _nameArray = [[NSMutableArray alloc] init];
    }
    if(_tmpArray == nil){
        _tmpArray = [[NSMutableArray alloc] init];
    }
    if(_timeArray == nil){
        _timeArray = [[NSMutableArray alloc] init];
    }
    if(_hourtmpArray == nil){
        _tmpArray = [[NSMutableArray alloc] init];
    }
    if(_hourtimeArray == nil){
        _timeArray = [[NSMutableArray alloc] init];
    }
    if(_hourweaArray == nil){
        _hourweaArray = [[NSMutableArray alloc] init];
    }
    _arraycell1= [[NSMutableArray alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.labeltime.text = _timeArray[indexPath.row];
    cell.labelname.text = _nameArray[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"%@°",_tmpArray[indexPath.row] ];
    cell.labeltmp.text = str;
    
//    if(_tmpDictionary.count == _nameArray.count) {
//        cell.labelname.text = _nameArray[indexPath.row];
//        cell.labeltmp.text = _tmpDictionary[_nameArray[indexPath.row]];
//        cell.labeltime.text = _timeDictionary[_nameArray[indexPath.row]];
//    }

    return cell;
}

//选中cell后
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherViewController *weatherViewController = [[WeatherViewController alloc] init];
    weatherViewController.cityNumber = _nameArray;
    
    weatherViewController.cell1Array = _arraycell1;
    weatherViewController.timehourArray = _hourtimeArray;
    weatherViewController.tmphourArray = _hourtmpArray;
    weatherViewController.weahourArray = _hourweaArray;
    weatherViewController.page = indexPath.row;
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
    weatherViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:weatherViewController animated:YES completion:nil];
}

-(void)press
{

    Add2ViewController *add2CityViewController = [[Add2ViewController alloc] init];
    //add2CityViewController.cityShowArray = self.nameArray;
    add2CityViewController.delegate = self;
    add2CityViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:add2CityViewController animated:YES completion:nil];
    
}

- (void)pass:(NSString *)str {
    
    
    //str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //NSString *string = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?location=%@&key=b92646e0f4194731b50870798cfad1d0",_nameArray[_nameArray.count-1]];
    NSLog(@"%@", str);
    
    NSString *string = [NSString stringWithFormat:@"https://yiketianqi.com/api?version=v9&appid=82228326&appsecret=gk6TsRcE&city=%@",str];
    
    //NSString *string = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?id=%@&key=b92646e0f4194731b50870798cfad1d0",_nameArray[_nameArray.count-1]objectForKey:@"id"];
    
    //处理字符，有些中文，，，
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //1. 创建请求地址
    NSURL *url = [NSURL URLWithString:string];
    //2. 创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3. 创建会话
    //NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSession *session = [NSURLSession sharedSession];
    //4. 根据会话创建任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        //str = [NSMutableString stringWithFormat:@"%@",dic[@"location"][0][@"now"][@"temp"]];
        //NSString *str = [NSString stringWithFormat:@"%@",dic[@"location"][0][@"now"][@"temp"]];
        NSString *str1 = [NSString stringWithFormat:@"%@",dic[@"data"][0][@"date"]];
        [self.timeArray addObject:str1];
        //[self->_tmpDictionary setObject:str forKey:self->_nameArray];
        NSLog(@"%@",str1);
        //NSLog(@"%@",dic);
        
        //str = [NSMutableString stringWithFormat:@"%@",dic[@"location"][0][@"now"][@"obsTime"]];
        NSString *str2 = [NSString stringWithFormat:@"%@",dic[@"data"][0][@"tem"]];
        [self.tmpArray addObject:str2];
        NSLog(@"%@",str2);
        
        
        
        [self.nameArray addObject:str];
        
        
    
        
        
        
        cityweather *big = [[cityweather alloc]init];
        
        big.cityname = [NSString stringWithFormat:@"%@",dic[@"city"]];
        big.cityweather2 = [NSString stringWithFormat:@"%@", dic[@"data"][0][@"wea"]];
        big.citytemp1 = [NSString stringWithFormat:@"%@", dic[@"data"][0][@"tem1"]];
        big.citytemp2 = [NSString stringWithFormat:@"%@", dic[@"data"][0][@"tem2"]];
        big.citytemp = [NSString stringWithFormat:@"%@",dic[@"data"][0][@"tem"]];
        big.cityweek = [NSString stringWithFormat:@"%@",dic[@"data"][0][@"week"]];
        big.citytip =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"air_tips"]];
        
        big.citysunr =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"sunrise"]];
        big.citysuns =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"sunset"]];
        big.citypre =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"pressure"]];
        big.cityairlevel =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"air_level"]];
        big.citywinmeter =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"win_meter"]];
        big.citywinspeed =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"win_speed"]];
        big.cityhum =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"humidity"]];
        big.cityvis =[NSString stringWithFormat:@"%@",dic[@"data"][0][@"visibility"]];
        
        big.cell2time1 = [NSString stringWithFormat:@"%@", dic[@"data"][1][@"week"]];
        big.cell2time2 = [NSString stringWithFormat:@"%@", dic[@"data"][2][@"week"]];
        big.cell2time3 = [NSString stringWithFormat:@"%@", dic[@"data"][3][@"week"]];
        big.cell2time4 = [NSString stringWithFormat:@"%@", dic[@"data"][4][@"week"]];
        big.cell2time5 = [NSString stringWithFormat:@"%@", dic[@"data"][5][@"week"]];
        big.cell2time6 = [NSString stringWithFormat:@"%@", dic[@"data"][6][@"week"]];
        big.cell2tmphigh1 = [NSString stringWithFormat:@"%@", dic[@"data"][1][@"tem1"]];
        big.cell2tmphigh2 = [NSString stringWithFormat:@"%@", dic[@"data"][2][@"tem1"]];
        big.cell2tmphigh3 = [NSString stringWithFormat:@"%@", dic[@"data"][3][@"tem1"]];
        big.cell2tmphigh4 = [NSString stringWithFormat:@"%@", dic[@"data"][4][@"tem1"]];
        big.cell2tmphigh5 = [NSString stringWithFormat:@"%@", dic[@"data"][5][@"tem1"]];
        big.cell2tmphigh6 = [NSString stringWithFormat:@"%@", dic[@"data"][6][@"tem1"]];
        big.cell2tmplow1 = [NSString stringWithFormat:@"%@", dic[@"data"][1][@"tem2"]];
        big.cell2tmplow2 = [NSString stringWithFormat:@"%@", dic[@"data"][2][@"tem2"]];
        big.cell2tmplow3 = [NSString stringWithFormat:@"%@", dic[@"data"][3][@"tem2"]];
        big.cell2tmplow4 = [NSString stringWithFormat:@"%@", dic[@"data"][4][@"tem2"]];
        big.cell2tmplow5 = [NSString stringWithFormat:@"%@", dic[@"data"][5][@"tem2"]];
        big.cell2tmplow6 = [NSString stringWithFormat:@"%@", dic[@"data"][6][@"tem2"]];
        
        big.cell2pic1 = [NSString stringWithFormat:@"%@", dic[@"data"][1][@"wea_img"]];
        big.cell2pic2 = [NSString stringWithFormat:@"%@", dic[@"data"][2][@"wea_img"]];
        big.cell2pic3 = [NSString stringWithFormat:@"%@", dic[@"data"][3][@"wea_img"]];
        big.cell2pic4 = [NSString stringWithFormat:@"%@", dic[@"data"][4][@"wea_img"]];
        big.cell2pic5 = [NSString stringWithFormat:@"%@", dic[@"data"][5][@"wea_img"]];
        big.cell2pic6 = [NSString stringWithFormat:@"%@", dic[@"data"][6][@"wea_img"]];
        
        
        
        [_arraycell1 addObject:big];
        
        self.hourtimeArray= [[NSMutableArray alloc] init];
        self.hourtmpArray= [[NSMutableArray alloc] init];
        self.hourweaArray= [[NSMutableArray alloc] init];
        
        
        for(int i = 0; i < 11; i++) {
            //NSString *strhour = [NSString stringWithFormat:@"%@", dic[@"data"][@"hours"][i][@"hours"]];
            NSString *strhour = [[NSString alloc] initWithFormat:@"%@",[[[dic objectForKey:@"data"][0] objectForKey:@"hours"][i] objectForKey:@"hours"]];
            [self.hourtimeArray addObject:strhour];
            NSString *strtmp = [[NSString alloc] initWithFormat:@"%@",[[[dic objectForKey:@"data"][0] objectForKey:@"hours"][i] objectForKey:@"tem"]];
            [self.hourtmpArray addObject:strtmp];
            //[_hourtmpArray addObject:strtmp];
            //NSString *strwea = [NSString stringWithFormat:@"%@", dic[@"data"][@"hours"][i][@"wea_img"]];
            NSString *strwea = [[NSString alloc] initWithFormat:@"%@",[[[dic objectForKey:@"data"][0] objectForKey:@"hours"][i] objectForKey:@"wea_img"]];
            [self.hourweaArray addObject:strwea];
        }
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    //5. 启动任务
    [dataTask resume];
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

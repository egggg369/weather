//
//  Add2ViewController.m
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/6.
//  Copyright © 2020 无. All rights reserved.
//

#import "Add2ViewController.h"

@interface Add2ViewController ()

@end

@implementation Add2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"添加城市背景.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:image];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _textField = [[UITextField alloc] init];
    _textField.delegate = self;
    _textField.frame = CGRectMake(30, 50, [UIScreen mainScreen].bounds.size.width - 50, 50);
    //_textField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_textField];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.keyboardType = UIKeyboardTypeDefault;
    _textField.backgroundColor = [UIColor clearColor];
    _textField.textColor = [UIColor whiteColor];
    _textField.tintColor = [UIColor whiteColor];
    _textField.layer.cornerRadius = 5;
    _textField.layer.borderWidth = 2;
    _textField.layer.borderColor = [UIColor whiteColor].CGColor;
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 110, [UIScreen mainScreen].bounds.size.width, 500) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    //UIView *view = [[UIView alloc] init];
    //_tableView.tableFooterView = view;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    [self creatUrl];
//    _cityNumber = [[NSMutableArray alloc] init];
//    return YES;
//}

- (void)textFieldDidChange:(UITextField *)textField {
        [self creatUrl];
       _cityNumber = [[NSMutableArray alloc] init];
       //return YES;
}


- (void)creatUrl
{
    NSString *string = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?location=%@&key=b92646e0f4194731b50870798cfad1d0",_textField.text];
    
    //处理字符，有些中文，，，
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //1. 创建请求地址
    NSURL *url = [NSURL URLWithString:string];
    //2. 创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3. 创建会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self  delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话创建任务
    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:request];
    //5. 启动任务
    [dataTask resume];
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
//    NSLog(@"didReceiveResponse");
    
    if(self.data == nil){
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    completionHandler(NSURLSessionResponseAllow);
}
//接收到数据，该方法会被调用多次
- (void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
//    NSLog(@"didReceiveData");
    
    [self.data appendData:data];
}

//数据请求完成或者请求出现错误调用的方法
- (void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
//    NSLog(@"didCompleteWithError");
    
    NSLog(@"didCompleteWithError");
    if(error == nil) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];
        //NSArray *array = [[dic objectForKey:@"HeWeather6"][0] objectForKey:@"basic"];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        array = [dic objectForKey:@"location"];
        //array = dic[@"location"];
        for ( int i = 0; i < array.count;i++) {
            //NSString *str = [[NSString alloc] initWithFormat:@"%@",[[[dic objectForKey:@"HeWeather6"][0] objectForKey:@"basic"][i] objectForKey:@"location"]];
            //NSString *str = [NSString stringWithString:dic[@"lacation"][i][@"name"] ];
            NSString *str = [NSString stringWithFormat:@"%@", dic[@"location"][i][@"name"]];
            //NSString *str = [NSString stringWithFormat:@"%@", array[i][@"name"]];
            [_cityNumber addObject:str];
        }
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    cell.textLabel.text = _cityNumber[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    //cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cityNumber.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textField endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _textField.text = _cityNumber[indexPath.row];
    int i;
    for (i = 0; i < _cityShowArray.count; i++) {
        if ([_cityShowArray[i] isEqualToString:_textField.text]) {
            break;
        }
    }
    if (i == _cityShowArray.count) {
//        if([self.cityNumber containsObject:[self.result objectAtIndex:indexPath.row]] == NO) {
//            [self.cityNumber addObject:[self.result objectAtIndex:indexPath.row]];
//            [_delegate pass:_cityNumber];
//        }
        if ([_delegate respondsToSelector:@selector(pass:)]) {
            [_delegate pass:_textField.text];
        }
        [self dismissViewControllerAnimated:NO completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经有该城市！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:NO completion:nil];
    }
    
}

-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

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

//
//  Add2ViewController.h
//  第四周天气预报
//
//  Created by 郭红乐 on 2020/8/6.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CityViewControllerDelegate <NSObject>

- (void)pass:(NSString * )str;

@end


@interface Add2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, NSURLSessionDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cityNumber;
@property (nonatomic, strong) NSMutableArray *cityShowArray;
@property (nonatomic, strong) NSMutableData *data;

@property (nonatomic, weak) id <CityViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

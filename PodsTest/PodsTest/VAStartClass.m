//
//  VAStartClass.m
//  PodsTest
//
//  Created by chen on 14-12-19.
//  Copyright (c) 2014年 zichen0422. All rights reserved.
//

#import "VAStartClass.h"
#import <SVProgressHUD.h>

@interface VAStartClass ()
{
    NSString *returnStr;
}

@end

@implementation VAStartClass

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"storyboard", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ([_ReturnViewController respondsToSelector:@selector(setReturnString:)]) {
        [_ReturnViewController setValue:returnStr forKey:@"ReturnString"];
    }
}

-(void)setVAStartString:(NSString *)VAStartString
{
    _VAStartString = VAStartString;

    [self list:VAStartString,@"123",@"hello",nil];
    [self doStringWithString:VAStartString,@"123",@"hello",nil];
    
    [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor]];
    [SVProgressHUD showWithString:returnStr Duration:2];
}
-(IBAction)BACKBUTTON:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --可变参数
-(void)doStringWithString:(NSString *)string1,...
{
    va_list args;
    va_start(args, string1);
    
    returnStr = [NSString stringWithFormat:@"%@", string1];
    NSString *writeString;
    while ((writeString = va_arg(args, NSString *))) {
        returnStr =  [returnStr stringByAppendingFormat:@"%@",writeString];
    }
    va_end(args);
    
    NSLog(@"%@", returnStr);
}

- (void)list:(NSString *)string,...{
    va_list args;
    va_start(args, string);
    if (string)
    {
        NSString * otherString;
        NSLog(@"%@",string);//输出第一个字符串
        while (1)//在循环中遍历
        {
            //依次取得所有参数
            otherString = va_arg(args, NSString *);
            if(otherString == nil)//当最后一个参数为nil的时候跳出循环
                break;
            else
                NSLog(@"%@",otherString);
        }
    }
    va_end(args);
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

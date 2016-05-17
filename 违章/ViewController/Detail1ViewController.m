//
//  Detail1ViewController.m
//  违章
//
//  Created by administrator on 16/3/24.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "Detail1ViewController.h"

@interface Detail1ViewController ()

@end

@implementation Detail1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label1 = (UILabel *)[self.view viewWithTag:5001];
    UILabel *label2 = (UILabel *)[self.view viewWithTag:5002];
    UILabel *label3 = (UILabel *)[self.view viewWithTag:5003];
    UILabel *label4 = (UILabel *)[self.view viewWithTag:5004];
    UILabel *label5 = (UILabel *)[self.view viewWithTag:5005];
    UILabel *label6 = (UILabel *)[self.view viewWithTag:5006];
    
    label1.text = self.Dstr;
    label2.text = [self.mutDic objectForKey:@"date"];
    label3.text = [self.mutDic objectForKey:@"area"];
    label4.text = [self.mutDic objectForKey:@"money"];
    label5.text = [self.mutDic objectForKey:@"fen"];
    label6.text = [self.mutDic objectForKey:@"act"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

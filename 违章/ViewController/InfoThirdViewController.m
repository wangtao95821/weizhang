//
//  InfoThirdViewController.m
//  违章
//
//  Created by administrator on 16/3/22.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "InfoThirdViewController.h"
#import "XZService.h"
#import "XXXPlistLocalInfo.h"
#import "DetailInfoViewController.h"
@interface InfoThirdViewController ()

@property (strong, nonatomic) NSDictionary *dic1;

@property (strong, nonatomic) NSMutableArray *mutArr1;

@property (assign, nonatomic) int sequence;

@end

@implementation InfoThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sequence = 0;

    
    self.mutArr1 = [NSMutableArray arrayWithCapacity:0];

    [XZService requestRegulations:self.mutDicc andWithSuccess:^(NSDictionary *dics) {

        self.dic1 = [dics objectForKey:@"result"];
        
        self.mutArr1 = [NSMutableArray arrayWithArray:[self.dic1 objectForKey:@"lists"]];
        
        [self.infoTable reloadData];
    }];
    
    
    self.infoTable.dataSource = self;
    self.infoTable.delegate = self;
    
    self.infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.HomeBtnLabel.layer.cornerRadius = 8;
    
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.mutArr1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    UIImageView *imageV = (UIImageView *)[cell viewWithTag:1000];
    UILabel *label1 = (UILabel *)[cell viewWithTag:1001];
    UILabel *label2 = (UILabel *)[cell viewWithTag:1002];
    UILabel *label3 = (UILabel *)[cell viewWithTag:1003];
    UILabel *label4 = (UILabel *)[cell viewWithTag:1004];
    
    imageV.image = [UIImage imageNamed:@"c998e2dc22474acf27382b7398d2555d.jpg"];
    
    NSString *str1 = [NSString stringWithFormat:@"时间：%@",[self.mutArr1[indexPath.row] objectForKey:@"date"]];
    
    NSString *str2 = [NSString stringWithFormat:@"地点：%@",[self.mutArr1[indexPath.row] objectForKey:@"area"]];
    
    NSString *str3 = [NSString stringWithFormat:@"罚款：%@",[self.mutArr1[indexPath.row] objectForKey:@"money"]];
    
    NSString *str4 = [NSString stringWithFormat:@"扣分：%@",[self.mutArr1[indexPath.row] objectForKey:@"fen"]];
    
    label1.text = str1;
    label2.text = str2;
    label3.text = str3;
    label4.text = str4;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 181;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"DetailInfo"]) {
        
        DetailInfoViewController *dvc = (DetailInfoViewController *)[segue destinationViewController];
        
        dvc.mutDic = self.mutArr1[self.sequence];
        dvc.Dstr = [self.dic1 objectForKey:@"hphm"];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.sequence = (int)indexPath.row;
    
    [self performSegueWithIdentifier:@"DetailInfo" sender:nil];
}

- (IBAction)HomeBtn:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end

//
//  Info1ViewController.m
//  违章
//
//  Created by administrator on 16/3/24.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "Info1ViewController.h"
#import "Detail1ViewController.h"
@interface Info1ViewController ()

@property (strong, nonatomic) NSMutableArray *mutArr1;

@property (assign, nonatomic) int sequence;

@end

@implementation Info1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sequence = 0;

    self.mutArr1 = [NSMutableArray arrayWithCapacity:0];
    
    self.mutArr1 = [NSMutableArray arrayWithArray:[self.mutDicc objectForKey:@"lists"]];
  
    self.infotable.dataSource = self;
    self.infotable.delegate = self;
    
    self.infotable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.homelabel.layer.cornerRadius = 8;
    
    [self.infotable reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutArr1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    

    UILabel *label1 = (UILabel *)[cell viewWithTag:4001];
    UILabel *label2 = (UILabel *)[cell viewWithTag:4002];
    UILabel *label3 = (UILabel *)[cell viewWithTag:4003];
    UILabel *label4 = (UILabel *)[cell viewWithTag:4004];


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
    
    if ([segue.identifier isEqualToString:@"SYDINFOdetail"]) {
        
        Detail1ViewController *dvc = (Detail1ViewController *)[segue destinationViewController];
        
        dvc.mutDic = self.mutArr1[self.sequence];
        dvc.Dstr = [self.mutDicc objectForKey:@"hphm"];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.sequence = (int)indexPath.row;
    
    [self performSegueWithIdentifier:@"SYDINFOdetail" sender:nil];
}


- (IBAction)home:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end

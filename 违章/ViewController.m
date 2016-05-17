//
//  ViewController.m
//  违章
//
//  Created by administrator on 16/3/21.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "ViewController.h"
#import "XXXPlistLocalInfo.h"
#import "XZService.h"
#import "Info1ViewController.h"
@interface ViewController ()

@property (strong, nonatomic) NSMutableDictionary *dicss;

@property (strong, nonatomic) NSMutableDictionary *dicss1;
@property (strong, nonatomic) NSMutableArray *muArr;

@property (strong, nonatomic) NSArray *key;
@property (strong, nonatomic) NSArray *value;

@property (strong, nonatomic) NSDictionary *valueDic;

@property (copy, nonatomic) NSString *sss;
@property (copy, nonatomic)  NSString *k;

@property (strong, nonatomic) NSMutableArray *kArr;

@property (strong, nonatomic) NSMutableArray *sArr;

@property (assign, nonatomic) long int k1;


@property (strong, nonatomic) NSMutableArray *sydInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self create];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.value.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarInfo"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CarInfo"];
    }
    
    
    UILabel *label1 = (UILabel *)[cell viewWithTag:1000];
    UILabel *label2 = (UILabel *)[cell viewWithTag:1001];
    UILabel *label3 = (UILabel *)[cell viewWithTag:1002];

    //真实
    label1.text = [self.dicss1 objectForKey:@"hphm"];
    label2.text = [NSString stringWithFormat:@"违章次数:%@",self.sss];
    
    if ([self.sArr[indexPath.row] isEqualToString: self.kArr[indexPath.row]]) {

        label3.text = @"没有新违章!";

    }else{
    
        label3.text = @"有新违章!";
    }
    
    
    //虚拟
//    label1.text = self.key[indexPath.row];
//    
//    long int ll = [[self.value[indexPath.row] objectForKey:@"count"] intValue];
//    
//    label2.text = [NSString stringWithFormat:@"违章次数:%ld",ll];
//    label3.text = @"没有新违章!";


    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"SYDINFO" sender:nil];
    
    self.k1 = indexPath.row;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"SYDINFO"]) {
        
        Info1ViewController *ivc = (Info1ViewController *)[segue destinationViewController];
        
        ivc.mutDicc = self.sydInfo[_k1];
    }
}

//ViewDidLoad
- (void)create{

    self.k1 = 0;
    
    self.dicss = [NSMutableDictionary dictionaryWithCapacity:0];
    self.dicss1 = [NSMutableDictionary dictionaryWithCapacity:0];
    self.muArr = [NSMutableArray arrayWithCapacity:0];
    self.sydInfo = [NSMutableArray arrayWithCapacity:0];
    
    self.kArr = [NSMutableArray arrayWithCapacity:0];
    
    self.sArr = [NSMutableArray arrayWithCapacity:0];
    
    self.CarTable.tableFooterView = [[UIView alloc]init];
    
    
    self.k = 0;
    
    XXXPlistLocalInfo *infoPath = [[XXXPlistLocalInfo alloc]init];
    
    NSString *path = [infoPath userInfoPath];
    
    NSString *lastPath = [path stringByAppendingPathComponent:@"chaxun.plist"];
    
    self.dicss = [NSMutableDictionary dictionaryWithContentsOfFile:lastPath];
    
    self.value = [self.dicss allValues];
    self.key = [self.dicss allKeys];
    
    
    for (int m = 0; m < self.value.count; m++) {
        
        self.k = [NSString stringWithFormat:@"%@",[self.value[m] objectForKey:@"count"]];
        
        [self.kArr addObject:_k];
    }
    
    for (int l = 0; l < self.value.count; l++) {
        
        [XZService requestRegulations:self.value[l] andWithSuccess:^(NSDictionary *dics) {
            
            self.dicss1 = [dics objectForKey:@"result"];
            
            self.muArr = [self.dicss1 objectForKey:@"lists"];
            
            self.sss = [NSString stringWithFormat:@"%ld",self.muArr.count];
            [self.sArr addObject:_sss];
            
            [self.sydInfo addObject:self.dicss1];
            
            self.CarTable.dataSource = self;
            self.CarTable.delegate = self;
            
            [self.CarTable reloadData];
            
        }];
    }

}

//- (void)viewWillAppear:(BOOL)animated{
//
//    [self create];
//}

@end

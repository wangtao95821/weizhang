//
//  SearchCarSecondViewController.m
//  违章
//
//  Created by administrator on 16/3/22.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "SearchCarSecondViewController.h"
#import "InfoThirdViewController.h"
#import "Header.h"
@interface SearchCarSecondViewController ()

@end

@implementation SearchCarSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cityLabel.text = self.SStr;
    
    
//    self.cityLabel.textColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSString *s1 = self.CPText.text;
    NSString *s11 = [NSString stringWithFormat:@"%@%@",self.cityLabel.text,s1];
    NSString *s111 = [s11 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString *s2 = self.CJText.text;
    
    [mDic setObject:s111 forKey:@"hphm"];
    [mDic setObject:s2 forKey:@"classno"];
    [mDic setObject:@"json" forKey:@"dtype"];
    [mDic setObject:KEY forKey:@"key"];
    [mDic setObject:[_mutDics objectForKey:@"city_code"] forKey:@"city"];
    [mDic setObject:@"02" forKey:@"hpzl"];
    
    
    if ([segue.identifier isEqualToString:@"InfoSecond"]) {
        
        InfoThirdViewController *ivc = (InfoThirdViewController *)[segue destinationViewController];
        
        ivc.mutDicc = mDic;
    }
}

- (IBAction)SearchBtn:(UIBarButtonItem *)sender {
    
    if (self.CPText.text.length > 0&& self.CJText.text.length > 0) {
        
        [self performSegueWithIdentifier:@"InfoSecond" sender:nil];
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Tip" message:@"please input your info" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
        
        [alert show];
        
    }
}
@end

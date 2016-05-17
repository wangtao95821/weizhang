//
//  secondViewController.m
//  违章
//
//  Created by administrator on 16/3/21.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "secondViewController.h"
#import "ChangeCityViewControllers.h"
#import "SearchCarFirstViewController.h"
#import "SearchCarSecondViewController.h"
#import "SearchCarThirdViewController.h"
@interface secondViewController ()

@property (copy, nonatomic) NSString *string;

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addTextFiled.delegate = self;
    
    self.mutDic = [NSMutableDictionary dictionaryWithCapacity:0];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    [self performSegueWithIdentifier:@"hahaha" sender:nil];
    
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"hahaha"]){
    
        ChangeCityViewControllers *cvc = (ChangeCityViewControllers *)[segue destinationViewController];
    
        cvc.cityDelegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"SearchCarSecond"]) {
        
        SearchCarSecondViewController *svc = (SearchCarSecondViewController *)[segue destinationViewController];
        
        svc.SStr = self.CArr;
        
        svc.mutDics = self.mutDic;
    }else if ([segue.identifier isEqualToString:@"SearchCar"]){
    
        SearchCarFirstViewController *svc = (SearchCarFirstViewController *)[segue destinationViewController];
        
        svc.FStr = self.CArr;
        svc.mutDics = self.mutDic;
        
    }else if ([segue.identifier isEqualToString:@"SearchCarThird"]){
    
        SearchCarThirdViewController *svc = (SearchCarThirdViewController *)[segue destinationViewController];
        
        svc.TStr = self.CArr;
        svc.mutDics = self.mutDic;
    }
}

- (void)Back:(NSDictionary *)dic{

    self.mutDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    self.addTextFiled.text = [dic objectForKey:@"city_name"];
    
    self.CArr = [dic objectForKey:@"abbr"];
}

- (IBAction)next:(UIBarButtonItem *)sender {
    
    
    NSString *str1 = [self.mutDic objectForKey:@"engine"];
    
    NSString *str2 = [self.mutDic objectForKey:@"class"];
    
    if (self.addTextFiled.text.length > 0) {
        
        if ([str1 isEqualToString:@"1"]&&[str2 isEqualToString:@"1"]) {
            
            [self performSegueWithIdentifier:@"SearchCarThird" sender:nil];
            
        }else if ([str1 isEqualToString:@"0"]&&[str2 isEqualToString:@"1"]){
        
            [self performSegueWithIdentifier:@"SearchCarSecond" sender:nil];
            
        }else if ([str1 isEqualToString:@"1"]&&[str2 isEqualToString:@"0"]){
        
            [self performSegueWithIdentifier:@"SearchCar" sender:nil];
        }
        
        
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Tip" message:@"please input your carCity" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
}
@end

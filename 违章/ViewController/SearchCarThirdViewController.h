//
//  SearchCarThirdViewController.h
//  违章
//
//  Created by administrator on 16/3/22.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCarThirdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (copy, nonatomic) NSString *TStr;

@property (weak, nonatomic) IBOutlet UITextField *CPText;

- (IBAction)SearchBtn:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextField *CJText;
@property (weak, nonatomic) IBOutlet UITextField *FDJText;

@property (strong, nonatomic) NSMutableDictionary *mutDics;

@end

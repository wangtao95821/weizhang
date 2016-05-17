//
//  secondViewController.h
//  违章
//
//  Created by administrator on 16/3/21.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "ViewController.h"

@protocol cityDelegate <NSObject>

- (void)Back:(NSDictionary *)dic;

@end

@interface secondViewController : ViewController<UITextFieldDelegate,cityDelegate>
@property (weak, nonatomic) IBOutlet UITextField *addTextFiled;

@property (strong, nonatomic) NSMutableDictionary *mutDic;
- (IBAction)next:(UIBarButtonItem *)sender;

@property (copy, nonatomic) NSString *CArr;

@end

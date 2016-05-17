//
//  Info1ViewController.h
//  违章
//
//  Created by administrator on 16/3/24.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Info1ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *infotable;
@property (weak, nonatomic) IBOutlet UIButton *homelabel;
- (IBAction)home:(UIButton *)sender;

@property (strong, nonatomic) NSMutableDictionary *mutDicc;

@end

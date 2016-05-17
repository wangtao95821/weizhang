//
//  InfoThirdViewController.h
//  违章
//
//  Created by administrator on 16/3/22.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoThirdViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSMutableDictionary *mutDicc;
@property (weak, nonatomic) IBOutlet UITableView *infoTable;

- (IBAction)HomeBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *HomeBtnLabel;

@end

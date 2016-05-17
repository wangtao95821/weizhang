//
//  ViewController.h
//  违章
//
//  Created by administrator on 16/3/21.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *CarTable;

@end


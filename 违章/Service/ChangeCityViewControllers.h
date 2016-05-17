//
//  ChangeCityViewController.h
//  jmportal_iphone_grid
//
//  Created by yaojun on 14-5-28.
//
//

#import <UIKit/UIKit.h>
#import "BATableView.h"
#import "secondViewController.h"

@protocol ChangeCityViewControllerDelegate <NSObject>
-(void)changeButtonTag;
@end

@interface ChangeCityViewControllers : UIViewController<BATableViewDelegate>
{
    NSArray * citydataSource;
    BATableView *contactTableView;
    id<ChangeCityViewControllerDelegate>delegate;
    
    
}
@property (nonatomic, strong) NSArray * citydataSource;
@property (nonatomic, strong) BATableView *contactTableView;
@property (nonatomic, strong) NSString *webName;
@property (nonatomic) id<ChangeCityViewControllerDelegate>delegate;
@property(nonatomic,strong)NSMutableArray *cityArray;

@property (assign, nonatomic) id<cityDelegate>cityDelegate;

@end

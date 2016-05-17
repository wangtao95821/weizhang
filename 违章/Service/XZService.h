//
//  XZService.h
//  违章
//
//  Created by administrator on 16/3/21.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZService : NSObject

+ (void)requestCity:(void(^)(NSDictionary *dic))success;

+ (void)requestRegulations:(NSDictionary *)dic andWithSuccess:(void(^)(NSDictionary *dics))success;

//@property (strong, nonatomic) NSDictionary *CQDic;

@end

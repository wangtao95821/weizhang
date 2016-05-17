//
//  XZService.m
//  违章
//
//  Created by administrator on 16/3/21.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "XZService.h"
#import "AFNetworking.h"
#import "Header.h"
#import "XXXPlistLocalInfo.h"
@implementation XZService

+ (void)requestCity:(void (^)(NSDictionary *))success{

    NSString *url = [NSString stringWithFormat:@"http://v.juhe.cn/wz/citys?key=%@",KEY];
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dics = [responseObject objectForKey:@"result"];
        
        success(dics);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


//dtype 	string 	是 	返回数据格式：json或xml或jsonp,默认json
//callback 	String 	否 	返回格式选择jsonp时，必须传递
//key 	string 	是 	你申请的key
//city 	String 	是 	城市代码 *
//hphm 	String 	是 	号牌号码 完整7位 ,需要utf8 urlencode*
//hpzl 	String 	是 	号牌类型，默认02
//engineno 	String 	否 	发动机号 (根据城市接口中的参数填写)
//classno 	String 	否 	车架号 (根据城市接口中的参数填写)

+ (void)requestRegulations:(NSDictionary *)dic andWithSuccess:(void (^)(NSDictionary *))success{
    
    NSString *ste = @"{\"resultcode\":\"200\",\"reason\":\"查询成功\",\"result\":{\"province\":\"HB\",\"city\":\"HB_HD\",\"hphm\":\"冀DHL327\",\"hpzl\":\"02\",\"lists\":[{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"},{\"date\":\"2013-12-29 11:57:29\",\"area\":\"316省道53KM+200M\",\"act\":\"16362 : 驾驶中型以上载客载货汽车、校车、危险物品运输车辆以外的其他机动车在高速公路以外的道路上行驶超过规定时速20%以上未达50%的\",\"code\":\"\",\"fen\":\"6\",\"money\":\"100\",\"handled\":\"0\"}]}}";
    

    NSString *url = @"http://v.juhe.cn/wz/query";
    
    NSMutableDictionary *mutDicc = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSMutableDictionary *Dicc = [NSMutableDictionary dictionaryWithCapacity:0];
    
    Dicc = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    [mutDicc setObject:@"json" forKey:@"dtype"];
    [mutDicc setObject:KEY forKey:@"key"];
    [mutDicc setObject:[dic objectForKey:@"city"] forKey:@"city"];
    [mutDicc setObject:[dic objectForKey:@"hphm"] forKey:@"hphm"];
    [mutDicc setObject:[dic objectForKey:@"hpzl"] forKey:@"hpzl"];
    
    NSString *str1 = [dic objectForKey:@"engineno"];
    NSString *str2 = [dic objectForKey:@"classno"];
    
    if (str1.length <= 0) {
        
        [mutDicc setObject:@"" forKey:@"engineno"];
        
    }else{
    
        [mutDicc setObject:[dic objectForKey:@"engineno"] forKey:@"engineno"];
    }
    
    if (str2.length <= 0) {
        
        [mutDicc setObject:@"" forKey:@"classno"];
    }else{
        
        [mutDicc setObject:[dic objectForKey:@"classno"] forKey:@"classno"];
    }
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manger POST:url parameters:mutDicc progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSData *datas   = [ste dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dicq = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableDictionary *fetchDic = [NSMutableDictionary dictionaryWithCapacity:0];
        
        NSMutableArray *mutArr1 = [NSMutableArray arrayWithCapacity:0];
        
        NSDictionary *dicw;
        
        //模拟
        dicw = [dicq objectForKey:@"result"];
                success(dicq);
        
//        真实请求
//        dicw = [responseObject objectForKey:@"result"];
//        success(responseObject);
       
        mutArr1 = [NSMutableArray arrayWithArray:[dicw objectForKey:@"lists"]];
        

        XXXPlistLocalInfo *infoPath = [[XXXPlistLocalInfo alloc]init];
        
        NSString *loaclPath = [infoPath userInfoPath];
        
        NSString *lastPath = [loaclPath stringByAppendingPathComponent:@"chaxun.plist"];
        
        fetchDic = [NSMutableDictionary dictionaryWithContentsOfFile:lastPath];
        
        if (fetchDic == nil) {
            
            NSDictionary *dics = @{};
            
            [dics writeToFile:lastPath atomically:YES];
        }
        
        NSString *strr = [NSString stringWithFormat:@"%ld",mutArr1.count];
        
        [Dicc setObject:strr forKey:@"count"];
        
        [fetchDic setObject:Dicc forKey:[dicw objectForKey:@"hphm"]];
        
        [fetchDic writeToFile:lastPath atomically:YES];
        
    } failure:nil];
 
}

@end

//
//  DBManager.m
//  基础数据库
//
//  Created by EssIOS on 16/10/24.
//  Copyright © 2016年 ljh. All rights reserved.
//

#import "DBManager.h"
#import "contentModel.h"
@implementation DBManager
+(NSString *)getBasePath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/base.sqlite"];
}


+(FMDatabase * )getBaseDB
{
    FMDatabase *  db = [[FMDatabase alloc]initWithPath:[self getBasePath]];
    return db ;
}

+ (void)creatBaseDataTable
{
    FMDatabase * db = [self getBaseDB];
    if ([db open])
    {
        if (![db tableExists:@"baseData"])
        {
            [db executeUpdate:@"CREATE TABLE baseData (content text,date text,imgpath text,longitude text,latitude text,userID text)"];
        }
    }
    [db close];
}
+ (void)keepDataWithDictionary:(NSMutableDictionary *)dic
{
    [self creatBaseDataTable];
    FMDatabase * db = [self getBaseDB];
    if ([db open])
    {
        [db executeUpdate:@"insert into baseData (content,date,imgpath,Longitude,Latitude,userID) values(?,?,?,?,?,?)",[dic objectForKey:@"content"],[dic objectForKey:@"date"],[dic objectForKey:@"imgpath"],[dic objectForKey:@"longitude"],[dic objectForKey:@"latitude"],[dic objectForKey:@"userID"]];
    }
    [db close];
}
+ (NSMutableArray *)selectAllModel
{
    NSMutableArray * dataArray = [NSMutableArray array];
    
    FMDatabase *db = [self getBaseDB];
    if ([db open])
    {
        FMResultSet *set = [db executeQuery:@"select * from baseData"];
        while ([set next])
        {
            int a = 0;
            a ++;
            contentModel * model = [[contentModel alloc]init];
            model.content = [set stringForColumn:@"content"];
            model.date = [set stringForColumn:@"date"];
            model.imgpath = [set stringForColumn:@"imgpath"];
            model.longitude = [set stringForColumn:@"longitude"];
            model.latitude = [set stringForColumn:@"latitude"];
            model.userID = [set stringForColumn:@"userID"];
//            if (model.content != nil)
//            {
//                [dataArray addObject:store.StoreName];
//            }
                        [dataArray addObject:model];
            
        }
        [set close];
    }
    [db close];
    
    return dataArray;
}
@end

//
//  main.m
//  predicateDemo
//
//  Created by el1ven on 14-3-12.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:10];
        
        for (int i = 0;i <10 ; i++) {
            
            Person *person = [[Person alloc]init];
            if (i<5) {;
                person.name = [NSString stringWithFormat:@"BeiJing_%d",i];
                
            }else{
                person.name = [NSString stringWithFormat:@"TianJin_%d",i];
                
            }
            
            person.age = @(20+i);
            
            [arr addObject:person];
        }
        
        //判断对象是否满足谓词条件
        
        //第一种方式
        //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<25 or age>27"];
        
        //第二种方式
        //NSArray *inArray = @[@"BeiJing_0",@"BeiJing_1"];
        //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name in %@",inArray];
        
        
        //BEGINSWITH,ENDWITHS,CONTRAINS,like和数据库很像，可以进行模糊查找
        //NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"name BEGINSWITH 'TianJin'"];
        NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"name ENDSWITH '_0' or name ENDSWITH '_1' "];
       
        for (Person *p in arr) {
            BOOL result = [predicate evaluateWithObject:p];
            if(result){
                NSLog(@"%@,%@",p.name,p.age);
            }
        }
        
        //对数组进行过滤
        
        NSArray *filterArr = [arr filteredArrayUsingPredicate:predicate];
        NSLog(@"过滤后的数组:%@",filterArr);
        
    }
    return 0;
}


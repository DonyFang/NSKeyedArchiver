//
//  Person.h
//  NSKeyedArchiver
//
//  Created by 方冬冬 on 2017/8/3.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,strong)NSArray *apples;

- (NSString *)description;
@end

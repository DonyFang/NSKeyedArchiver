//
//  Person.m
//  NSKeyedArchiver
//
//  Created by 方冬冬 on 2017/8/3.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "Person.h"

@implementation Person


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if (self) {
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.apples = [aDecoder decodeObjectForKey:@"apples"];
        //一般我们将key定义成宏，这样就不会出错
        _name = [[aDecoder decodeObjectForKey:@"name"] copy];
    }
    
    return self;
}

//归档时调用此方法
- (void)encodeWithCoder:(NSCoder *)aCoder{
    NSLog(@"encodeWithCoder");
    [aCoder encodeObject:_name forKey:@"name"];//一般key和属性名是取一样的
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_apples forKey:@"apples"];
}

- (NSString *)description{
    NSString *string = [NSString stringWithFormat:@"name=%@,age=%ld,apples=%@",_name,(long)_age,_apples];
    return string;
}
@end

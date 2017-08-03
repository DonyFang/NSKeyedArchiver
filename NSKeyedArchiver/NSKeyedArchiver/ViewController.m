//
//  ViewController.m
//  NSKeyedArchiver
//
//  Created by 方冬冬 on 2017/8/3.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //归档解档
    
    
    
//    将对象存储转换为二进制序列的过程成为归档、打包或编码，逆变换称为解档、解码或对象还原。
//    
//    可以使用NSKeyedArchiver和NSKeyedUnarchiver完成对象的归档和解档操作，而他们都是抽象类NSCoder的子类。
//    
//    所有可以归档的对象都必须要适用于协议NSCoding。协议NSCoding在Foundation/NSObject.h中定义，NSObject自身并不采用该协议。NSString、NSDictionary等Foundation框架的主要类都适用协议NSCoding
    


    
}

//归档数组
- (void)archiverArr{
    // 第一种形式：归档对象
    //对象----》文件
    NSArray *array = [NSArray arrayWithObjects:@"zhang",@"wangwu",@"lisi",nil];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if(success){
        NSLog(@"保存成功");
    }

}

//解档数组
- (void)unarchiverArr{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",array);

}
//归档
- (IBAction)archiver:(id)sender {

    [self archivermultiObject];
}

//解档
- (IBAction)unarchiver:(id)sender {
  
    [self unarchivermultiObject];
}


//3、对多个对象进行归档到一个文件
- (void)archivermultiObject{

    //第二种方式
    //第一种方式的缺陷是一个对象归档成一个文件
    //但是第二种方式，多个对象可以归档成一个文件
    NSArray *array = [NSArray arrayWithObjects:@"zhangsan",@"lisi",nil];
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //编码
    [archiver encodeObject:array forKey:@"array"];
    [archiver encodeInt:100 forKey:@"scope"];
    [archiver encodeObject:@"jack" forKey:@"name"];
    
    //完成编码，将上面的归档数据填充到data中，此时data中已经存储了归档对象的数据
    [archiver finishEncoding];
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    BOOL success = [data writeToFile:filePath atomically:YES];
    if(success){  
        NSLog(@"归档成功");  
    }


}
//3、解档多个对象
- (void)unarchivermultiObject{

    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    //读取归档数据
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //创建解归档对象，对data中的数据进行解归档
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    //解归档
    NSArray *array = [unarchiver decodeObjectForKey:@"array"];
    NSLog(@"%@",array);
    
    id value = [unarchiver decodeObjectForKey:@"scope"];
    NSLog(@"%@",value);


}
- (IBAction)nextViewController:(id)sender {
    SecondViewController *second = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];

}
@end

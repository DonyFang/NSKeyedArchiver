//
//  SecondViewController.m
//  NSKeyedArchiver
//
//  Created by 方冬冬 on 2017/8/3.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"归档解档对象";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)archiverModel:(id)sender {
    
    Person *p = [[Person alloc] init];
    p.name = @"张三";
    p.age = 20;
    p.apples = @[@"iphone",@"ipad"];
    
    //归档
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"person.archiver"];
    BOOL success = [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    if(success){
        NSLog(@"归档成功");
    }
    
}


- (IBAction)unarchiverModel:(id)sender {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"person.archiver"];

    //解归档
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",person);
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

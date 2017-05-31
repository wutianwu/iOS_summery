//
//  ViewController.m
//  CopyDemo
//
//  Created by zlhf on 17/5/31.
//  Copyright © 2017年 zlhf. All rights reserved.
//

#import "ViewController.h"
#import "TestLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestLabel *label = [[TestLabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"您好吗?";
    label.backgroundColor = [UIColor orangeColor];
    label.type = TestLabelType_Copy;
    [self.view addSubview:label];
    
    TestLabel *label1 = [[TestLabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    label1.backgroundColor = [UIColor orangeColor];
    label1.type = TestLabelType_Copy_Paste;
    [self.view addSubview:label1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  TestLabel.h
//  CopyDemo
//
//  Created by zlhf on 17/5/31.
//  Copyright © 2017年 zlhf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TestLabelType) {
    TestLabelType_Copy_Paste = 1,
    TestLabelType_Copy
};

@interface TestLabel : UILabel

@property (nonatomic, assign)TestLabelType type;

@end

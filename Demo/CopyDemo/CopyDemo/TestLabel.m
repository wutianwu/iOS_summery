//
//  TestLabel.m
//  CopyDemo
//
//  Created by zlhf on 17/5/31.
//  Copyright © 2017年 zlhf. All rights reserved.
//

#import "TestLabel.h"

@implementation TestLabel

#pragma -
#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        [self attachTapHandler];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma -
#pragma mark - response

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    switch (self.type) {
        case TestLabelType_Copy_Paste:{
            if (action == @selector(paste:)) {
                return (action == @selector(paste:));
            } else if (action == @selector(copy:)) {
                return (action == @selector(copy:));
            }
        }break;
        case TestLabelType_Copy:{
            return (action == @selector(copy:));
        }break;
        default:
            break;
    }
    return NO;
}

- (void)copy:(id)sender {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = [self.text copy];
}

- (void)paste:(id)sender {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    self.text = [pboard.string copy];
}

- (void)handlerTap:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    }
}

#pragma -
#pragma mark - private method 

- (void)attachTapHandler {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPressGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlerTap:)];
    [self addGestureRecognizer:longPressGes];
}

@end

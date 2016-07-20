//
//  UITextField+ExtentRange.h
//  4位一空格的Nsstring的类别
//
//  Created by Minghui Sun on 16/7/20.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ExtentRange)

- (NSRange) selectedRange;
- (void) setSelectedRange:(NSRange) range;

@end

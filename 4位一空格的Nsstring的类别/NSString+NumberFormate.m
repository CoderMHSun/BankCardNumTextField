//
//  NSString+NumberFormate.m
//  4位一空格的Nsstring的类别
//
//  Created by Teplot_03 on 16/7/19.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "NSString+NumberFormate.h"

@implementation NSString (NumberFormate)

- (NSString *)orderWithCreditOrder {
    
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableString *orgStr = [NSMutableString stringWithString:string];
    NSInteger length = orgStr.length;
    
    NSInteger newLength = [self getTotalLengthWithOrgLength:length];
    
    for (int i = 0; i< (newLength-i-1)/4; i++) {
        
        [orgStr insertString:@" " atIndex:(5*i+4)];
        
    }
    
    return orgStr;
}

- (NSInteger)getTotalLengthWithOrgLength:(NSInteger)orgLength {
    NSInteger a = orgLength;
    
    a = (a-1)/4+a;
    
    return a;
}

@end

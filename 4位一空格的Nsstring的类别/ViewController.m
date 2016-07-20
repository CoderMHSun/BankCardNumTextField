//
//  ViewController.m
//  4位一空格的Nsstring的类别
//
//  Created by Teplot_03 on 16/7/19.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "ViewController.h"
#import "NSString+NumberFormate.h"
#import "UITextField+ExtentRange.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *tf = [[UITextField alloc] init];
    
    tf.backgroundColor = [UIColor lightGrayColor];
    
    tf.frame = CGRectMake(20, 30, 200, 40);
    
    tf.delegate = self;
    
    [self.view addSubview:tf];
    
    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //判断是否为删除符
    if ([string isEqualToString:@""]) {
        UITextPosition* beginning = textField.beginningOfDocument;
        UITextRange *selectedTextRange = textField.selectedTextRange;
        
        UITextPosition* selectionStart = selectedTextRange.start;
        UITextPosition* selectionEnd = selectedTextRange.end;
        
        const NSInteger location = [textField offsetFromPosition:beginning toPosition:selectionStart];
        const NSInteger length = [textField offsetFromPosition:selectionStart toPosition:selectionEnd];
        
        NSRange lastCharRange = NSMakeRange(location-1, length+1);
        
        
        NSString *lastChar = [textField.text substringWithRange:lastCharRange];
        //如果光标前一位是空格，那么没反应
        if ([lastChar isEqualToString:@" "]) {
            NSString *newString = [textField.text orderWithCreditOrder];
            textField.text = newString;
            return NO;
        }
        else {
            //如果前边一位不是空格，那么要删除前一位字符，并且再排序
            NSRange currentRange = [textField selectedRange];
            NSMutableString *oString = [NSMutableString stringWithString:textField.text];
            [oString replaceCharactersInRange:lastCharRange withString:@""];
            
            textField.text = [oString orderWithCreditOrder];
            [textField setSelectedRange:NSMakeRange(currentRange.location-1, currentRange.length)];
            return NO;
        }
        
    }
    
    //如果不是是删除
    //1.先获取当前光标位置
    NSRange selectedRange = [textField selectedRange];
    //2.将添加的字符添加到对应的光标位置
    
    NSMutableString *orgString = [NSMutableString stringWithString:textField.text];
    [orgString insertString:string atIndex:selectedRange.location];
    
    NSString *newString = [orgString orderWithCreditOrder];
    textField.text = newString;
    BOOL isAddSpace = newString.length%5 == 1 && newString.length!=1;
    
    NSRange newRange = NSMakeRange(selectedRange.location+(isAddSpace?2:1), selectedRange.length);
    
    [textField setSelectedRange:newRange];
    
    NSString *pointerLastChar = [newString substringWithRange:NSMakeRange(newRange.location-1, 1)];
    if ([pointerLastChar isEqualToString:@" "]) {
        [textField setSelectedRange:NSMakeRange(newRange.location-1, 0)];
    }
    
    return NO;
}

@end

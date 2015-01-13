//
//  FirstViewController.m
//  TabCalculators
//
//  Created by Stanley Ho on 1/5/15.
//  Copyright (c) 2015 Stan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    totalNumberString = @"";
    numberDisplay.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPlus:(id)sender;
{
    [self setOperand:1];
}

-(IBAction)buttonMinus:(id)sender;
{
    [self setOperand:2];
}

-(IBAction)buttonMultiply:(id)sender;
{
    [self setOperand:3];
}

-(IBAction)buttonDivide:(id)sender;
{
    [self setOperand:4];
}

-(IBAction)buttonEqual:(id)sender;
{
    if (operandSet == FALSE)
    {
        return;
    }
    
    if (operand == 1){
        total += [totalNumberString doubleValue];
    }
    else if (operand == 2){
        total -= [totalNumberString doubleValue];
    }
    else if (operand == 3){
        total *= [totalNumberString doubleValue];
    }
    else if (operand == 4){
        total /= [totalNumberString doubleValue];
    }

    totalNumberString = [NSString stringWithFormat:@"%f", total];

    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *formattedString = [formatter stringFromNumber:@(total)];
    
    numberDisplay.text = formattedString;

    operandSet = FALSE;
}

-(IBAction)buttonClear:(id)sender;
{
    total = 0;
    totalNumberString = @"";
    operandSet = FALSE;
    
    numberDisplay.text = [NSString stringWithFormat:@"%i", (int)total];
}

-(IBAction)buttonNumber:(UIButton*)number;
{
    int digit = (int)number.tag;
   
    NSString *singleDigitString = [NSString stringWithFormat:@"%i", digit];
    totalNumberString = [totalNumberString stringByAppendingString:singleDigitString];
    
    numberDisplay.text = totalNumberString;
    
}

-(void)setOperand:(int)number{
    operand = number;
    total = [totalNumberString doubleValue];
    totalNumberString = @"";
    
    operandSet = TRUE;
    
}

@end

//
//  FirstViewController.h
//  TabCalculators
//
//  Created by Stanley Ho on 1/5/15.
//  Copyright (c) 2015 Stan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    int operand;
    double total;
    NSString *totalNumberString;
    BOOL operandSet;
    
    IBOutlet UILabel *numberDisplay;
}

-(IBAction)buttonPlus:(id)sender;
-(IBAction)buttonMinus:(id)sender;
-(IBAction)buttonMultiply:(id)sender;
-(IBAction)buttonDivide:(id)sender;
-(IBAction)buttonEqual:(id)sender;
-(IBAction)buttonClear:(id)sender;
-(IBAction)buttonNumber:(UIButton*)number;





@end


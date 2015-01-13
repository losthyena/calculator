//
//  SecondViewController.m
//  TabCalculators
//
//  Created by Stanley Ho on 1/5/15.
//  Copyright (c) 2015 Stan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Programtically set all labels
    labelTitle.text = @"Future Value Calculator";
    
    labelStartingBalance.text = @"Starting balance";
    labelAnnualRateOfReturn.text = @"Annual return rate %";
    labelAmtYearlyContribution.text = @"Yearly contribution $";
    labelNumContributionYears.text = @"Contribution years";
    labelNumFutureYears.text = @"Investment worth in";
    labelFutureValue.text = @"$0";
   
    textFieldStartingBalance.placeholder = @"$0";
    textFieldAnnualRateOfReturn.placeholder = @"0%";
    textFieldAmtYearlyContribution.placeholder = @"$0";
    textFieldNumContributionYears.placeholder = @"0 years";
    textFieldNumFutureYears.placeholder = @"0 years";
    
    [btnCalculate setTitle:@"Calculate" forState:UIControlStateNormal];
    [btnClear setTitle:@"Clear" forState:UIControlStateNormal];
    
    // Set keypad type to number pad
    [textFieldStartingBalance setKeyboardType:UIKeyboardTypeNumberPad];
    [textFieldAnnualRateOfReturn setKeyboardType:UIKeyboardTypeNumberPad];
    [textFieldAmtYearlyContribution setKeyboardType:UIKeyboardTypeNumberPad];
    [textFieldNumContributionYears setKeyboardType:UIKeyboardTypeNumberPad];
    [textFieldNumFutureYears setKeyboardType:UIKeyboardTypeNumberPad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonCalculate:(id)sender;
{
    if ([textFieldStartingBalance.text isEqualToString:@""] ||
        [textFieldAnnualRateOfReturn.text isEqualToString:@""] ||
        [textFieldAmtYearlyContribution.text isEqualToString:@""] ||
        [textFieldNumContributionYears.text isEqualToString:@""] ||
        [textFieldNumFutureYears.text isEqualToString:@""]){
        labelFutureValue.text = @"Error: Missing values";
        return;
    }
    
    [self getIntValues];

    [self calculateFormula];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    NSString *formattedValue = [formatter stringFromNumber:@(dFvFinalBalance)];
     
    labelFutureValue.text = [NSString stringWithFormat:@"%i-year value is: $%@", iNumFutureYears, formattedValue];
}

-(IBAction)buttonClear:(id)sender;
{
    labelFutureValue.text = @"$0";
    [self clearTextFields];
    
}

// 
-(void)clearTextFields;
{
    labelFutureValue.text = @"$0";
    textFieldStartingBalance.text = @"";
    textFieldAnnualRateOfReturn.text = @"";
    textFieldAmtYearlyContribution.text = @"";
    textFieldNumContributionYears.text = @"";
    textFieldNumFutureYears.text = @"";
}

- (void)getIntValues;
{
    dStartingBalance = [textFieldStartingBalance.text doubleValue];
    dAnnualRateOfReturn = [textFieldAnnualRateOfReturn.text doubleValue];
    dAmtYearlyContribution = [textFieldAmtYearlyContribution.text doubleValue];
    iNumContributionYears = [textFieldNumContributionYears.text intValue];
    iNumFutureYears = [textFieldNumFutureYears.text intValue];

}

- (void)calculateFormula;
{
    BOOL needSecondCalculation;
    double dRemainingYearsAfterContribution = 0;
    
    //Get the number of years to use in future value calculations.
    double dTime;
    
    if (iNumContributionYears <= iNumFutureYears){
        dTime = iNumContributionYears;
        needSecondCalculation = YES;
        dRemainingYearsAfterContribution = iNumFutureYears - iNumContributionYears;
    } else {
        dTime = iNumFutureYears;
    }

    
    //Calculate interest rate
    double dInterestRate = dAnnualRateOfReturn/100;
    
    //FV compound interest calcuation on the starting balance
    double dFvBalanceLumpSum = dStartingBalance*pow((1 + dInterestRate),dTime);

    //FV compound interest calculation on the monthly contributions
    double dFvBalanceContributions = (dAmtYearlyContribution)*((pow((1+dInterestRate),dTime+1) - (1+dInterestRate)) / dInterestRate);
    

    //Add the FV of the lump sum and the yearly contributions
    dFvFinalBalance = dFvBalanceLumpSum + dFvBalanceContributions;
    
    if (needSecondCalculation){
          dFvFinalBalance = dFvFinalBalance*pow((1 + dInterestRate),dRemainingYearsAfterContribution);
    }
}




//Escape the keypad if user touches the view
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end

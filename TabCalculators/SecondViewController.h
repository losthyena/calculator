//
//  SecondViewController.h
//  TabCalculators
//
//  Created by Stanley Ho on 1/5/15.
//  Copyright (c) 2015 Stan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

{
    IBOutlet UILabel *labelTitle;
    IBOutlet UILabel *labelStartingBalance;
    IBOutlet UILabel *labelAnnualRateOfReturn;
    IBOutlet UILabel *labelAmtYearlyContribution;
    IBOutlet UILabel *labelNumContributionYears;
    IBOutlet UILabel *labelNumFutureYears;
    IBOutlet UILabel *labelFutureValue;
    
    IBOutlet UITextField *textFieldStartingBalance;
    IBOutlet UITextField *textFieldAnnualRateOfReturn;
    IBOutlet UITextField *textFieldAmtYearlyContribution;
    IBOutlet UITextField *textFieldNumContributionYears;
    IBOutlet UITextField *textFieldNumFutureYears;
    
    IBOutlet UIButton *btnCalculate;
    IBOutlet UIButton *btnClear;
    
    double dStartingBalance;
    double dAnnualRateOfReturn;
    double dAmtYearlyContribution;
    double dFvFinalBalance;
    int iNumContributionYears;
    int iNumFutureYears;
}

-(IBAction)buttonCalculate:(id)sender;
-(IBAction)buttonClear:(id)sender;

@end


//
//  TipViewController.m
//  tipDemo
//
//  Created by Sudip Shah on 6/4/14.
//  Copyright (c) 2014 Sudip. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Title for Navigation
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    //NSLog(@"TipViewController viewDidLoad");
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    //NSLog(@"onTap");
    [self.view endEditing:YES];
    [self updateValues];
}

// Update values for calculation
- (void)updateValues {
    
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    //NSLog(@"tipControl selected: %i", self.tipControl.selectedSegmentIndex);
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

// When Settings button is clicked
- (void)onSettingsButton {
    
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    //NSLog(@"View will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSLog(@"The defaul tipControl is %i", [defaults integerForKey:@"defaultTip"] );
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"defaultTip"];
}

- (void)viewDidAppear:(BOOL)animated {
    //NSLog(@"View did appear");
}

-(void)viewWillDisappear:(BOOL)animated {
    //NSLog(@"View will Disappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    //NSLog(@"View did disappear");
}

@end

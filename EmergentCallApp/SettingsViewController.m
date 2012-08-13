//
//  SettingsViewController.m
//  EmergentCallApp
//
//  Created by Tai Ken on 12/5/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "MainViewController.h"
#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize telTextField;
@synthesize pickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initBarButtonItem{
    UIBarButtonItem * save = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveHandler:)];
    self.tabBarController.navigationItem.rightBarButtonItem = save;
    telTextField.keyboardType = UIKeyboardTypePhonePad;
    [save release];
}
- (void)initView{
    telTextField.delegate = self;
    pickerView.delegate= self;
    pickerView.dataSource = self;
    list = [[NSArray alloc] initWithObjects:@"112",@"Special",@"Home",@"Lover",nil];
    [self initBarButtonItem];
    NSInteger selected =  [pickerView selectedRowInComponent:0];
    [self pickerView:nil didSelectRow:selected inComponent:0];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void) saveHandler:(id)sender{
    [telTextField resignFirstResponder];
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    NSInteger selected =  [pickerView selectedRowInComponent:0];
    //NSLog(@"%d", selected);
    switch (selected) {
//        case 0:
//            [ud setObject:telTextField.text forKey:KEY_110];
//            
//            break;
//        case 2:
//            [ud setObject:telTextField.text forKey:KEY_119];
//
//            break;
        case 2:
            [ud setObject:telTextField.text forKey:KEY_HOME];

            break;
        case 3:
            [ud setObject:telTextField.text forKey:KEY_LOVER];

            break;
        case 1:
            [ud setObject:telTextField.text forKey:KEY_SP];
            
            break;
        case 0:
            [ud setObject:telTextField.text forKey:KEY_112];
            
            break;
        default:
            break;
    }

    [ud synchronize];

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [list count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [list objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    NSString *tel = nil;
    switch (row) {
//        case 0:
//            tel = [ud objectForKey:KEY_110];
//            break;
//        case 2:
//            tel = [ud objectForKey:KEY_119];
//            break;
        case 2:
            tel = [ud objectForKey:KEY_HOME];
            break;
        case 3:
            tel = [ud objectForKey:KEY_LOVER];
            break;
        case 1:
            tel = [ud objectForKey:KEY_SP];
            break;
        case 0:
            tel = [ud objectForKey:KEY_112];
            break;
        default:
            break;
    }
    if(tel){
        telTextField.text = tel;
    }else{
        telTextField.text = @"";
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTelTextField:nil];
    [self setPickerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [telTextField release];
    [pickerView release];
    [list release];
    [super dealloc];
}
@end

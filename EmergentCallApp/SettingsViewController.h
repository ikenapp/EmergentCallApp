//
//  SettingsViewController.h
//  EmergentCallApp
//
//  Created by Tai Ken on 12/5/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SettingsViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
    NSArray *list;
}
@property (retain, nonatomic) IBOutlet UITextField *telTextField;
@property (retain, nonatomic) IBOutlet UIPickerView *pickerView;
- (void)initBarButtonItem;
@end

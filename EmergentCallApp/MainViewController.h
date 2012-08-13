//
//  MainViewController.h
//  EmergentCallApp
//
//  Created by Tai Ken on 12/5/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KEY_110 @"110"
#define KEY_119 @"119"
#define KEY_HOME @"HOME"
#define KEY_LOVER @"LOVER"
#define KEY_112 @"112"
#define KEY_SP @"SPECIAL"
@interface MainViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *img112;

@property (retain, nonatomic) IBOutlet UIImageView *imgHome;
@property (retain, nonatomic) IBOutlet UIImageView *imgSp;

@property (retain, nonatomic) IBOutlet UIImageView *imgLover;
@end

//
//  MainViewController.m
//  EmergentCallApp
//
//  Created by Tai Ken on 12/5/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize img112;
@synthesize imgHome;
@synthesize imgSp;
@synthesize imgLover;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) initView{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"110" forKey:KEY_110];
    [ud setObject:@"112" forKey:KEY_112];
    [ud setObject:@"119" forKey:KEY_119];
    [ud synchronize];
    img112.userInteractionEnabled = YES;
    imgHome.userInteractionEnabled = YES;
    imgLover.userInteractionEnabled = YES;
    imgSp.userInteractionEnabled = YES;

    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    [img112 addGestureRecognizer:longPress];
    UILongPressGestureRecognizer * longPress1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    [imgHome addGestureRecognizer:longPress1];
    UILongPressGestureRecognizer * longPress2 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    [imgLover addGestureRecognizer:longPress2];
    UILongPressGestureRecognizer * longPress3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    [imgSp addGestureRecognizer:longPress3];
    longPress.minimumPressDuration = 0.3;
    longPress1.minimumPressDuration = 0.3;
    longPress2.minimumPressDuration = 0.3;
    longPress3.minimumPressDuration = 0.3;
    [longPress release];
    [longPress1 release];
    [longPress2 release];
    [longPress3 release];
}

- (void)longPressHandler:(UILongPressGestureRecognizer *) sender {
    //NSLog(@"longPressHandler");
    if(sender.state == UIGestureRecognizerStateBegan){
        NSString * tel=nil;
        NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
        NSString * msg = nil;
        if(sender.view == imgHome){
            tel = [ud objectForKey:KEY_HOME];
            msg = @"Home telephone number not set yet!";
        }else if(sender.view == imgLover){
            tel = [ud objectForKey:KEY_LOVER];
            msg = @"Lover's telephone number not set yet!";
        }else if(sender.view == img112){
            tel = [ud objectForKey:KEY_112];
            msg = @"112's telephone number not set yet!";
        }else if(sender.view == imgSp){
            tel = [ud objectForKey:KEY_SP];
            msg = @"Special contact's telephone number not set yet!";
        }
        
        if(tel){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",tel]]];
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Information" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [alert release];
        }

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

    [self setImgHome:nil];
    [self setImg112:nil];
    [self setImgSp:nil];
    [self setImgLover:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc {
    [imgHome release];
    [img112 release];
    [imgSp release];
    [imgLover release];
    [super dealloc];
}
@end

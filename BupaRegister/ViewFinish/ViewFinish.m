//
//  ViewFinish.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "ViewFinish.h"
#import "API.h"

@implementation ViewFinish

@synthesize mImage;
@synthesize mLabelName;
@synthesize mLabelCompany;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    API *a = [API getAPI];
    
    [mImage setImage:a.mImageCurrent];
    
    [mLabelName setText:[NSString stringWithFormat:@"%@ %@", a.mUserName, a.mUserSurname]];
    [mLabelCompany setText:a.mUserCompany];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickDone:(id)sender {
    API *a = [API getAPI];
    [a addUser];
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

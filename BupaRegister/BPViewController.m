//
//  BPViewController.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "BPViewController.h"
#import "ViewSearch.h"

@implementation BPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"GotoSearch0"]) {
        ViewSearch *v = [segue destinationViewController];
        v.mType = 0;
    }

    else if ([[segue identifier] isEqualToString:@"GotoSearch1"]) {
        ViewSearch *v = [segue destinationViewController];
        v.mType = 1;
    }

    else if ([[segue identifier] isEqualToString:@"GotoSearch2"]) {
        ViewSearch *v = [segue destinationViewController];
        v.mType = 2;
    }


}

@end

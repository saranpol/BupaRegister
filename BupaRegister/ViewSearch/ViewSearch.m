//
//  ViewSearch.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "ViewSearch.h"

#import "CellSearch.h"

@implementation ViewSearch

@synthesize mType;
@synthesize mImage0;
@synthesize mImage1;
@synthesize mImage2;
@synthesize mTextField;
@synthesize mTableView;



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
    
    [mTextField becomeFirstResponder];
    [self updateType];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)updateType {
    [mImage0 setHidden:YES];
    [mImage1 setHidden:YES];
    [mImage2 setHidden:YES];
    
    switch (mType) {
        case 0:
            [mImage0 setHidden:NO];
            break;
        case 1:
            [mImage1 setHidden:NO];
            break;
        case 2:
            [mImage2 setHidden:NO];
            break;
    }
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellSearch *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSearch" forIndexPath:indexPath];
    return cell;
}




- (IBAction)clickBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

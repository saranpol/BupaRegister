//
//  ViewReport.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "ViewReport.h"
#import "API.h"
#import "CellReport.h"

@implementation ViewReport

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




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    API *a = [API getAPI];
    NSMutableArray *userArray = [a getObject:M_USER_ARRAY];
    if(userArray){
        return [userArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellReport *cell = [tableView dequeueReusableCellWithIdentifier:@"CellReport" forIndexPath:indexPath];
    cell.mTableView = mTableView;
    cell.mIndex = indexPath.row;
    
    API *a = [API getAPI];
    NSMutableArray *userArray = [a getObject:M_USER_ARRAY];
    
    NSDictionary *d = [userArray objectAtIndex:indexPath.row];
    
    [cell.mLabelNumber setText:[NSString stringWithFormat:@"%ld", (long)(indexPath.row+1)]];
    
    NSString *name = [d objectForKey:@"name"];
    NSString *surname = [d objectForKey:@"surname"];
    [cell.mImageView setImage:[a loadImage:[d objectForKey:@"photo"]]];
    [cell.mLabelName setText:name];
    [cell.mLabelSurname setText:surname];
    switch ([[d objectForKey:@"type"] integerValue]) {
        case 1:
            [cell.mLabelType setText:TYPE_1];
            break;
        case 2:
            [cell.mLabelType setText:TYPE_2];
            break;
        case 4:
            [cell.mLabelType setText:TYPE_4];
            break;
    }
    
    [cell.mLabelCompany setText:[d objectForKey:@"company"]];
    [cell.mLabelTel setText:[d objectForKey:@"tel"]];
    [cell.mLabelEmail setText:[d objectForKey:@"email"]];
    
    return cell;
}




- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end

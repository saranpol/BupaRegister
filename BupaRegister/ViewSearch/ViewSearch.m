//
//  ViewSearch.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "ViewSearch.h"
#import "API.h"
#import "CellSearch.h"

@implementation ViewSearch

@synthesize mType;
@synthesize mImage0;
@synthesize mImage1;
@synthesize mImage2;
@synthesize mTextField;
@synthesize mTableView;
@synthesize mArrayFilter;


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

- (BOOL)containString:(NSString*)s text:(NSString*)text array:(NSMutableArray*)array item:(NSDictionary*)item {
    // fix can't find พ in พีระ
    NSString *s1 = [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *s2 = [s stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if([s1 rangeOfString:s2].location != NSNotFound){
        [array addObject:item];
        return YES;
    }
    return NO;
}

- (void)filterData {
    NSString *q = mTextField.text;
    if(!q || ([q length]==0)){
        self.mArrayFilter = nil;
        [mTableView reloadData];
        return;
    }
    
    self.mArrayFilter = [NSMutableArray new];
    
    API *a = [API getAPI];
    
    for(NSDictionary *u in a.mArraySearchUser){
        if([[u objectForKey:@"type"] integerValue] != mType)
            continue;
        if([self containString:q text:[u objectForKey:@"company"] array:mArrayFilter item:u])
            continue;

        NSString *name = [u objectForKey:@"name"];
        NSString *surname = [u objectForKey:@"surname"];
        NSString *fullName = [NSString stringWithFormat:@"%@ %@", name, surname];
        if([self containString:q text:fullName array:mArrayFilter item:u])
            continue;

        if([self containString:q text:[u objectForKey:@"email"] array:mArrayFilter item:u])
            continue;

        
//        if([self containString:q text:[u objectForKey:@"email"] array:mArrayFilter item:u])
//            continue;
//        if([self containString:q text:[u objectForKey:@"tel"] array:mArrayFilter item:u])
//            continue;
    }
    
    [mTableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mArrayFilter ? [mArrayFilter count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellSearch *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSearch" forIndexPath:indexPath];

    NSDictionary *d = [mArrayFilter objectAtIndex:indexPath.row];
    NSString *company = [d objectForKey:@"company"];
    NSString *email = [d objectForKey:@"email"];
    if(company)
        [cell.mLabelCompany setText:company];
    if(email)
        [cell.mLabelName setText:email];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    API *a = [API getAPI];
    
    
    NSDictionary *d = [mArrayFilter objectAtIndex:indexPath.row];
    
    a.mUserCompany = [d objectForKey:@"company"];
    a.mUserName = [d objectForKey:@"name"];
    a.mUserSurname = [d objectForKey:@"surname"];
    a.mUserTel = [d objectForKey:@"tel"];
    a.mUserEmail = [d objectForKey:@"email"];
    a.mUserType = mType;
    
    //[a takePhoto:self];
    
    [self performSegueWithIdentifier:@"GotoViewInputFromSearch" sender:self];
    
}


- (IBAction)textChange:(id)sender {
    [self filterData];
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}













- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    API *a = [API getAPI];
    [a savePhoto:info];
    [self performSegueWithIdentifier:@"GotoViewFinish" sender:self];
}






@end

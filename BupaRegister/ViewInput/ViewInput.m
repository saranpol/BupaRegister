//
//  ViewInput.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "ViewInput.h"
#import "API.h"


@implementation ViewInput

@synthesize mType;
@synthesize mTextFieldType;
@synthesize mTextFieldCompany;
@synthesize mTextFieldName;
@synthesize mTextFieldSurname;
@synthesize mTextFieldTel;
@synthesize mTextFieldEmail;



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
    
    UIPickerView *v = [UIPickerView new];
    v.dataSource = self;
    v.delegate = self;
    v.showsSelectionIndicator = YES;
    mTextFieldType.inputView = v;
    
    [mTextFieldType setText:TYPE_1];
    
    API *a = [API getAPI];
    if(a.mUserType == 2)
        [mTextFieldType setText:TYPE_2];
//    if(a.mUserType == 3)
//        [mTextFieldType setText:TYPE_3];
    
    if(a.mUserCompany)
        mTextFieldCompany.text = a.mUserCompany;
    if(a.mUserName)
        mTextFieldName.text = a.mUserName;
    if(a.mUserSurname)
        mTextFieldSurname.text = a.mUserSurname;
    if(a.mUserTel)
        mTextFieldTel.text = a.mUserTel;
    if(a.mUserEmail)
        mTextFieldEmail.text = a.mUserEmail;
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
    
    switch (mType) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
    }
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




- (IBAction)clickBack:(id)sender {
    // Clear
    API *a = [API getAPI];
    a.mUserType = 1;
    a.mUserCompany = nil;
    a.mUserName = nil;
    a.mUserSurname = nil;
    a.mUserTel = nil;
    a.mUserEmail = nil;
    a.mUserPhotoPath = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickTakePhoto:(id)sender {
    API *a = [API getAPI];
    
    if([mTextFieldType.text isEqualToString:TYPE_1])
        a.mUserType = 1;
    if([mTextFieldType.text isEqualToString:TYPE_2])
        a.mUserType = 2;
//    if([mTextFieldType.text isEqualToString:TYPE_3])
//        a.mUserType = 3;
    
    a.mUserCompany = mTextFieldCompany.text;
    a.mUserName = mTextFieldName.text;
    a.mUserSurname = mTextFieldSurname.text;
    a.mUserTel = mTextFieldTel.text;
    a.mUserEmail = mTextFieldEmail.text;
    
    [a takePhoto:self];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    API *a = [API getAPI];
    [a savePhoto:info];
    [self performSegueWithIdentifier:@"GotoViewFinish" sender:self];
}


- (IBAction)clickPickType:(id)sender {
    [mTextFieldType becomeFirstResponder];
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return 3;
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row) {
        case 0:
            return TYPE_1;
        case 1:
            return TYPE_2;
//        case 2:
//            return TYPE_3;
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (row) {
        case 0:
            [mTextFieldType setText:TYPE_1];
            break;
        case 1:
            [mTextFieldType setText:TYPE_2];
            break;
//        case 2:
//            [mTextFieldType setText:TYPE_3];
//            break;
    }
    [mTextFieldType resignFirstResponder];
}

@end

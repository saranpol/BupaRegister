//
//  ViewInput.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewInput : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) NSInteger mType;
@property (nonatomic, weak) IBOutlet UITextField *mTextFieldType;
@property (nonatomic, weak) IBOutlet UITextField *mTextFieldCompany;
@property (nonatomic, weak) IBOutlet UITextField *mTextFieldName;
@property (nonatomic, weak) IBOutlet UITextField *mTextFieldSurname;
@property (nonatomic, weak) IBOutlet UITextField *mTextFieldTel;
@property (nonatomic, weak) IBOutlet UITextField *mTextFieldEmail;

- (IBAction)clickBack:(id)sender;
- (IBAction)clickTakePhoto:(id)sender;
- (IBAction)clickPickType:(id)sender;


@end

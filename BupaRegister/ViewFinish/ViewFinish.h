//
//  ViewFinish.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewFinish : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *mImage;
@property (nonatomic, weak) IBOutlet UILabel *mLabelName;
@property (nonatomic, weak) IBOutlet UILabel *mLabelCompany;

- (IBAction)clickDone:(id)sender;
- (IBAction)clickBack:(id)sender;

@end

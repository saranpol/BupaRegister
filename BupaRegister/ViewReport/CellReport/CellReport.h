//
//  CellReport.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellReport : UITableViewCell <UIAlertViewDelegate>

@property (nonatomic, weak) UITableView *mTableView;
@property (nonatomic, assign) NSInteger mIndex;
@property (nonatomic, weak) IBOutlet UIImageView *mImageView;
@property (nonatomic, weak) IBOutlet UILabel *mLabelNumber;
@property (nonatomic, weak) IBOutlet UILabel *mLabelType;
@property (nonatomic, weak) IBOutlet UILabel *mLabelName;
@property (nonatomic, weak) IBOutlet UILabel *mLabelSurname;
@property (nonatomic, weak) IBOutlet UILabel *mLabelCompany;
@property (nonatomic, weak) IBOutlet UILabel *mLabelTel;
@property (nonatomic, weak) IBOutlet UILabel *mLabelEmail;

- (IBAction)clickDelete:(id)sender;


@end

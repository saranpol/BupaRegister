//
//  ViewReport.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewReport : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *mTableView;

- (IBAction)clickBack:(id)sender;

@end

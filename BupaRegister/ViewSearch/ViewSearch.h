//
//  ViewSearch.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewSearch : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger mType;

@property (nonatomic, weak) IBOutlet UIImageView *mImage0;
@property (nonatomic, weak) IBOutlet UIImageView *mImage1;
@property (nonatomic, weak) IBOutlet UIImageView *mImage2;
@property (nonatomic, weak) IBOutlet UITextField *mTextField;
@property (nonatomic, weak) IBOutlet UITableView *mTableView;

- (IBAction)clickBack:(id)sender;

@end

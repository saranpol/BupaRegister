//
//  CellReport.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "CellReport.h"
#import "API.h"

@implementation CellReport
@synthesize mTableView;
@synthesize mIndex;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)clickDelete:(id)sender {
    UIAlertView *v = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Do you want to delete?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete"    , nil];
    [v show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0)
        return;
    
    API *a = [API getAPI];
    
    NSMutableArray *userArray = [a getObject:M_USER_ARRAY];
    [userArray removeObjectAtIndex:mIndex];
    [a saveObject:userArray forKey:M_USER_ARRAY];
    
    [mTableView reloadData];
    
}

@end

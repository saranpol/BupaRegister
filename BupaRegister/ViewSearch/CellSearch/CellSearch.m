//
//  CellSearch.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "CellSearch.h"

@implementation CellSearch

@synthesize mLabelCompany;
@synthesize mLabelName;


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

@end

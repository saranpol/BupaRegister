//
//  ViewExport.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewExport : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *mWebView;

- (IBAction)clickBack:(id)sender;

@end

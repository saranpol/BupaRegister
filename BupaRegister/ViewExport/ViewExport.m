//
//  ViewExport.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "ViewExport.h"
#import "API.h"

@implementation ViewExport

@synthesize mWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)localPath:(NSString*)s {
//    s = [s stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    return [@"file://localhost" stringByAppendingString:s];
    return [@"file://" stringByAppendingString:s];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    API *a = [API getAPI];
    NSMutableArray *userArray = [a getObject:M_USER_ARRAY];
    
    NSString *html = @"<html><body><table border=1><tr>\
    <td>No.</td>\
    <td>company</td>\
    <td>name</td>\
    <td>surname</td>\
    <td>tel</td>\
    <td>email</td>\
    <td>img</td>\
    <td>img path</td>\
    </tr>";
    
    NSInteger i = 1;
    for(NSDictionary *u in userArray){
        NSString *img = [self localPath:[a documentsPathForFileName:[u objectForKey:@"photo"]]];
        html = [html stringByAppendingString:[NSString stringWithFormat:@"<tr>\
                                              <td>%ld</td>\
                                              <td>%@</td>\
                                              <td>%@</td>\
                                              <td>%@</td>\
                                              <td>%@</td>\
                                              <td>%@</td>\
                                              <td><img width=50 height=50 src='%@'/></td>\
                                              <td>%@</td>\
                                              </tr>",
                                              (long)i++,
                                              [u objectForKey:@"company"],
                                              [u objectForKey:@"name"],
                                              [u objectForKey:@"surname"],
                                              [u objectForKey:@"tel"],
                                              [u objectForKey:@"email"],
                                              img,
                                              [u objectForKey:@"photo"]
                                              ]];
    }
    html = [html stringByAppendingString:@"</table></body></html>"];
    
    
    [mWebView loadHTMLString:html baseURL:nil];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self.navigationController popViewControllerAnimated:YES];
}

@end

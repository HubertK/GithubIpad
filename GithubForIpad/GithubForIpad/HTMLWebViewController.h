//
//  HTMLWebViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HTMLWebViewController : UIViewController<UIWebViewDelegate>
@property (strong,nonatomic) NSString *address;
@property (strong,nonatomic) NSString *content;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *titleOfDocument;
@property (strong, nonatomic) NSString *autor;
@property (weak, nonatomic) IBOutlet UILabel *docTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *autorLabel;
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
- (IBAction)done:(id)sender;
- (void)reloadWeb:(NSString*)aString;
@end

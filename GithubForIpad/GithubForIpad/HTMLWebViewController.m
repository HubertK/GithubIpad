//
//  HTMLWebViewController.m
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "HTMLWebViewController.h"

@implementation HTMLWebViewController
@synthesize docTitleLabel;
@synthesize autorLabel;
@synthesize myWebView,address,content,language,titleOfDocument,autor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  //  self.myWebView.scrollView.bounces = NO;
    self.myWebView.scrollView.layer.cornerRadius = 20;
    self.myWebView.layer.cornerRadius = 20;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationReceived:) name:@"dismissView" object:nil];
  
    self.autorLabel.text = self.autor;
    self.docTitleLabel.text = self.titleOfDocument;
   [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.address]]]; 
   
      [super viewDidLoad];
}
- (void)notificationReceived:(NSNotification*)notification{
    NSLog(@"DISMISS NOTIFICATION");
    [self dismissModalViewControllerAnimated:NO];
}

- (void)viewDidUnload
{
    [self setMyWebView:nil];
    [self setDocTitleLabel:nil];
    [self setAutorLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if ([self.content length] <= 0) {
        self.content = [myWebView stringByEvaluatingJavaScriptFromString:@"document.documentElement.textContent"];
        [self reloadWeb:self.content];
    }


}

- (void)reloadWeb:(NSString*)aString{
    NSLog(@"Content=%@",aString);
    NSString *htmlstring = [NSString stringWithFormat:@"<html><head><link href=\"prettify.css\" type=\"text/css\" rel=\"stylesheet\" /><script type=\"text/javascript\" src=\"prettify.js\"></script></head><body onload=\"prettyPrint()\"><pre class=\"prettyprint\">%@</pre></html>",aString];
       
//    NSString *htmlstring2 = [NSString stringWithFormat:@"<html><head><link href='http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.css' rel='stylesheet' type='text/css'/><script src='http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.js' type='text/javascript'/></head><body>onload=\"prettyPrint()\" </body><pre class=\"prettyprint\">%@</pre></html>",aString];
                             
                          
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [myWebView loadHTMLString:htmlstring baseURL:baseURL];
}















@end

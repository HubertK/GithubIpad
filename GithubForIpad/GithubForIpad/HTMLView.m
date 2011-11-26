//
//  HTMLView.m
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "HTMLView.h"
#import "NSAttributedString+Attributes.h"

@implementation HTMLView
@synthesize label1;
@synthesize address;
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
    NSString *UString = self.address;
    NSURL *URL = [NSURL URLWithString:UString];
    NSLog(@"ADDRESS:%@",self.address);
    NSString *one = [NSString stringWithContentsOfURL:URL];
	NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:one];
	// for those calls we don't specify a range so it affects the whole string
	[attrStr setFont:[UIFont fontWithName:@"Helvetica" size:18]];
	[attrStr setTextColor:[UIColor grayColor]];
    
//	// now we only change the color of "Hello"
//	[attrStr setTextColor:[UIColor colorWithRed:0.f green:0.f blue:0.5 alpha:1.f] range:[txt rangeOfString:@TXT_BOLD]];
//	[attrStr setTextBold:YES range:[txt rangeOfString:@TXT_BOLD]];
	
	/**(2)** Affect the NSAttributedString to the OHAttributedLabel *******/
	label1.attributedText = attrStr;
	// and add a link to the "share your food!" text
//	[label1 addCustomLink:[NSURL URLWithString:@"http://www.foodreporter.net"] inRange:[txt rangeOfString:@TXT_LINK]];
    
	// Use the "Justified" alignment
	label1.textAlignment = UITextAlignmentJustify;
	// "Hello World!" will be displayed in the label, justified, "Hello" in red and " World!" in gray.	

    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [self setLabel1:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end

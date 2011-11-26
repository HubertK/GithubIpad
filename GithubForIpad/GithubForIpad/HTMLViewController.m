//
//  HTMLViewController.m
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "HTMLViewController.h"
#import "NSAttributedString+Attributes.h"
#import "Highlighting.h"

@implementation HTMLViewController
@synthesize label1,address;

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
    
//    NSString *UString = self.address;
    NSURL *URL = [NSURL URLWithString:self.address];
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
	[self fillLabel1];
    [super viewDidLoad];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
-(IBAction)fillLabel1 {
	 NSMutableArray *array5 = [[NSMutableArray alloc]initWithObjects:@"auto",@"char",@"const",@"double",@"float",@"int",@"long",@"register",@"short",@"signed",@"sizeof",@"static",@"string",@"struct",@"typedef",@"union",@"unsigned",@"void",@"volatile",@"extern",@"jmp_buf",@"signal",@"raise",@"va_list",@"ptrdiff_t",@"size_t",@"FILE",@"fpos_t",@"div_t",@"ldiv_t",@"clock_t",@"time_t",@"tm",@"SEL",@"id",@"NSRect",@"NSRange",@"NSPoint",@"NSZone",@"Class",@"IMP",@"BOOL",@"@selector",@"@class",@"@protocol",@"@interface",@"@implementation",@"@end",@"@private",@"@protected",@"@public",@"@try",@"@throw",@"@catch",@"@finally",@"@encode",@"@defs",@"@synchronized",@"@synthesize",@"@dynamic", nil];
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithObjects:@"NSAppleEventManager",@"NSNetServiceBrowser",@"NSAppleScript",@"NSNotification",@"NSArchiver",@"NSNotificationCenter",@"NSArray",@"NSNotificationQueue",@"NSAssertionHandler",@"NSNull",@"NSAttributedString",@"NSNumber",@"NSAutoreleasePool",@"NSNumberFormatter",@"NSBundle",@"NSObject",@"NSCachedURLResponse",@"NSOutputStream",@"NSCalendarDate",@"NSPipe",@"NSCharacterSet",@"NSPort",@"NSClassDescription",@"NSPortCoder",@"NSCloneCommand",@"NSPortMessage",@"NSCloseCommand",@"NSPortNameServer",@"NSCoder",@"NSPositionalSpecifier",@"NSConditionLock",@"NSProcessInfo",@"NSConnection",@"NSPropertyListSerialization",@"NSCountCommand",@"NSPropertySpecifier",@"NSCountedSet",@"NSProtocolChecker",@"NSCreateCommand",@"NSProxy",@"NSData",@"NSQuitCommand",@"NSDate",@"NSRandomSpecifier",@"NSDateFormatter",@"NSRangeSpecifier",@"NSDecimalNumber",@"NSRecursiveLock",@"NSDecimalNumberHandler",@"NSRelativeSpecifier",@"NSDeleteCommand",@"NSRunLoop",@"NSDeserializer",@"NSScanner",@"NSDictionary",@"NSScriptClassDescription",@"NSDirectoryEnumerator",@"NSScriptCoercionHandler",@"NSDistantObject",@"NSScriptCommand",@"NSDistantObjectRequest",@"NSScriptCommandDescription",@"NSDistributedLock",@"NSScriptExecutionContext",@"NSDistributedNotificationCenter",@"NSScriptObjectSpecifier",@"NSEnumerator",@"NSScriptSuiteRegistry",@"NSError",@"NSScriptWhoseTest",@"NSException",@"NSSerializer",@"NSExistsCommand",@"NSSet",@"NSFileHandle",@"NSSetCommand",@"NSFileManager",@"NSSocketPort",@"NSFormatter",@"NSSocketPortNameServer",@"NSGetCommand",@"NSSortDescriptor",@"NSHost",@"NSSpecifierTest",@"NSHTTPCookie",@"NSSpellServer",@"NSHTTPCookieStorage",@"NSStream",@"NSHTTPURLResponse",@"NSString",@"NSIndexSet",@"NSTask",@"NSIndexSpecifier",@"NSThread",@"NSInputStream",@"NSTimer",@"NSInvocation",@"NSTimeZone",@"NSKeyedArchiver",@"NSUnarchiver",@"NSKeyedUnarchiver",@"NSUndoManager",@"NSLock",@"NSUniqueIDSpecifier",@"NSLogicalTest",@"NSURL",@"NSMachBootstrapServer",@"NSURLAuthenticationChallenge",@"NSMachPort",@"NSURLCache",@"NSMessagePort",@"NSURLConnection",@"NSMessagePortNameServer",@"NSURLCredential",@"NSMethodSignature",@"NSURLCredentialStorage",@"NSMiddleSpecifier",@"NSURLDownload",@"NSMoveCommand",@"NSURLHandle",@"NSMutableArray",@"NSURLProtectionSpace",@"NSMutableAttributedString",@"NSURLProtocol",@"NSMutableCharacterSet",@"NSURLRequest",@"NSMutableData",@"NSURLResponse",@"NSMutableDictionary",@"NSUserDefaults",@"NSMutableIndexSet",@"NSValue",@"NSMutableSet",@"NSValueTransformer",@"NSMutableString",@"NSWhoseSpecifier",@"NSMutableURLRequest",@"NSXMLParser",@"NSNameSpecifier", nil];
//    
//    NSString *UString = @"http://github.com/api/v2/json/blob/show/HubertK/Dosage-Repo/0cd6d8a178b68bf3106ef7117921ae78ceb0b221";
    NSURL *URL = [NSURL URLWithString:self.address];
    NSString *one = [NSString stringWithContentsOfURL:URL];
	NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:one];
	// for those calls we don't specify a range so it affects the whole string
	[attrStr setFont:[UIFont fontWithName:@"Helvetica" size:18]];
	[attrStr setTextColor:[UIColor grayColor]];
    
	// now we only change the color of "Hello"
    for (NSString *str in array5) {
        if ([one substringWithRange:[one rangeOfString:str]]) {
            [attrStr setTextColor:[UIColor colorWithRed:0.f green:0.f blue:0.5 alpha:1.f] range:[one rangeOfString:str]];
        }
       // [attrStr setTextColor:[UIColor colorWithRed:0.f green:0.f blue:0.5 alpha:1.f] range:[one rangeOfString:str]];
    }
    for (NSString *str in array1) {
        [attrStr setTextColor:[UIColor colorWithRed:0.5 green:0.f blue:0.f alpha:1.f] range:[one rangeOfString:str]];
    }
    
    //	[attrStr setTextBold:YES range:[txt rangeOfString:@TXT_BOLD]];
	
	/**(2)** Affect the NSAttributedString to the OHAttributedLabel *******/
	label1.attributedText = attrStr;
	// and add a link to the "share your food!" text
    //	[label1 addCustomLink:[NSURL URLWithString:@"http://www.foodreporter.net"] inRange:[txt rangeOfString:@TXT_LINK]];
    
	// Use the "Justified" alignment
	label1.textAlignment = UITextAlignmentJustify;
	// "Hello World!" will be displayed in the label, justified, "Hello" in red and " World!" in gray.	
}
-(NSString*)checkString:(NSString *)astring{
    NSString *retString;
    
    NSMutableArray *array5 = [[NSMutableArray alloc]initWithObjects:@"auto",@"char",@"const",@"double",@"float",@"int",@"long",@"register",@"short",@"signed",@"sizeof",@"static",@"string",@"struct",@"typedef",@"union",@"unsigned",@"void",@"volatile",@"extern",@"jmp_buf",@"signal",@"raise",@"va_list",@"ptrdiff_t",@"size_t",@"FILE",@"fpos_t",@"div_t",@"ldiv_t",@"clock_t",@"time_t",@"tm",@"SEL",@"id",@"NSRect",@"NSRange",@"NSPoint",@"NSZone",@"Class",@"IMP",@"BOOL",@"@selector",@"@class",@"@protocol",@"@interface",@"@implementation",@"@end",@"@private",@"@protected",@"@public",@"@try",@"@throw",@"@catch",@"@finally",@"@encode",@"@defs",@"@synchronized", nil];
    
    for (int i = 0; i < [array5 count]; i++) {
        if ([astring isEqualToString:[array5 objectAtIndex:i]]) {
            retString = [array5 objectAtIndex:i];
            return retString;
            continue;
        }
    }
    if ([retString length] <= 0) {
        retString = @"NSString";
    }
    return retString;
}


@end

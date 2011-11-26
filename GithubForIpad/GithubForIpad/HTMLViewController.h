//
//  HTMLViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OHAttributedLabel.h"
@interface HTMLViewController : UIViewController<OHAttributedLabelDelegate>

@property (weak, nonatomic) IBOutlet OHAttributedLabel *label1;
@property (strong, nonatomic) NSString *address;

-(IBAction)fillLabel1;
-(NSString*)checkString:(NSString *)astring;
@end

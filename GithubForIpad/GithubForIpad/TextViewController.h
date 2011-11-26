//
//  TextViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *fileTextView;
@property (strong, nonatomic) NSString *textFile;
@end

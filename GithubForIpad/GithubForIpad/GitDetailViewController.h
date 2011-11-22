//
//  GitDetailViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GitDetailViewController : UIViewController <UISplitViewControllerDelegate,UITextFieldDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *repositorySearchField;


- (IBAction)beginsearchingForRepository:(id)sender;
- (void)searchGithubFor:(NSString *)query;
- (void)fetchedData:(NSData *)responseData;
- (IBAction)repositoryTextDidChange:(id)sender;
@end

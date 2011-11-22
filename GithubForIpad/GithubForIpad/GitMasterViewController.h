//
//  GitMasterViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GitDetailViewController;

@interface GitMasterViewController : UITableViewController

@property (strong, nonatomic) GitDetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *resultsArray;
@end

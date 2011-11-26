//
//  CommitsViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//


#import <UIKit/UIKit.h>
@class GitDetailViewController;

@interface CommitsViewController : UITableViewController<UIAlertViewDelegate>
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *repository;
@property (strong, nonatomic) NSString *tree_sha;
@property (strong, nonatomic) NSString *file;
@property (strong, nonatomic) NSMutableDictionary *fileData;
@property (strong, nonatomic) NSMutableDictionary *JSONResults;
@property (nonatomic) BOOL isTextFile;
@property (nonatomic) BOOL isTree;
@property (nonatomic) BOOL isSecond;
@property (strong, nonatomic) GitDetailViewController *detailViewController;
- (void)searchforCommitsByUser:(NSString*)username forRepo:(NSString*)repo;
- (void)fetchedData:(NSData *)responseData;
- (void)getTreeForUser:(NSString*)username forRepo:(NSString*)repo sha:(NSString*)tree;
- (void)fetchedTree:(NSData *)responseData;
- (void)getTDataForSha:(NSString*)username forRepo:(NSString*)repo sha:(NSString*)tree;

@end

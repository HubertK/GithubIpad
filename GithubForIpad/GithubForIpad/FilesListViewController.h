//
//  FilesListViewController.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilesListViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *filesList;
@property (strong, nonatomic) NSMutableDictionary *fileDictionary;
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *repository;


- (void)searchGithubUser:(NSString *)user repo:(NSString*)repo sha:(NSString*)sha file:(NSString*)filePath;
- (void)fetchedData:(NSData *)responseData;
@end

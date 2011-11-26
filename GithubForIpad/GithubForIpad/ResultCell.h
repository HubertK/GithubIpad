//
//  ResultCell.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *repositoryName;
@property (weak, nonatomic) IBOutlet UILabel *repositoryDescription;
@property (weak, nonatomic) IBOutlet UILabel *repositoryUser;
@property (weak, nonatomic) IBOutlet UILabel *repositoryLanguage;

@end

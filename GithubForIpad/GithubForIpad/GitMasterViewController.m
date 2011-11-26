//
//  GitMasterViewController.m
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//
#define JSON_Notification @"JSONResponseNotification"
#define kBlobs @ "http://github.com/api/v2/json/blob/all/%@/%@/master"//username,repo
#import "GitMasterViewController.h"
#import "ResultCell.h"
#import "GitDetailViewController.h"
#import "FilesListViewController.h"
#import "CommitsViewController.h"

@implementation GitMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize resultsArray,username,reposit;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.tableView.backgroundView = [[UIView alloc]init];
    self.tableView.backgroundColor = [UIColor colorWithRed:.22 green:.27 blue:.35 alpha:1];
    self.resultsArray = [[NSMutableArray alloc]init];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recievedJSONData:) name:JSON_Notification object:nil];
    
    self.detailViewController = (GitDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.resultsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ResultCell";

    ResultCell *cell = (ResultCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    

    NSString *descriptionOfRepository = [[self.resultsArray objectAtIndex:indexPath.section]valueForKey:@"description"];
    if ([descriptionOfRepository length] <= 0) {
        descriptionOfRepository = @"No Description";
    }
    NSString *user = [[self.resultsArray objectAtIndex:indexPath.section]valueForKey:@"username"];
    if ([user length] <= 0) {
        user = @"No Username";
    }
    NSString *nameOfRepository = [[self.resultsArray objectAtIndex:indexPath.section]valueForKey:@"name"];
    if ([nameOfRepository length] <= 0) {
        nameOfRepository = @"No Name";
    }
    NSString *language = [[self.resultsArray objectAtIndex:indexPath.section]valueForKey:@"language"];
    if ([language length] <= 0) {
        language = @"Not Specified";
    }
    cell.repositoryDescription.text = descriptionOfRepository;
    cell.repositoryName.text = nameOfRepository;
    cell.repositoryUser.text = user;
    cell.repositoryLanguage.text = language;
    return cell;
}
- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    UIImageView *sep = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14, 300, 3)];
    sep.image = [UIImage imageNamed:@"seperator.png"];
    [foot addSubview:sep];
    return foot;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   self.username = [[self.resultsArray objectAtIndex:indexPath.section]valueForKey:@"username"];
     self.reposit = [[self.resultsArray objectAtIndex:indexPath.section]valueForKey:@"name"];
    [self searchGithubFor:username repo:reposit];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma --mark   Notification listeners
- (void)recievedJSONData:(NSNotification*)notification{
    if ([[notification.userInfo valueForKey:@"hasInfo"] isEqualToNumber:[NSNumber numberWithBool:YES]]) {
    
    self.resultsArray = [[notification.userInfo valueForKey:@"Repositories"]mutableCopy];
        NSLog(@"Results Array:%@",self.resultsArray);
    }
    [self.tableView reloadData];
    
}



- (void)searchGithubFor:(NSString *)user repo:(NSString*)repo{
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Add code here to do background processing
        NSString *URLString = [NSString stringWithFormat:kBlobs,user,repo];
        NSURL *URL = [NSURL URLWithString:URLString];
        NSData *data = [NSData dataWithContentsOfURL:URL];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            // Add code here to update the UI/send notifications based on the
            [self fetchedData:data];
            
        });
    });
    
}



- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData 
                          options:kNilOptions 
                          error:&error];
    NSMutableDictionary *files = [json objectForKey:@"blobs"];
    NSMutableArray *allFIles = [[NSMutableArray alloc]initWithCapacity:[files count]];
    allFIles = [[files allKeys]mutableCopy];
    NSLog(@"Respose:%@",allFIles);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    FilesListViewController *filesList = [storyboard instantiateViewControllerWithIdentifier:@"FilesListViewController"];
//    [filesList setFilesList:allFIles];
//    [filesList setFileDictionary:files];
//    [filesList setUser:self.username];
//    [filesList setRepository:self.reposit];
//    [self.detailViewController.navigationController pushViewController:filesList animated:YES];
    
    CommitsViewController *commits = [storyboard instantiateViewControllerWithIdentifier:@"CommitsView"];
    [commits setRepository:self.reposit];
    [commits setUser:self.username];
    [commits setDetailViewController:self.detailViewController];
    [self.navigationController pushViewController:commits animated:YES];
}
    



















@end

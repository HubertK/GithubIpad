//
//  CommitsViewController.m
//  GithubForIpad
//
//  Created by Helene Brooks on 11/22/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//
#define kDataFile @"http://github.com/api/v2/json/blob/show/%@/%@/%@"//user,repository,sha
#define kTree @"http://github.com/api/v2/json/tree/show/%@/%@/%@"//user,repo,tree_sha
#define kCommits @"http://github.com/api/v2/json/commits/list/%@/%@/master"//username,repo
#import "CommitsViewController.h"
#import "TextViewController.h"
#import "HTMLViewController.h"
#import "HTMLWebViewController.h"
#import "GitDetailViewController.h"
@implementation CommitsViewController
@synthesize user,repository,tree_sha,fileData,isTextFile,isTree,JSONResults,isSecond,detailViewController,file;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    isSecond = NO;
    self.fileData = [[NSMutableDictionary alloc]init];
    self.JSONResults = [[NSMutableDictionary alloc]init];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    [self searchforCommitsByUser:self.user forRepo:self.repository];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return[self.JSONResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.JSONResults valueForKey:@"name"]objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [[self.JSONResults valueForKey:@"mime_type"]objectAtIndex:indexPath.row]; 
     return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[[self.JSONResults valueForKey:@"type"]objectAtIndex:indexPath.row] isEqualToString:@"tree"]) {
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    }
   else if ([[[self.JSONResults valueForKey:@"mime_type"]objectAtIndex:indexPath.row] isEqualToString:@"text/plain"] && [[[self.JSONResults valueForKey:@"type"]objectAtIndex:indexPath.row] isEqualToString:@"blob"] ) {
        cell.imageView.image = [UIImage imageNamed:@"text-48_32.png"];
    }
   else if ([[[self.JSONResults valueForKey:@"mime_type"]objectAtIndex:indexPath.row] isEqualToString:@"image/png"] && [[[self.JSONResults valueForKey:@"type"]objectAtIndex:indexPath.row] isEqualToString:@"blob"]) {
        cell.imageView.image = [UIImage imageNamed:@"images-icon.png"];
    }

   else{
       cell.imageView.image = [UIImage imageNamed:@"other.png"];
   }
    
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *shaForsha;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *key = cell.textLabel.text;
    self.file = key;
    for (int i = 0; i < [self.JSONResults count]; i++) {
        NSString *currentSha = [[self.JSONResults valueForKey:@"sha"]objectAtIndex:i];
        if ([[[self.JSONResults valueForKey:@"name"]objectAtIndex:i] isEqualToString:key]) {
            NSLog(@"found key");
            NSString *test = [[JSONResults valueForKey:@"type"]objectAtIndex:i];
            NSLog(@"type = %@",test);
            if ([test isEqualToString:@"tree"]) {
                NSLog(@"selected IsTree");
                isTree = YES;
            }
            else{
                isTree = NO;
            }
          shaForsha = currentSha;
        }
    }
    
    if (isTree == YES) {
     //   self.tree_sha = [self.fileData valueForKey:key];
        NSLog(@"isTreeIF");
        [self getTreeForUser:self.user forRepo:self.repository sha:shaForsha];
        
        }
    
    else if (isTree == NO) {
        
        [self getTDataForSha:self.user forRepo:self.repository sha:shaForsha];        
    }
    
 else{
        NSLog(@"ELSE");
    self.tree_sha = [self.fileData valueForKey:key];
    [self getTreeForUser:self.user forRepo:self.repository sha:self.tree_sha];
        isTree = YES;
    }
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)searchforCommitsByUser:(NSString*)username forRepo:(NSString*)repo{
   
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Add code here to do background processing
        NSString *URLString = [NSString stringWithFormat:kCommits,username,repo];
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
    if (error) {
        NSLog(@"ERROR:%@",[error localizedDescription]);
    }
    NSLog(@"Commits :%@",json);
    NSDictionary *results = [json objectForKey:@"commits"];
  
  
//    for (int i = 0; i < [results count]; i++) {
//         NSString *tree = [[results valueForKey:@"tree"]objectAtIndex:i];
//         NSString *message = [[results valueForKey:@"message"]objectAtIndex:i];
//        [self.fileData setValue:tree forKey:message];
//    }
    NSString *tree = [[results valueForKey:@"tree"]objectAtIndex:0];
    
    NSLog(@"ID:%@",tree);
    [self getTreeForUser:self.user forRepo:self.repository sha:tree];
    isTree = NO;
    isSecond = NO;
   
}





- (void)getTreeForUser:(NSString*)username forRepo:(NSString*)repo sha:(NSString*)tree{
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Add code here to do background processing
        NSString *URLString = [NSString stringWithFormat:kTree,username,repo,tree];
        NSLog(@"GET TREE:%@",URLString);
        NSURL *URL = [NSURL URLWithString:URLString];
        NSData *data = [NSData dataWithContentsOfURL:URL];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            // Add code here to update the UI/send notifications based on the
            [self fetchedTree:data];
            
        });
    });

}

- (void)fetchedTree:(NSData *)responseData{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData 
                          options:kNilOptions 
                          error:&error];
    NSLog(@"Tree :%@",json);
    
    
   
    
    NSDictionary *results = [json objectForKey:@"tree"];
    if ([results count] > 0) {
      [self.fileData removeAllObjects];  
    self.JSONResults = [results mutableCopy];
    NSString *tree = [[results valueForKey:@"name"]objectAtIndex:0];
    NSLog(@"ID:%@",tree);
    for (int i = 0; i < [results count]; i++) {
        NSString *tree = [[results valueForKey:@"mime_type"]objectAtIndex:i];
        NSString *message = [[results valueForKey:@"name"]objectAtIndex:i];
        NSString *test = [[results valueForKey:@"type"]objectAtIndex:i];
        NSLog(@"%@ is a %@",[[results valueForKey:@"name"]objectAtIndex:i],test);
        self.tree_sha = [[results valueForKey:@"sha"]objectAtIndex:i];
        [self.fileData setValue:tree forKey:message];
        if ([test isEqualToString:@"tree"]) {
            isTree = YES;
          
            
        }
        else{
            isTree = NO;
        }
    }
    
    [self.tableView reloadData];
    
    }//end of if results count > 0
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"File Read Error!" message:@"Sorry we can't seem to read this file type" delegate:self cancelButtonTitle:@"O.K." otherButtonTitles:nil , nil];
        [alert show];
        return;
    }

}


- (void)getTDataForSha:(NSString*)username forRepo:(NSString*)repo sha:(NSString*)tree{
         NSLog(@" \nname:%@, repo:%@, sha:%@",username,repo,tree);
        NSString *URLString = [NSString stringWithFormat:kDataFile,username,repo,tree];
        NSLog(@"URL:%@",URLString);
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        HTMLWebViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"HTMLWebViewController"];  
        [controller setAddress:URLString];
        [controller setAutor:username];
        [controller setTitleOfDocument:self.file];
      //  [controller wantsFullScreenLayout];
     //   [self presentModalViewController:controller animated:YES];
       // GitDetailViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
      
    [[NSNotificationCenter defaultCenter]postNotificationName:@"dismissView" object:nil];
          controller.wantsFullScreenLayout = NO;
         [self presentModalViewController:controller animated:YES];
        
}

- (void)alertViewCancel:(UIAlertView *)alertView{
    
}



@end

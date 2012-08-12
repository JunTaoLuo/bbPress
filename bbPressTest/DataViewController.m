//
//  DataViewController.m
//  bbPressTest
//
//  Created by Jun Tao Luo on 2012-08-11.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

@synthesize  allEntries = _allEntries;
@synthesize feeds = _feeds;
@synthesize queue = _queue;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Feeds";
    self.allEntries = [NSMutableArray array];
    self.queue = [[NSOperationQueue alloc] init];
    self.feeds = [NSArray arrayWithObjects:@"http://feeds.feedburner.com/RayWenderlich",
                  @"http://feeds.feedburner.com/vmwstudios",
                  @"http://idtypealittlefaster.blogspot.com/feeds/posts/default",
                  @"http://www.71squared.com/feed/",
                  @"http://cocoawithlove.com/feeds/posts/default",
                  @"http://feeds2.feedburner.com/brandontreb",
                  @"http://feeds.feedburner.com/CoryWilesBlog",
                  @"http://geekanddad.wordpress.com/feed/",
                  @"http://iphonedevelopment.blogspot.com/feeds/posts/default",
                  @"http://karnakgames.com/wp/feed/",
                  @"http://kwigbo.com/rss",
                  @"http://shawnsbits.com/feed/",
                  @"http://pocketcyclone.com/feed/",
                  @"http://www.alexcurylo.com/blog/feed/",
                  @"http://feeds.feedburner.com/maniacdev",
                  @"http://feeds.feedburner.com/macindie",
                  nil];
    [self refresh];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    _allEntries = nil;
    _queue = nil;
    _feeds = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)addRows {
    RSSEntry *entry1 = [[RSSEntry alloc] initWithBlogTitle:@"1" articleTitle:@"1" articleUrl:@"1" articleDate:[NSDate date]];
    RSSEntry *entry2 = [[RSSEntry alloc] initWithBlogTitle:@"2" articleTitle:@"2" articleUrl:@"2" articleDate:[NSDate date]];
    RSSEntry *entry3 = [[RSSEntry alloc] initWithBlogTitle:@"3" articleTitle:@"3" articleUrl:@"3" articleDate:[NSDate date]];
    
    [_allEntries insertObject:entry1 atIndex:0];
    [_allEntries insertObject:entry2 atIndex:0];
    [_allEntries insertObject:entry3 atIndex:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_allEntries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	RSSEntry * entry = [_allEntries objectAtIndex:indexPath.row];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString * articleDateString = [dateFormatter stringFromDate:entry.articleDate];
    
    cell.textLabel.text = entry.articleTitle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", articleDateString, entry.blogTitle];
    
    return cell;
}

- (void) refresh {
    for (NSString * feed in _feeds)
    {
        NSURL * url = [NSURL URLWithString:feed];
        ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
        [request setDelegate:self];
        [_queue addOperation:request];
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    
    RSSEntry *entry = [[RSSEntry alloc] initWithBlogTitle:request.url.absoluteString
                                              articleTitle:request.url.absoluteString
                                                articleUrl:request.url.absoluteString
                                               articleDate:[NSDate date]];
    int insertIdx = 0;
    [_allEntries insertObject:entry atIndex:insertIdx];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:insertIdx inSection:0]]
                          withRowAnimation:UITableViewRowAnimationRight];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"Error: %@", error);
}

@end

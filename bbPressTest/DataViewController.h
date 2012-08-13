//
//  DataViewController.h
//  bbPressTest
//
//  Created by Jun Tao Luo on 2012-08-11.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSEntry.h"
#import "ASIHTTPRequest.h"
#import "GDataXMLNode.h"
#import "GDataXMLElement-Extras.h"

@interface DataViewController : UIViewController
{
    NSMutableArray * _allEntries;
    NSOperationQueue * _queue;
    NSArray * _feeds;
    
    IBOutlet UITableView * tableView;
}

@property (strong, nonatomic) id dataObject;
@property (retain) NSMutableArray * allEntries;
@property (retain) NSOperationQueue * queue;
@property (retain) NSArray * feeds;

@end

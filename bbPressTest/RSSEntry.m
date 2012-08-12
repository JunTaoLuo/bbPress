//
//  RSSEntry.m
//  bbPressTest
//
//  Created by Jun Tao Luo on 2012-08-12.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import "RSSEntry.h"

@implementation RSSEntry

@synthesize blogTitle = _blogTitle;
@synthesize articleTitle = _articleTitle;
@synthesize articleUrl = _articleUrl;
@synthesize articleDate = _articleDate;\

- (id) initWithBlogTitle:(NSString *)blogTitle articleTitle:(NSString *)articleTitle articleUrl:(NSString *)articleUrl articleDate:(NSDate *)articleDate
{
    if ((self = [super init])) {
        _blogTitle = blogTitle;
        _articleDate = articleDate;
        _articleTitle = articleTitle;
        _articleUrl = articleUrl;
    }
    return self;
}

- (void) dealloc
{
    _blogTitle = nil;
    _articleDate = nil;
    _articleTitle = nil;
    _articleUrl = nil;
}

@end

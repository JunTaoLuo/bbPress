//
//  RSSEntry.h
//  bbPressTest
//
//  Created by Jun Tao Luo on 2012-08-12.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject {
    NSString * _blogTitle;
    NSString * _articleTitle;
    NSString * _articleUrl;
    NSDate * _articleDate;
}

@property (nonatomic,copy) NSString * blogTitle;
@property (nonatomic,copy) NSString * articleTitle;
@property (nonatomic,copy) NSString * articleUrl;
@property (nonatomic,copy) NSDate * articleDate;

- (id) initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate;

@end

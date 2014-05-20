//
//  KPAViewController.m
//  KPAPagedViewDemo
//
//  Created by Kenneth Parker Ackerson on 5/20/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import "KPAViewController.h"
#import "KPAPagedView.h"

@interface KPAViewController ()

@end

@implementation KPAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *colors = @[[UIColor orangeColor], [UIColor greenColor], [UIColor redColor], [UIColor blueColor]];
    
    KPAPagedView *pagedView = [[KPAPagedView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250) withNumberOfPages:4 andViewLoadingBlock:^UIView *(NSUInteger index) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250)];
        return view;
    }];
    
    [pagedView setViewUpdateBlock:^(NSArray *viewsToUpdate, NSArray *respectiveIndiciesOfViews){
        for (NSInteger i = 0; i < viewsToUpdate.count; i++) {
            UIView *view = viewsToUpdate[i];
            NSInteger index = [respectiveIndiciesOfViews[i] integerValue];
            view.backgroundColor = colors[index];
        }
    }];
        
    [pagedView setCenter:CGPointMake(CGRectGetMidX(self.view.frame), 20 + CGRectGetHeight(pagedView.frame)/2)];
    
    [self.view addSubview:pagedView];
    
    
    KPAPagedView *pagedViewTwo = [[KPAPagedView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250) withNumberOfPages:10 andViewLoadingBlock:^UIView *(NSUInteger index) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250)];
        [view setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.1]];
        UILabel *label = [[UILabel alloc] init];
        [label setText:[NSString stringWithFormat:@"Page %lu", (unsigned long)index]];
        [label setFont:[UIFont boldSystemFontOfSize:30]];
        [label sizeToFit];

        [label setCenter:CGPointMake(CGRectGetMidX(view.frame), CGRectGetMidY(view.frame))];
        
        [view addSubview:label];
        
        return view;
    }];

    [pagedViewTwo setCenter:CGPointMake(CGRectGetMidX(self.view.frame), 10 + pagedView.center.y + CGRectGetHeight(pagedView.frame)/2 + CGRectGetHeight(pagedViewTwo.frame)/2)];
    
    [self.view addSubview:pagedViewTwo];

}



@end

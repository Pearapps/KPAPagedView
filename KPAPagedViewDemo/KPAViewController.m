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
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 700)];
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

}



@end

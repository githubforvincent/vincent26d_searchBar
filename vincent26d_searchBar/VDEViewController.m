//
//  VDEViewController.m
//  vincent26d_searchBar
//
//  Created by Utilisation on 20/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//


#import "VDEViewController.h"



@interface VDEViewController ()

@end

@implementation VDEViewController

-(BOOL) shouldAutorotate {
//--------------------------------------------------------------------------------------------------------
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)o duration:(NSTimeInterval)d
//--------------------------------------------------------------------------------------------------------
{
    [vue vdeSetFromOrientation:o];
    
}
- (void)viewDidLoad {
//--------------------------------------------------------------------------------------------------------
    
    [super viewDidLoad];
    vue = [[VDEMyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[self view] addSubview:vue];}

- (void)didReceiveMemoryWarning {
//--------------------------------------------------------------------------------------------------------
    [super didReceiveMemoryWarning];
    NSLog(@"Alerte mémoire");
    
    
}



@end


//
//  ViewController.m
//  Emoji Challenge
//
//  Created by Macbook on 19/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "ViewController.h"
#import "CategoryVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = true;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = true;
}

- (IBAction)playButtonTouched:(id)sender
{
    CategoryVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoryVC"];
    [self.navigationController pushViewController:v animated:YES];
}

@end

//
//  CategoryVC.m
//  Emoji Challenge
//
//  Created by Macbook on 19/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "CategoryVC.h"
#import "GameVC.h"

@interface CategoryVC ()

@end

@implementation CategoryVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = false;

}

- (IBAction)guessEmojiButton:(id)sender
{
    GameVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"GameVC"];
    
    v.movies = @"Hollywood";
    
    [self.navigationController pushViewController:v animated:YES];
}


- (IBAction)guessMovieButton:(id)sender
{
    GameVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"GameVC"];
    
    v.movies = @"Bollywood";
    
    [self.navigationController pushViewController:v animated:YES];
}

@end

//
//  GameVC.m
//  Emoji Challenge
//
//  Created by Macbook on 19/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "GameVC.h"
#import "SCLAlertView.h"

@interface GameVC ()
{
    NSMutableArray * dataArray;
    NSMutableDictionary * data;
    
    NSMutableDictionary * SelectedItem;
    
    NSString * target;
    
    NSString * answerString;
    
    
    int n1;
    int n2;
    int n3;
    
    
    int targetNumber;
    int sum;
    int attempts;
    int buttonCount;
    
    int randomButton;
    int index;
    int score;
    int count;
    
    NSTimer * t;
    int timer;
}

@end


NSString *kSuccessTitle = @"Congratulations";
NSString *kErrorTitle = @"Connection error";
NSString *kNoticeTitle = @"Notice";
NSString *kWarningTitle = @"Warning";
NSString *kInfoTitle = @"Info";
NSString *kSubtitle = @"You've just displayed this awesome Pop Up View";
NSString *kButtonTitle = @"Done";
NSString *kAttributeTitle = @"Attributed string operation successfully completed.";



@implementation GameVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = false;
    
    
    if ([_movies isEqualToString:@"Bollywood"])
    {
        [self setBollywoodArray];
    }
    else
    {
        [self setHollywoodArray];
        
    }
    
    sum = 0;
    buttonCount = 1;
    
    index = 0;
    score = 0;
    count = 0;
    attempts = 3;
    
    [self setScreen];
}


- (IBAction)b1:(id)sender
{
    if ([_n1Label.text isEqualToString:answerString])
    {
        score = score + 10;
        _i1.hidden = false;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b2:(id)sender
{
    if ([_n2Label.text isEqualToString:answerString])
    {
        score = score + 10;
        _i2.hidden = false;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}

- (IBAction)b3:(id)sender
{
    if ([_n3Label.text isEqualToString:answerString])
    {
        score = score + 10;
        _i3.hidden = false;
        [self showCorrectAnswer];
    }
    else
    {
        [self showWrongAnswer];
    }
}


- (IBAction)skip:(id)sender
{
    [self setScreen];
}



-(void) setScreen
{
    
    if (count == 5)
    {
        if (score == 50)
        {
            [self showWin];
            _pointsLabel.text = [NSString stringWithFormat:@"%d", score];
        }
        else
        {
            [self showWrongAnswer];
            _pointsLabel.text = [NSString stringWithFormat:@"%d", score];
        }
    }
    else
    {
        sum = 0;
        count = count + 1;
        
        _i1.hidden = true;
        _i2.hidden = true;
        _i3.hidden = true;
        
        buttonCount = 1;
        answerString = @"";
        
        int rand = arc4random()%dataArray.count;
        
        SelectedItem = [dataArray objectAtIndex:rand];
        
      //  targetNumber = [[SelectedItem objectForKey:@"target"] intValue];
        
        _questionImageView.image = [UIImage imageNamed:[SelectedItem objectForKey:@"image"]];
        
        _n1Label.text = [SelectedItem objectForKey:@"b1"];
        _n2Label.text = [SelectedItem objectForKey:@"b2"];
        _n3Label.text = [SelectedItem objectForKey:@"b3"];
        
        answerString = [SelectedItem objectForKey:@"answer"];
        
        
        _levelLabel.text = [NSString stringWithFormat:@"%d/5", count];
        _pointsLabel.text = [NSString stringWithFormat:@"%d", score];
        
        
    }
    
    
}




-(void) setBollywoodArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b1.jpeg" forKey:@"image"];
    [data setValue:@"Hera Pheri" forKey:@"b1"];
    [data setValue:@"House Full" forKey:@"b2"];
    [data setValue:@"Angry" forKey:@"b3"];
    [data setValue:@"House Full" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b2.jpeg" forKey:@"image"];
    [data setValue:@"Chandni Chowk To China" forKey:@"b1"];
    [data setValue:@"Chaand Taray Phool Shabnam" forKey:@"b2"];
    [data setValue:@"Chaand Mera Dil" forKey:@"b3"];
    [data setValue:@"Chandni Chowk To China" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b3.jpeg" forKey:@"image"];
    [data setValue:@"Salam London" forKey:@"b1"];
    [data setValue:@"Namastey London" forKey:@"b2"];
    [data setValue:@"Namastey Parcham" forKey:@"b3"];
    [data setValue:@"Namastey London" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b4.jpeg" forKey:@"image"];
    [data setValue:@"Superstar" forKey:@"b1"];
    [data setValue:@"Youngstar" forKey:@"b2"];
    [data setValue:@"Rockstar" forKey:@"b3"];
    [data setValue:@"Rockstar" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b5.jpeg" forKey:@"image"];
    [data setValue:@"7 Khoon Maaf" forKey:@"b1"];
    [data setValue:@"Youngstar" forKey:@"b2"];
    [data setValue:@"Amadni Athani Kharcha Rupaiyya" forKey:@"b3"];
    [data setValue:@"7 Khoon Maaf" forKey:@"answer"];
    [dataArray addObject:data];


    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b6.jpeg" forKey:@"image"];
    [data setValue:@"Dil Dil Pakistan" forKey:@"b1"];
    [data setValue:@"Dil De Diya Hay" forKey:@"b2"];
    [data setValue:@"Dil Dhadakne Do" forKey:@"b3"];
    [data setValue:@"Dil Dhadakne Do" forKey:@"answer"];
    [dataArray addObject:data];


    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b7.jpeg" forKey:@"image"];
    [data setValue:@"Dil Dhadakne Do" forKey:@"b1"];
    [data setValue:@"No One Killed Jessica" forKey:@"b2"];
    [data setValue:@"Amadni Athani Kharcha Rupaiyya" forKey:@"b3"];
    [data setValue:@"No One Killed Jessica" forKey:@"answer"];
    [dataArray addObject:data];


    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b8.jpeg" forKey:@"image"];
    [data setValue:@"Chaand Taray Phool Shabnam" forKey:@"b1"];
    [data setValue:@"Kabootar Ja Bay" forKey:@"b2"];
    [data setValue:@"Udta Punjab" forKey:@"b3"];
    [data setValue:@"Udta Punjab" forKey:@"answer"];
    [dataArray addObject:data];


    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b9.jpeg" forKey:@"image"];
    [data setValue:@"Ek Tha Tiger" forKey:@"b1"];
    [data setValue:@"Tum Ho Sher" forKey:@"b2"];
    [data setValue:@"Dil Dhadakne Do" forKey:@"b3"];
    [data setValue:@"Ek Tha Tiger" forKey:@"answer"];
    [dataArray addObject:data];

    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"b10.jpeg" forKey:@"image"];
    [data setValue:@"Hul Chul" forKey:@"b1"];
    [data setValue:@"Aam Aadmi" forKey:@"b2"];
    [data setValue:@"Chalte Chalte" forKey:@"b3"];
    [data setValue:@"Chalte Chalte" forKey:@"answer"];
    [dataArray addObject:data];
//
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
//
//    data = [[NSMutableDictionary alloc] init];
//    [data setValue:@"b2.jpeg" forKey:@"image"];
//    [data setValue:@"" forKey:@"b1"];
//    [data setValue:@"" forKey:@"b2"];
//    [data setValue:@"" forKey:@"b3"];
//    [data setValue:@"" forKey:@"answer"];
//    [dataArray addObject:data];
}

-(void) setHollywoodArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h1.jpeg" forKey:@"image"];
    [data setValue:@"Rush Hour" forKey:@"b1"];
    [data setValue:@"The Curious Case of Benjamin Button" forKey:@"b2"];
    [data setValue:@"Back To The Future" forKey:@"b3"];
    [data setValue:@"Back To The Future" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h2.jpeg" forKey:@"image"];
    [data setValue:@"Cars" forKey:@"b1"];
    [data setValue:@"Rush Hour" forKey:@"b2"];
    [data setValue:@"The Fast and The Furious" forKey:@"b3"];
    [data setValue:@"Cars" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h3.jpeg" forKey:@"image"];
    [data setValue:@"Anastasia" forKey:@"b1"];
    [data setValue:@"Frozen" forKey:@"b2"];
    [data setValue:@"Jack Frost" forKey:@"b3"];
    [data setValue:@"Frozen" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h4.jpeg" forKey:@"image"];
    [data setValue:@"101 Dalmatians" forKey:@"b1"];
    [data setValue:@"Marley and Me" forKey:@"b2"];
    [data setValue:@"Lady and the Tramp" forKey:@"b3"];
    [data setValue:@"Lady and the Tramp" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h5.jpeg" forKey:@"image"];
    [data setValue:@"Men In Black" forKey:@"b1"];
    [data setValue:@"Alien" forKey:@"b2"];
    [data setValue:@"Paul" forKey:@"b3"];
    [data setValue:@"Men In Black" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h6.jpeg" forKey:@"image"];
    [data setValue:@"Gone Girl" forKey:@"b1"];
    [data setValue:@"Mr & Mrs Smith" forKey:@"b2"];
    [data setValue:@"From Paris With Love" forKey:@"b3"];
    [data setValue:@"Mr & Mrs Smith" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h7.jpeg" forKey:@"image"];
    [data setValue:@"Jumanji" forKey:@"b1"];
    [data setValue:@"Life of Pi" forKey:@"b2"];
    [data setValue:@"Noah" forKey:@"b3"];
    [data setValue:@"Noah" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h8.jpeg" forKey:@"image"];
    [data setValue:@"Ocean's 11" forKey:@"b1"];
    [data setValue:@"2012" forKey:@"b2"];
    [data setValue:@"The Day After Tomorrow" forKey:@"b3"];
    [data setValue:@"Ocean's 11" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h9.jpeg" forKey:@"image"];
    [data setValue:@"Sleeping Beauty" forKey:@"b1"];
    [data setValue:@"Insomnia" forKey:@"b2"];
    [data setValue:@"Sleepless in Seattle" forKey:@"b3"];
    [data setValue:@"Sleeping Beauty" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"h10.jpeg" forKey:@"image"];
    [data setValue:@"Bat Man" forKey:@"b1"];
    [data setValue:@"Eight Legged Freaks" forKey:@"b2"];
    [data setValue:@"Spider Man" forKey:@"b3"];
    [data setValue:@"Spider Man" forKey:@"answer"];
    [dataArray addObject:data];
}



-(void) showFailAlert
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Lost"
                                                                   message:[NSString stringWithFormat:@"You failed to guess the Emojis"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) showFailAlertFinal
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Lost"
                                                                   message:[NSString stringWithFormat:@"You have failed. Your score is %d", score]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showFailAlertAttempt
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Lost"
                                                                   message:[NSString stringWithFormat:@"You failed to guess the emoji"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self setScreen];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showPassedAlert
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Congratulations"
                                                                   message:[NSString stringWithFormat:@"you guessed correct"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Next" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self setScreen];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showPassedAlertFinal
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Won"
                                                                   message:[NSString stringWithFormat:@"Congratulations. You Scored : %d", score]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)showCorrectAnswer
{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    
    [alert addButton:@"Next" actionBlock:^(void) {
        [self setScreen];
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:@"Correct Answer" subTitle:@"You guessed the corrent name" closeButtonTitle:nil duration:0.0f];
}

- (void)showWin
{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    
    [alert addButton:@"Play Again" actionBlock:^(void) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:kSuccessTitle subTitle:@"You have guessed all the names" closeButtonTitle:nil duration:0.0f];
}


- (void)showWrongAnswer
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    
    [alert addButton:@"Try Again" actionBlock:^(void) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alert showError:self title:@"Wrong Answer"
            subTitle:@"You have guessed the wrong movie name"
    closeButtonTitle:nil duration:0.0f];
}



@end

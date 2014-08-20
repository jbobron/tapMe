//
//  ViewController.m
//  Tap Me
//
//  Created by jobron on 7/30/14.
//  Copyright (c) 2014 jobron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_title.png"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
	// Do any additional setup after loading the view, typically from a nib.
    //buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    //secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    //backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed{
    count++;
    
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
    
    [buttonBeep play];
    
}

- (void)setupGame {
    seconds = 30;
    count = 0;
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}

-(void)subtractTime {
    
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    [secondBeep play];
    
    if (seconds == 0){
        [timer invalidate];
    
        // new code is here!
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                    message:[NSString stringWithFormat:@"You scored %i points", count]
                    delegate:self
                    cancelButtonTitle:@"Play Again"
                    otherButtonTitles:nil];
        
        [alert show];
    }
    

/*
-(void)alertView:(UIAlertView* )alertView
{
    if (buttonIndex == 0) { // means share button pressed
        // write your code here to do whatever you want to do once the share button is pressed
    }
    if(buttonIndex == 1) { // means apple button pressed
        // write your code here to do whatever you want to do once the apple button is pressed
    }
    // a
}

    
    
- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5
    return audioPlayer;
}

*/


    
    
}

@end

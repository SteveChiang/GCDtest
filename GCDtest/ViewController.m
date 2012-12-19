//
//  ViewController.m
//  GCDtest
//
//  Created by Steve Chiang on 12/12/2.
//  Copyright (c) 2012年 Steve Chiang. All rights reserved.
//

#import "ViewController.h"
#define PAUSE_TIME 2
#define IMG_URL @""
@implementation ViewController
@synthesize mLblShow;
@synthesize mImgView;
@synthesize mBtnDownload;

-(IBAction)btnPressed:(id)sender {
    NSLog(@"[START] BTN Pressed");
    [mImgView setImage:nil];
    [mLblShow setText:@"downloading..."];
    [mBtnDownload setEnabled:NO];
    
    dispatch_queue_t queue = dispatch_queue_create("testQueue", NULL);
    dispatch_async(queue, ^(void) {
        NSLog(@"[BACKGROUND THREAD][START] do something in background");
        
        [NSThread sleepForTimeInterval:PAUSE_TIME];
        NSURL *url = [NSURL URLWithString:IMG_URL];
        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            NSLog(@"[MAIN THREAD] callback");
            [mLblShow setText:@"finish download"];
            [mImgView setImage:image];
            [mBtnDownload setEnabled:YES];
        });
        
        NSLog(@"[BACKGROUND THREAD][FINISH] do something in background");
    });
   
    dispatch_release(queue);
    NSLog(@"[FINISH] BTN Pressed");
}

- (void)dealloc {
    [mLblShow release];
    [mImgView release];
    [mBtnDownload release];
    [super dealloc];
}
@end

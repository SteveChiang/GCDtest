//
//  ViewController.h
//  GCDtest
//
//  Created by Steve Chiang on 12/12/2.
//  Copyright (c) 2012年 Steve Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, retain) IBOutlet UILabel *mLblShow;
@property (nonatomic, retain) IBOutlet UIImageView *mImgView;
@property (nonatomic, retain) IBOutlet UIButton *mBtnDownload;
-(IBAction)btnPressed:(id)sender;
@end

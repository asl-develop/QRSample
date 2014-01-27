//
//  ViewController.h
//  SampleZXing
//
//  Created by satotakuma on 2014/01/17.
//  Copyright (c) 2014年 aisel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZXingWidgetController.h>
#import <QRCodeReader.h>

@interface ViewController : UIViewController<ZXingDelegate>{
    //次の画面へ渡す引数
    NSString *_arguments;
}

@property (nonatomic) NSString *arguments;
- (IBAction)clickReadButton:(id)sender;

@end

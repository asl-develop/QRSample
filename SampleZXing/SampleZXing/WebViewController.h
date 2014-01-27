//
//  WebViewController.h
//  SampleZXing
//
//  Created by satotakuma on 2014/01/17.
//  Copyright (c) 2014年 aisel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController{
    //前の画面から受け取る引数
    NSString *_arguments;
}
@property (nonatomic) NSString *arguments;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

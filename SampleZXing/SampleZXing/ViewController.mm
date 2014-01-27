//
//  ViewController.m
//  SampleZXing
//
//  Created by satotakuma on 2014/01/17.
//  Copyright (c) 2014年 aisel. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickReadButton:(id)sender
{
    // 読み取り画面を生成します。
    ZXingWidgetController *zxingWidgetController = [[ZXingWidgetController alloc]
                                                    initWithDelegate:self
                                                    showCancel:YES
                                                    OneDMode:NO];
    QRCodeReader *qrcodeReader = [[QRCodeReader alloc] init];
    zxingWidgetController.readers = [[NSSet alloc] initWithObjects:qrcodeReader, nil];
    
    // 読み取り画面を表示します。
    [self presentViewController:zxingWidgetController animated:NO completion:nil];
}

- (void)zxingController:(ZXingWidgetController*)controller
          didScanResult:(NSString *)result
{
    // 読み取り画面を閉じます。
    [self dismissViewControllerAnimated:NO completion:nil];
    
    NSLog(@"result=%@", result);
    
    _arguments = result;

    [self performSegueWithIdentifier:@"webViewSegue" sender:self];
}


- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller
{
    // 読み取り画面を閉じます。
    [self dismissViewControllerAnimated:NO completion:nil];
}

//画面遷移時に呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"webViewSegue"]) {
        //ここでパラメータを渡す
        WebViewController *webViewController = segue.destinationViewController;
        webViewController.arguments = _arguments;
    }
}
@end

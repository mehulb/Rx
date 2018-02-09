//
//  PNRViewController.m
//  Rx
//
//  Created by Mehul Bhavani on 20/09/17.
//  Copyright © 2017 mehulb. All rights reserved.
//

#import "PNRViewController.h"
#import "ApiCallHandler.h"

@interface PNRViewController ()

@end

@implementation PNRViewController
{
    IBOutlet UITextField *pnrTextField;
    IBOutlet UIButton *pnrButton;
    
    IBOutlet UIImageView *captchaImageView;
    IBOutlet UITextField *captchaTextField;
    IBOutlet UIButton *captchaButton;
    
    IBOutlet UILabel *resultLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pnrButton_Clicked:(id)sender {
    
    [[ApiCallHandler sharedHandler] sendPNR:pnrTextField.text withCompletionBlock:^(id response, NSError *error) {
//        NSDictionary *dict = (NSDictionary *)response;
//        captchaImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dict[@"captcha"]]]];
    }];
}
- (IBAction)captchaButton_Clicked:(id)sender {
    [[ApiCallHandler sharedHandler] sendCaptcha:captchaTextField.text forPNR:pnrTextField.text withCompletionBlock:^(id response, NSError *error) {
//        resultLabel.text = [NSString stringWithFormat:@"%@", response];
    }];
}

@end

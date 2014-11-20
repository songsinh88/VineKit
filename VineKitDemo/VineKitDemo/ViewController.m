//
//  ViewController.m
//  VineKitDemo
//
//  Created by Sapan Bhuta on 11/19/14.
//  Copyright (c) 2014 SapanBhuta. All rights reserved.
//

#import "ViewController.h"
#import "VineKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [VineKit loginWithUsername:@"xxx@example.com" Password:@"xxx" CompletionHandler:^(NSDictionary *output) {
        NSString *sessionKey = output[@"data"][@"key"];
        [VineKit meWithKey:sessionKey CompletionHandler:^(NSDictionary *output) {
            NSLog(@"%@", output);
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

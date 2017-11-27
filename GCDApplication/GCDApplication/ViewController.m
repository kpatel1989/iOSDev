//
//  ViewController.m
//  GCDApplication
//
//  Created by Kartik Patel on 2017-04-03.
//  Copyright © 2017 Kartik Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_queue_t bacha_q;
    bacha_q = dispatch_queue_create("com.bacha", NULL);
    dispatch_async(bacha_q, ^{[self longRunningQueue];});
}

- (void) longRunningQueue {
    [NSThread sleepForTimeInterval:10];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.resultLabel setText:[NSString stringWithFormat:@"Result: %d", arc4random()]];			
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

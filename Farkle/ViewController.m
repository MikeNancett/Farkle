//
//  ViewController.m
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int random = arc4random() % 6 + 1;
    // NSString *randomNumber = (@"%d", randomNumber);
    //self.label.text = @"%d", random;
    NSLog(@"%d", random);

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self onRollButtonPressed: nil];
}

- (IBAction)onRollButtonPressed:(UIButton *)sender {
    for (UIView * subview in self.view.subviews) {
        if ([subview isKindOfClass:[DieLabel class]]) {
            DieLabel * label = (DieLabel *)subview;
            [label rollDie];
        }
    }
}

@end

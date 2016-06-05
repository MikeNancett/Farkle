//
//  ViewController.m
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>
@property (nonatomic) NSMutableSet<DieLabel *> * dice;
@end

@implementation ViewController
- (void)dieLabelTapped:(DieLabel *)tappedLabel {
    [self.dice addObject:tappedLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    int random = arc4random() % 6 + 1;
    // NSString *randomNumber = (@"%d", randomNumber);
    //self.label.text = @"%d", random;
    NSLog(@"%d", random);
    self.dice = [NSMutableSet set];
    for (UIView * subview in self.view.subviews) {
        if ([subview isKindOfClass:[DieLabel class]]) {
            DieLabel * label = (DieLabel *)subview;
            label.delegate = self;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self onRollButtonPressed: nil];
}

- (IBAction)onRollButtonPressed:(UIButton *)sender {

    for (UIView * subview in self.view.subviews) {
        if ([subview isKindOfClass:[DieLabel class]]) {
            DieLabel * label = (DieLabel *)subview;
            if (NO == [self.dice containsObject: label]) {
                [label rollDie];
            }
        }
    }
}

@end

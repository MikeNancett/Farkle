//
//  ViewController.m
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"
#import <assert.h>

@interface ViewController () <DieLabelDelegate>
@property (nonatomic) unsigned myScore;
@property (nonatomic) NSMutableSet<DieLabel *> * currentTurnDice;
@property (nonatomic) NSMutableSet<DieLabel *> * dice;
@end

@implementation ViewController
- (void)dieLabelTapped:(DieLabel *)tappedLabel {
    if ([self.dice containsObject: tappedLabel]) {
        [self.dice removeObject: tappedLabel];
        tappedLabel.backgroundColor = [UIColor greenColor];
    } else {
        [self.dice addObject:tappedLabel];
        tappedLabel.backgroundColor = [UIColor yellowColor];
    }
    [self calcAndUpdateTheScore];
}

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

- (void)calcAndUpdateTheScore{
    unsigned countOfDies[6] = { 0 };
    
    for (DieLabel * label in self.dice) {
        const unsigned curIdx = label.score - 1;
        assert(curIdx < 6);
        countOfDies[curIdx] += 1;
    }
    unsigned totalScore = 0;
    if (countOfDies[0] >= 3) {
        totalScore += 1000;
    } else {
        totalScore += countOfDies[0] * 100;
    }
    if (countOfDies[1] >= 3) {
        totalScore += 200;
    }
    if (countOfDies[2] >= 3) {
        totalScore += 300;
    }
    if (countOfDies[3] >= 3) {
        totalScore += 400;
    }
    if (countOfDies[4] >= 3) {
        totalScore += 500;
    } else {
        totalScore += countOfDies[4] * 50;
    }
    if (countOfDies[5] >= 3) {
        totalScore += 600;
    }
    if (totalScore > 0) {
        isAdditionalTurnAvailable = YES;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %u", totalScore];
}

- (IBAction)onRollButtonPressed:(UIButton *)sender {
    // new game
    if (NO == isAdditionalTurnAvailable) {
        // new game
        for (DieLabel * label in self.dice) {
            label.backgroundColor = [UIColor greenColor];
        }
        self.dice = [NSMutableSet set];
    }
    //
    for (UIView * subview in self.view.subviews) {
        if ([subview isKindOfClass:[DieLabel class]]) {
            DieLabel * label = (DieLabel *)subview;
            if (NO == [self.dice containsObject: label]) {
                [label rollDie];
                label.delegate = self;
            }
        }
    }
}

@end

//
//  DieLabel.m
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import "DieLabel.h"

@interface DieLabel () <UIGestureRecognizerDelegate>
@end

@implementation DieLabel 


- (id) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    
    self.gestureRecognizers = @[tap];
    //number of taps required
    tap.numberOfTapsRequired = 1;
    //number of fingers required
    tap.numberOfTouchesRequired = 1;
    self.score = 1;
    return self;
}

-(void)rollDie{
    self.score = rand() % 6 + 1;
    self.text = [NSString stringWithFormat:@"%d", self.score];
    
    NSLog(@"%d", self.score);
}

-(void)handleTap:(UITapGestureRecognizer *)selector{
    [self.delegate dieLabelTapped: self];
    NSLog(@"Tapped");
}
@end

//
//  DieLabel.h
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DieLabel;

@protocol DieLabelDelegate <NSObject>
- (void)dieLabelTapped:(DieLabel *)sender;
@end

@interface DieLabel : UILabel 
@property (nonatomic, weak) id<DieLabelDelegate> delegate;
-(void)rollDie;
@end

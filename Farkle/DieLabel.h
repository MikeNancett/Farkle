//
//  DieLabel.h
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>


@end

@interface DieLabel : UILabel 
@property DieLabel *label;

//-(void)onDieLabelPressed:(UILabel *)label;

-(void)rollDie;
    



@end

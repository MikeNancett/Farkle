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
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel;
@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *labels;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int random = arc4random() % 6 + 1;
    // NSString *randomNumber = (@"%d", randomNumber);
    //self.label.text = @"%d", random;
    NSLog(@"%d", random);

}

- (IBAction)onRollButtonPressed:(UIButton *)sender {
    for (DieLabel *label in self.labels){
        [label rollDie];
//        self.dieLabel.text = [NSString stringWithFormat:@"%d",]
    }
    
}



@end

//
//  ViewController.h
//  Farkle
//
//  Created by Mike Nancett on 6/4/16.
//  Copyright © 2016 Mike Nancett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL isAdditionalTurnAvailable;
}
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end


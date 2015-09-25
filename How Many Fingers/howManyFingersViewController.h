//
//  howManyFingersViewController.h
//  How Many Fingers?
//
//  Created by Mac-Mini Mtn on 9/25/15.
//  Copyright (c) 2015 zeekhuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface howManyFingersViewController : UIViewController{
    
    __weak IBOutlet UIImageView *imageView_curtains;
    __weak IBOutlet UIImageView *imageView_fingers;
    
    __weak IBOutlet UIButton *button_chosen_1_var;
    __weak IBOutlet UIButton *button_chosen_2_var;
    __weak IBOutlet UIButton *button_chosen_3_var;
    __weak IBOutlet UIButton *button_chosen_4_var;
    __weak IBOutlet UIButton *button_chosen_5_var;
    
    __weak IBOutlet UIButton *button_click_var;
    
    __weak IBOutlet UILabel *label_text;
}

@end

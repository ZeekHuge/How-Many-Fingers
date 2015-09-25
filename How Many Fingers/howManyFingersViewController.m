//
//  howManyFingersViewController.m
//  How Many Fingers?
//
//  Created by Mac-Mini Mtn on 9/25/15.
//  Copyright (c) 2015 zeekhuge. All rights reserved.
//

#import "howManyFingersViewController.h"
#import <stdlib.h>
#define ANIMATIONtIMEgAP 0.15




//****************************************************************************
// Interface declared   ******************************************************
//****************************************************************************



@interface howManyFingersViewController ()

- (IBAction)button_pressed:(id)sender;

- (IBAction)button_chosen_1:(id)sender;
- (IBAction)button_chosen_2:(id)sender;
- (IBAction)button_chosen_3:(id)sender;
- (IBAction)button_chosen_4:(id)sender;
- (IBAction)button_chosen_5:(id)sender;

-(void) postNumberChosenEffects;
-(void) preGameStartEffects;
-(void) disableButtons;
- (void) prePlayButtonsConfig;
- (void) postChosenButtonsConfig;


-(void)openCurtians;
-(void)closeCurtains;

@end



//****************************************************************************
// Implementation starts *****************************************************
//****************************************************************************




@implementation howManyFingersViewController

int a, numberChosen, randomNumber;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    a = 1;
    randomNumber = arc4random()%5;
    printf("Random number is %d",randomNumber);
    imageView_fingers.image = [UIImage imageNamed:[NSString stringWithFormat:@"fingers_%d",randomNumber]];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//****************************************************************************
// Button functions     ******************************************************
//****************************************************************************


- (IBAction)button_pressed:(id)sender {
    
    printf("Button pressed\n");
    [self disableButtons];
    [self closeCurtains];
    
}

- (IBAction)button_chosen_1:(id)sender {
    printf("Number chosen 1\n");
    numberChosen = 1;
    [self disableButtons];
    [self openCurtians];
    [self postNumberChosenEffects];
}

- (IBAction)button_chosen_2:(id)sender {
    printf("Number chosen 2\n");
    numberChosen = 2;
    [self disableButtons];
    [self openCurtians];
    [self postNumberChosenEffects];
}

- (IBAction)button_chosen_3:(id)sender {
    printf("Number chosen 3\n");
    numberChosen = 3;
    [self disableButtons];
    [self openCurtians];
    [self postNumberChosenEffects];
}

- (IBAction)button_chosen_4:(id)sender {
    printf("Number chosen 4\n");
    numberChosen = 4;
    [self disableButtons];
    [self openCurtians];
    [self postNumberChosenEffects];
}

- (IBAction)button_chosen_5:(id)sender {
    printf("Number chosen 5\n");
    numberChosen = 5;
    [self disableButtons];
    [self openCurtians];
    [self postNumberChosenEffects];
}



//****************************************************************************
// Post and pre effects ******************************************************
//****************************************************************************

- (void) disableButtons{
    
    button_click_var.enabled = FALSE;
    button_click_var.alpha = 0.25;
    
    button_chosen_1_var.enabled = FALSE;
    button_chosen_1_var.alpha = 0.25 ;
    
    button_chosen_2_var.enabled = FALSE;
    button_chosen_2_var.alpha = 0.25 ;
    
    button_chosen_3_var.enabled = FALSE;
    button_chosen_3_var.alpha = 0.25 ;
    
    button_chosen_4_var.enabled = FALSE;
    button_chosen_4_var.alpha = 0.25 ;
    
    button_chosen_5_var.enabled = FALSE;
    button_chosen_5_var.alpha = 0.25 ;

}

- (void) prePlayButtonsConfig{
    
    button_click_var.enabled = FALSE;
    button_click_var.alpha = 0.25;
    
    button_chosen_1_var.enabled = TRUE;
    button_chosen_1_var.alpha = 1 ;
    
    button_chosen_2_var.enabled = TRUE;
    button_chosen_2_var.alpha = 1 ;
    
    button_chosen_3_var.enabled = TRUE;
    button_chosen_3_var.alpha = 1 ;
    
    button_chosen_4_var.enabled = TRUE;
    button_chosen_4_var.alpha = 1 ;
    
    button_chosen_5_var.enabled = TRUE;
    button_chosen_5_var.alpha = 1 ;
    
}

- (void) postChosenButtonsConfig{
    
    button_click_var.enabled = TRUE;
    button_click_var.alpha = 1;
    
    button_chosen_1_var.enabled = FALSE;
    button_chosen_1_var.alpha = 0.25 ;
    
    button_chosen_2_var.enabled = FALSE;
    button_chosen_2_var.alpha = 0.25 ;
    
    button_chosen_3_var.enabled = FALSE;
    button_chosen_3_var.alpha = 0.25 ;
    
    button_chosen_4_var.enabled = FALSE;
    button_chosen_4_var.alpha = 0.25 ;
    
    button_chosen_5_var.enabled = FALSE;
    button_chosen_5_var.alpha = 0.25 ;
    
}




- (void) preGameStartEffects {
    printf("inside preGameEffects\n");
    
    randomNumber = arc4random()%5;
    printf("Random number is %d",randomNumber);
    imageView_fingers.image = [UIImage imageNamed:[NSString stringWithFormat:@"fingers_%d",randomNumber]];
    
    label_text.text = @"Guess the number of fingers behind the curtains";
    
}

-(void) postNumberChosenEffects {
    printf("inside postNumberChosenEffects\n");
    
    if (numberChosen == randomNumber){
        label_text.text=@"Ahaa !! Nice guessing.";
    }
    else if (randomNumber == 0){
        label_text.text=@"LOL !! I just made a fool out of you.";
    }
    else {
        label_text.text=@"You are Genius !! Thats sarcasm";
    }
}



//****************************************************************************
// Curtain animations   ******************************************************
//****************************************************************************


// Opening curtains - function ***********************************************


- (void) openCurtians{
    printf("Opening curtains\n");
    
    if(a < 11){
        [NSTimer scheduledTimerWithTimeInterval:ANIMATIONtIMEgAP
                                         target:self
                                       selector:@selector(openCurtians)
                                       userInfo:nil
                                        repeats:NO];
        
        
        imageView_curtains.image = [UIImage imageNamed:[NSString stringWithFormat:@"curtain_open_f%d.png",a]];
        a++;
        
    }else{
        [self postChosenButtonsConfig];
    }
}


// Closing curtains - function ***********************************************


- (void) closeCurtains{
    printf("Closing curtains\n");
    
    if(a > 1){
        
        a--;
        [NSTimer scheduledTimerWithTimeInterval:ANIMATIONtIMEgAP
                                         target:self
                                       selector:@selector(closeCurtains)
                                       userInfo:nil
                                        repeats:NO];
        
        imageView_curtains.image = [UIImage imageNamed:[NSString stringWithFormat:@"curtain_open_f%d.png",a]];
    
        [self preGameStartEffects];
    }
    else{
        [self prePlayButtonsConfig];
    }
}


@end

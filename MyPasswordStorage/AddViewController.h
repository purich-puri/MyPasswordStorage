//
//  AddViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 6/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define kOFFSET_FOR_KEYBOARD 80.0

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController <UITextFieldDelegate>{
    NSMutableArray *_passwordList;
    UITextField *_activeTextField;
}

@property (weak, nonatomic) IBOutlet UITextField *titleTextbox;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextbox;
@property (weak, nonatomic) IBOutlet UITextField *generatedTextbox;


@property (weak, nonatomic) IBOutlet UILabel *lengthLabel;

@property (weak, nonatomic) IBOutlet UIStepper *lengthButtonChoice;

- (IBAction)lengthButton:(id)sender;

- (IBAction)generatePassword:(id)sender;

- (IBAction)saveButton:(id)sender;

-(int)getRandomNumberBetween:(int)min and:(int)max;



@end

NS_ASSUME_NONNULL_END

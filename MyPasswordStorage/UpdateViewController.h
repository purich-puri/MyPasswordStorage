//
//  UpdateViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 11/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UpdateViewController : UIViewController <UITextFieldDelegate>{
    NSMutableArray *_userAccount;
    UITextField *_activeTextField;
}

@property (weak, nonatomic) IBOutlet UILabel *lengthLabel;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextbox;
@property (weak, nonatomic) IBOutlet UITextField *titleTextbox;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextbox;

@property (weak, nonatomic) IBOutlet UINavigationItem *updateLabel;


@property (weak, nonatomic) IBOutlet UIStepper *lengthButtonChoice;

- (IBAction)lengthButton:(id)sender;
- (IBAction)generateButton:(id)sender;
- (IBAction)saveButton:(id)sender;

-(int)getRandomNumberBetween:(int)min and:(int)max;


@end

NS_ASSUME_NONNULL_END

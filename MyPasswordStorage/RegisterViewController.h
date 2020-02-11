//
//  RegisterViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 18/1/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController <UITextFieldDelegate>{}

@property (weak, nonatomic) IBOutlet UITextField *usernameTextbox;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextbox;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirmTextbox;

- (IBAction)Register:(id)sender;

@end

NS_ASSUME_NONNULL_END

//
//  LoginViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 2/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define kOFFSET_FOR_KEYBOARD 80.0

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <UITextFieldDelegate>{
    NSMutableArray *_userAccount;
    UITextField *_activeTextField;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameTextbox;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextbox;

- (IBAction)loginButton:(id)sender;


- (IBAction)unwindToLogin:(UIStoryboardSegue *)unwindSegue;

@end

NS_ASSUME_NONNULL_END

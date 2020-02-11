//
//  ProfileViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 9/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController <UITextFieldDelegate>{
    NSMutableArray *_userAccount;
}

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTextbox;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextbox;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextbox;

- (IBAction)changePassword:(id)sender;



@end

NS_ASSUME_NONNULL_END

//
//  AddViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 6/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController <UITextFieldDelegate>{
    NSMutableArray *_passwordList;
}

@property (weak, nonatomic) IBOutlet UITextField *titleTextbox;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextbox;



- (IBAction)generatePassword:(id)sender;

- (IBAction)saveButton:(id)sender;



@end

NS_ASSUME_NONNULL_END

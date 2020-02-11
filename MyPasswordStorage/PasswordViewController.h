//
//  PasswordViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 9/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface PasswordViewController : UIViewController{
    NSMutableArray *_userAccount;
}

@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;




@end

NS_ASSUME_NONNULL_END

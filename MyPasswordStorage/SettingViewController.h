//
//  SettingViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 6/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *upperCaseBOOL;
@property (weak, nonatomic) IBOutlet UISwitch *lowerCaseBOOL;
@property (weak, nonatomic) IBOutlet UISwitch *numbersBOOL;
@property (weak, nonatomic) IBOutlet UISwitch *numbersOnlyBOOL;



- (IBAction)upperCaseSwitch:(id)sender;
- (IBAction)lowerCaseSwitch:(id)sender;
- (IBAction)numbersSwitch:(id)sender;
- (IBAction)numbersOnlySwitch:(id)sender;


@end

NS_ASSUME_NONNULL_END

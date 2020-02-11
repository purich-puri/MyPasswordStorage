//
//  SettingViewController.m
//  MyPasswordStorage
//
//  Created by purich purisinsits on 6/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

@synthesize upperCaseBOOL, lowerCaseBOOL, numbersBOOL, numbersOnlyBOOL;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    upperCaseBOOL.on = [settings boolForKey:@"upperCase"];
    lowerCaseBOOL.on = [settings boolForKey:@"lowerCase"];
    numbersBOOL.on = [settings boolForKey:@"numbers"];
    numbersOnlyBOOL.on = [settings boolForKey:@"numbersOnly"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)upperCaseSwitch:(id)sender {
    if(upperCaseBOOL.on == YES){
        NSLog(@"upper on");
        numbersOnlyBOOL.on = NO;
        
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setBool:upperCaseBOOL.on forKey:@"upperCase"];
        [settings setBool:numbersOnlyBOOL.on forKey:@"numbersOnly"];
        [settings synchronize];
    }
    else{
        NSLog(@"upper off");
        if(upperCaseBOOL.on == NO && lowerCaseBOOL.on == NO){
            numbersOnlyBOOL.on = YES;
            
            NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
            [settings setBool:upperCaseBOOL.on forKey:@"upperCase"];
            [settings setBool:numbersOnlyBOOL.on forKey:@"numbersOnly"];
            [settings synchronize];
        }
        else{
            NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
            [settings setBool:upperCaseBOOL.on forKey:@"upperCase"];
            [settings synchronize];

        }
    }
    
}

- (IBAction)lowerCaseSwitch:(id)sender {
    if(lowerCaseBOOL.on == YES){
        NSLog(@"lower on");
        numbersOnlyBOOL.on = NO;
        
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setBool:lowerCaseBOOL.on forKey:@"lowerCase"];
        [settings setBool:numbersOnlyBOOL.on forKey:@"numbersOnly"];
        [settings synchronize];
    }
    else{
        NSLog(@"lower off");
        if(upperCaseBOOL.on == NO && lowerCaseBOOL.on == NO){
            numbersOnlyBOOL.on = YES;
            
            NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
            [settings setBool:lowerCaseBOOL.on forKey:@"lowerCase"];
            [settings setBool:numbersOnlyBOOL.on forKey:@"numbersOnly"];
            [settings synchronize];
        }
        else{
            NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
            [settings setBool:lowerCaseBOOL.on forKey:@"lowerCase"];
            [settings synchronize];
        }
    }
}

- (IBAction)numbersSwitch:(id)sender {
    if(numbersBOOL.on == YES){
        NSLog(@"number on");
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setBool:numbersBOOL.on forKey:@"numbers"];
        [settings synchronize];
    }
    else{
        NSLog(@"number off");
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setBool:numbersBOOL.on forKey:@"numbers"];
        [settings synchronize];

    }
}

- (IBAction)numbersOnlySwitch:(id)sender {
    if(numbersOnlyBOOL.on == YES){
        NSLog(@"numbersOnly on");
        upperCaseBOOL.on = NO;
        lowerCaseBOOL.on = NO;
        
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setBool:numbersOnlyBOOL.on forKey:@"numbersOnly"];
        [settings setBool:upperCaseBOOL.on forKey:@"upperCase"];
        [settings setBool:lowerCaseBOOL.on forKey:@"lowerCase"];
        [settings synchronize];

    }
    else{
        NSLog(@"numbersOnly off");
        upperCaseBOOL.on = YES;
        lowerCaseBOOL.on = YES;
        
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setBool:numbersOnlyBOOL.on forKey:@"numbersOnly"];
        [settings setBool:upperCaseBOOL.on forKey:@"upperCase"];
        [settings setBool:lowerCaseBOOL.on forKey:@"lowerCase"];
        [settings synchronize];
    }
}
@end

//
//  ProfileViewController.m
//  MyPasswordStorage
//
//  Created by purich purisinsits on 9/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import "ProfileViewController.h"
#import "LoginViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize usernameLabel, oldPasswordTextbox, passwordTextbox, confirmPasswordTextbox;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    oldPasswordTextbox.delegate = self;
    passwordTextbox.delegate = self;
    confirmPasswordTextbox.delegate = self;
    
    NSUserDefaults *credentials = [NSUserDefaults standardUserDefaults];
    NSString *userCredientials = [credentials objectForKey:@"loginAs"];
    
        
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"username == %@", userCredientials]];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _userAccount = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    usernameLabel.text = userCredientials;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changePassword:(id)sender {
    NSString * oldPassword = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"password"] objectAtIndex:0]];
    //NSLog(@"%@", oldPassword);
    if([oldPasswordTextbox.text isEqualToString: oldPassword]){
        if ([passwordTextbox.text isEqualToString:confirmPasswordTextbox.text]){
            
            NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
            
            NSManagedObject *updateLogin = [_userAccount objectAtIndex:0];
            
            [updateLogin setValue:[passwordTextbox text] forKey:@"password"];
            
            NSError *error = nil;
            
            [context save:&error];
            NSLog(@"passowrd updated");
        }
        else{
            self.confirmPasswordTextbox.layer.borderWidth = 1.0f;
            self.confirmPasswordTextbox.layer.borderColor = [[UIColor redColor] CGColor];
            self.oldPasswordTextbox.layer.borderWidth = 1.0f;
            self.oldPasswordTextbox.layer.borderColor = [[UIColor greenColor] CGColor];
        }
    }
    else{
        self.oldPasswordTextbox.layer.borderWidth = 1.0f;
        self.oldPasswordTextbox.layer.borderColor = [[UIColor redColor] CGColor];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end

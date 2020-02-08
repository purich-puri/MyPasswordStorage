//
//  RegisterViewController.m
//  MyPasswordStorage
//
//  Created by purich purisinsits on 18/1/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.usernameTextbox.layer.cornerRadius=5.0f;
    self.usernameTextbox.layer.borderWidth=1.0f;
    self.usernameTextbox.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    
    self.passwordTextbox.layer.cornerRadius=5.0f;
    self.passwordTextbox.layer.borderWidth=1.0f;
    self.passwordTextbox.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    
    self.passwordConfirmTextbox.layer.cornerRadius=5.0f;
    self.passwordConfirmTextbox.layer.borderWidth=1.0f;
    self.passwordConfirmTextbox.layer.borderColor=[[UIColor lightGrayColor] CGColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Register:(id)sender {
    if([_passwordTextbox.text isEqualToString: _passwordConfirmTextbox.text] && _usernameTextbox.hasText){
        NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
        
        NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];

        [user setValue:[_usernameTextbox text] forKey:@"username"];
        [user setValue:[_passwordTextbox text] forKey:@"password"];
        
        NSError *error = nil;
        [context save:&error];
        
        if(error != nil){
            NSLog(@"error: %@, %@", error, [error localizedDescription]);
        }
        
        //unwind with an ID manually
        //[self performSegueWithIdentifier:@"UnwindToLoginID" sender:self];
        [self performSegueWithIdentifier:@"RegisteredID" sender:self];
    }
    else if (!_usernameTextbox.hasText){
        NSLog(@"username is empty");
        self.usernameTextbox.layer.borderColor=[[UIColor redColor] CGColor];
        
        
        if(!_passwordTextbox.hasText){
            NSLog(@"password is also empty");
            self.passwordTextbox.layer.borderColor=[[UIColor redColor] CGColor];
        }
        
    }
    else if(_passwordTextbox.text != _passwordConfirmTextbox.text){
        NSLog(@"password does not match");
        self.usernameTextbox.layer.borderColor=[[UIColor lightGrayColor] CGColor];
        self.passwordTextbox.layer.borderColor=[[UIColor redColor] CGColor];
        self.passwordConfirmTextbox.layer.borderColor=[[UIColor redColor] CGColor];
        NSLog(@"password = %@", _passwordTextbox);
        NSLog(@"confirm = %@", _passwordConfirmTextbox);
    }
}

@end

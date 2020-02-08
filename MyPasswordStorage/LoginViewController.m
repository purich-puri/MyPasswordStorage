//
//  LoginViewController.m
//  MyPasswordStorage
//
//  Created by purich purisinsits on 2/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _usernameTextbox.delegate = self;
    _passwordTextbox.delegate = self;
    
    _userAccount = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

//KRISS KEYBOARD SHIFT SEGUE UP LOGIC
- (void)keyboardDidShow: (NSNotification *) notification {
    NSDictionary *info = [notification userInfo];
    
    CGRect keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGFloat keyboardY = self.view.frame.size.height - keyboardSize.size.height;
    
    CGFloat editingTextFieldY = _activeTextField.frame.origin.y;
    
    if (editingTextFieldY > keyboardY - 200) {
        NSLog(@"%f", self.view.frame.origin.y);
        NSLog(@"%f", self.view.frame.origin.y - (editingTextFieldY - (keyboardY - 180)));
        
        [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.view.frame = CGRectMake(0.0f, self.view.frame.origin.y - (editingTextFieldY - (keyboardY - 180)), self.view.bounds.size.width, self.view.bounds.size.height);
        } completion:nil];
    }
}

- (void)keyboardWillHide: (NSNotification *) notification {
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.frame = CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:nil];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _activeTextField = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//----------------------*

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _userAccount = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    //check if user already registered
    NSLog(@"number of user registered %i", (int)_userAccount.count);
    
    //if user hasn't registered, send them to register page/segue
    if(_userAccount.count <= 0){
        [self performSegueWithIdentifier:@"RegisterID" sender:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)loginButton:(id)sender {
    NSString *authUsername = _usernameTextbox.text;
    NSString *authPassword = _passwordTextbox.text;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    //filter search result
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"username == %@ AND password == %@", authUsername, authPassword]];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _userAccount = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@">: %@", _userAccount);
    if(_userAccount.count == 1){
        NSLog(@"Logged in");
        [self performSegueWithIdentifier:@"LoginID" sender:self];
    }
    else{
        NSLog(@"Wrong password");
    }
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)unwindSegue {
    //UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
}

@end

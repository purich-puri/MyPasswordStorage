//
//  AddViewController.m
//  MyPasswordStorage
//
//  Created by purich purisinsits on 6/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

@synthesize titleTextbox, usernameTextbox, generatedTextbox, lengthLabel, lengthButtonChoice;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _passwordList = [[NSMutableArray alloc] init];
    titleTextbox.delegate = self;
    usernameTextbox.delegate = self;
    generatedTextbox.delegate = self;
    lengthLabel.text = [NSString stringWithFormat:@"Length: %@", [[NSNumber numberWithDouble:lengthButtonChoice.value] stringValue]];
    self.titleTextbox.layer.borderWidth = 1.0f;
    self.titleTextbox.layer.cornerRadius = 5.0f;
    self.usernameTextbox.layer.borderWidth = 1.0f;
    self.usernameTextbox.layer.cornerRadius = 5.0f;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)lengthButton:(id)sender {
    lengthLabel.text = [NSString stringWithFormat:@"Length: %@", [[NSNumber numberWithDouble:lengthButtonChoice.value] stringValue]];
}

//TODO: SEPERATE CODE FOR EASIER READING
- (IBAction)generatePassword:(id)sender {
    //0 == OFF
    //1 == ON
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    NSNumber *upperCaseBOOL = [NSNumber numberWithBool:[settings boolForKey:@"upperCase"]];
    NSNumber *lowerCaseBOOL = [NSNumber numberWithBool:[settings boolForKey:@"lowerCase"]];
    NSNumber *numbersBOOL = [NSNumber numberWithBool:[settings boolForKey:@"numbers"]];
    NSNumber *numbersOnlyBOOL = [NSNumber numberWithBool:[settings boolForKey:@"numbersOnly"]];
    
    NSString *generatedPassword;
    NSString *tempPassword2;
    NSMutableArray *tempPassword = [NSMutableArray arrayWithCapacity:lengthButtonChoice.value];
    char c = '\0';
    
    //NUMBERS ONLY
    if([numbersOnlyBOOL isEqualToNumber: [NSNumber numberWithInt:1]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
            int value = [self getRandomNumberBetween:0 and:9];
            [tempPassword addObject:[NSNumber numberWithInt:value]];
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    //UPPERCASE LOWERCASE NUMBERS
    else if ([upperCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
             [lowerCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
             [numbersBOOL isEqualToNumber:[NSNumber numberWithInt:1]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
            int upperLowerNumber = [self getRandomNumberBetween:0 and:2];
            if(upperLowerNumber == 0){
                int value = [self getRandomNumberBetween:65 and:90];
                c = (char) value;
                tempPassword2 = [NSString stringWithFormat:@"%c", c];
                [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
            }
            else if (upperLowerNumber == 1){
                int value = [self getRandomNumberBetween:97 and:122];
                c = (char) value;
                tempPassword2 = [NSString stringWithFormat:@"%c", c];
                [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
            }
            else if (upperLowerNumber == 2){
                int value = [self getRandomNumberBetween:0 and:9];
                [tempPassword addObject:[NSNumber numberWithInt:value]];
            }
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    //UPPER LOWER
    else if ([upperCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
    [lowerCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
    [numbersBOOL isEqualToNumber:[NSNumber numberWithInt:0]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
            int upperLowerNumber = [self getRandomNumberBetween:0 and:1];
            if(upperLowerNumber == 0){
                int value = [self getRandomNumberBetween:65 and:90];
                c = (char) value;
                tempPassword2 = [NSString stringWithFormat:@"%c", c];
                [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
            }
            else if (upperLowerNumber == 1){
                int value = [self getRandomNumberBetween:97 and:122];
                c = (char) value;
                tempPassword2 = [NSString stringWithFormat:@"%c", c];
                [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
            }
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    //UPPER NUMBER
    else if ([upperCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
    [lowerCaseBOOL isEqualToNumber:[NSNumber numberWithInt:0]] &&
    [numbersBOOL isEqualToNumber:[NSNumber numberWithInt:1]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
            int upperLowerNumber = [self getRandomNumberBetween:0 and:1];
            if(upperLowerNumber == 0){
                int value = [self getRandomNumberBetween:65 and:90];
                c = (char) value;
                tempPassword2 = [NSString stringWithFormat:@"%c", c];
                [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
            }
            else if (upperLowerNumber == 1){
                int value = [self getRandomNumberBetween:0 and:9];
                [tempPassword addObject:[NSNumber numberWithInt:value]];
            }
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    //LOWER NUMBER
    else if ([upperCaseBOOL isEqualToNumber:[NSNumber numberWithInt:0]] &&
    [lowerCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
    [numbersBOOL isEqualToNumber:[NSNumber numberWithInt:1]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
            int upperLowerNumber = [self getRandomNumberBetween:0 and:1];
            if (upperLowerNumber == 0){
                int value = [self getRandomNumberBetween:97 and:122];
                c = (char) value;
                tempPassword2 = [NSString stringWithFormat:@"%c", c];
                [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
            }
            else if (upperLowerNumber == 1){
                int value = [self getRandomNumberBetween:0 and:9];
                [tempPassword addObject:[NSNumber numberWithInt:value]];
            }
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    //UPPER
    else if ([upperCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
    [lowerCaseBOOL isEqualToNumber:[NSNumber numberWithInt:0]] &&
    [numbersBOOL isEqualToNumber:[NSNumber numberWithInt:0]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
           int value = [self getRandomNumberBetween:65 and:90];
           c = (char) value;
           tempPassword2 = [NSString stringWithFormat:@"%c", c];
           [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    //LOWER
    else if ([upperCaseBOOL isEqualToNumber:[NSNumber numberWithInt:0]] &&
    [lowerCaseBOOL isEqualToNumber:[NSNumber numberWithInt:1]] &&
    [numbersBOOL isEqualToNumber:[NSNumber numberWithInt:0]]){
        for (int i = 0; i < lengthButtonChoice.value; i++) {
           int value = [self getRandomNumberBetween:97 and:122];
           c = (char) value;
           tempPassword2 = [NSString stringWithFormat:@"%c", c];
           [tempPassword addObject:[NSString stringWithFormat:@"%@", tempPassword2]];
        }
        generatedPassword = [tempPassword componentsJoinedByString:@""];
        generatedTextbox.text = generatedPassword;
    }
    NSLog(@"generated: %@", generatedPassword);
    
}

- (int)getRandomNumberBetween:(int)min and:(int)max{
    return min + arc4random_uniform((uint32_t)(max - min + 1));
}

- (IBAction)saveButton:(id)sender {
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    NSManagedObject *data = [NSEntityDescription insertNewObjectForEntityForName:@"DataCollection" inManagedObjectContext:context];
    
    if(titleTextbox.hasText && usernameTextbox.hasText && generatedTextbox.hasText){
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DataCollection"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"title = %@", titleTextbox.text]];
        NSArray *exist = [context executeFetchRequest:fetchRequest error:nil];
        if(exist.count > 0 ){
            NSLog(@"duplicate title names in core data!");
#warning creates empty data, don't know why
        }
        else {
            [data setValue:[titleTextbox text] forKey:@"title"];
            [data setValue:[usernameTextbox text] forKey:@"username"];
            [data setValue:[generatedTextbox text] forKey:@"password"];
            [data setValue:[NSDate date] forKey:@"timeCreated"];
            
            NSError *error = nil;
            
            [context save:&error];
            
            if (error != nil) {
                NSLog(@"failed to save! %@ %@", error, [error localizedDescription]);
            }
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if(!titleTextbox.hasText){
        self.titleTextbox.layer.borderColor = [[UIColor redColor] CGColor];
        self.usernameTextbox.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        if(!usernameTextbox.hasText){
            self.usernameTextbox.layer.borderColor = [[UIColor redColor] CGColor];
        }
    }
    else{
        self.titleTextbox.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.usernameTextbox.layer.borderColor = [[UIColor redColor] CGColor];
    }
    
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

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
@end

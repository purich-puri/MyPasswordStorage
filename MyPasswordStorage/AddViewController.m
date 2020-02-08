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

@synthesize titleTextbox, usernameTextbox;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _passwordList = [[NSMutableArray alloc] init];
    titleTextbox.delegate = self;
    usernameTextbox.delegate = self;
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

- (IBAction)generatePassword:(id)sender {
}

- (IBAction)saveButton:(id)sender {
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    NSManagedObject *data = [NSEntityDescription insertNewObjectForEntityForName:@"DataCollection" inManagedObjectContext:context];
    
    [data setValue:[titleTextbox text] forKey:@"title"];
    [data setValue:[usernameTextbox text] forKey:@"username"];
    [data setValue:@"defaultPassword" forKey:@"password"];
    [data setValue:[NSDate date] forKey:@"updated"];
    
    NSError *error = nil;
    
    [context save:&error];
    
    if (error != nil) {
        NSLog(@"failed to save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

//
//  PasswordViewController.m
//  MyPasswordStorage
//
//  Created by purich purisinsits on 9/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import "PasswordViewController.h"
#import "UpdateViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

@synthesize usernameLabel, passwordLabel, titleLabel, dateLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    usernameLabel.text = [NSString stringWithFormat:@"%@", [[NSNumber numberWithLong:_intLabel] stringValue]];
    
    _userAccount = [[NSMutableArray alloc] init];
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DataCollection"];
//       //filter search result
//       [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"title == %@", titleLabel.title]];
//
//       NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
//
//       _userAccount = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
//
//       //ADD objectAtIndex TO REMOVE PARENTHESIS
//       usernameLabel.text = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"username"] objectAtIndex:0]];
//       passwordLabel.text = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"password"] objectAtIndex:0]];
}

- (void)viewWillAppear:(BOOL)animated{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DataCollection"];
    //filter search result
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"title == %@", titleLabel.title]];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _userAccount = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    titleLabel.title = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"title"] objectAtIndex:0]];
    usernameLabel.text = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"username"] objectAtIndex:0]];
    passwordLabel.text = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"password"] objectAtIndex:0]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSDate *dateStamp = [[_userAccount valueForKeyPath:@"timeCreated"] objectAtIndex:0];
    dateLabel.text = [formatter stringFromDate:dateStamp];
    
    [self.view setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqual: @"UpdateID"]){
        UpdateViewController *vc = [segue destinationViewController];
        
        NSString *dataString = [NSString stringWithFormat:@"%@", [[_userAccount valueForKeyPath:@"title"] objectAtIndex:0]];
        //NSLog(@"%@", dataString);
        [vc.updateLabel setTitle: dataString];
        
    }else {
        //perform other segue like normal
    }

}

@end

//
//  PasswordListTableViewController.h
//  MyPasswordStorage
//
//  Created by purich purisinsits on 6/2/20.
//  Copyright © 2020 purich purisinsits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface PasswordListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *_passwordList;
}



@end

NS_ASSUME_NONNULL_END

//
//  ViewController.h
//  EduardoFC
//
//  Created by eduardo fulgencio on 10/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *contenedorTV;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityProcesando;

@end


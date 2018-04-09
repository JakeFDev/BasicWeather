//
//  ViewController.m
//  BasicWeather
//
//  Created by Jacob Fulton on 2/11/18.
//  Copyright © 2018 Jacob Fulton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (@available(iOS 11, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = true;
        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    }

}

@end

//
//  InterfaceController.h
//  BasicWeather WatchKit Extension
//
//  Created by Jacob Fulton on 2/11/18.
//  Copyright © 2018 Jacob Fulton. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *currentWeatherTextLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *cityStateLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *weatherLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceDate *dateLabel;
@property (strong, nonatomic) IBOutlet WKInterfaceButton *refreshButton;

@end

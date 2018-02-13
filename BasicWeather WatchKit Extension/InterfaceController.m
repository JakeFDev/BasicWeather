//
//  InterfaceController.m
//  BasicWeather WatchKit Extension
//
//  Created by Jacob Fulton on 2/11/18.
//  Copyright © 2018 Jacob Fulton. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController ()

@end


@implementation InterfaceController


int lat = 42;
int lon = 96;
CLLocationManager *locationManager;
const NSString *WEATHER_API_KEY = @"1407c73c598badaf4a915c70886984e2";
NSString *requestURL;

//Callback function when the location sucesfully updates
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    lat = locationManager.location.coordinate.latitude;
    lon = locationManager.location.coordinate.longitude;
    NSLog([NSString stringWithFormat:@"%d", lat]);
    NSLog([NSString stringWithFormat:@"%d", lon]);
    
    _cityStateLabel.text = [NSString stringWithFormat:@"%d", lat];
    _weatherLabel.text = [NSString stringWithFormat:@"%d", lon];
    
    NSLog(@"Sucesfully updaated location.");
}

//Callback function when the location fails to update
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    lat = locationManager.location.coordinate.latitude;
    lon = locationManager.location.coordinate.longitude;
    NSLog([NSString stringWithFormat:@"%d", lat]);
    NSLog([NSString stringWithFormat:@"%d", lon]);
    
    _cityStateLabel.text = [NSString stringWithFormat:@"%d", lat];
    _weatherLabel.text = [NSString stringWithFormat:@"%d", lon];
    
    NSLog(@"Failed to update location.");
    NSLog(error.localizedDescription);
}

//Callback function to when authorization changes
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus *)status {
    NSLog(@"Changed auth.");
}

- (IBAction)refreshTapped {
    [locationManager requestLocation];
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestLocation];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end




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


int lat, lon;
CLLocationManager *locationManager;
CLGeocoder *geoLocator;
const NSString *WEATHER_API_KEY = @"1407c73c598badaf4a915c70886984e2";  //OpenWeatherMap API
NSString *requestURL;

//Callback function when the location sucesfully updates
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    lat = locationManager.location.coordinate.latitude;
    lon = locationManager.location.coordinate.longitude;
    
    geoLocator = [[CLGeocoder alloc] init];
    [geoLocator reverseGeocodeLocation:locationManager.location
                     completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (!placemarks) {
            return;
        }
        
        if (placemarks && placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSString *city = [NSString stringWithFormat:@"%@", [placemark locality]];
            NSString *state = [NSString stringWithFormat:@"%@", [placemark administrativeArea]];
            _cityStateLabel.text = [NSString stringWithFormat:@"%@,%@", city, state];
        }
    }];
    
    NSLog(@"Sucesfully updaated location.");
}

//Callback function when the location fails to update
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
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




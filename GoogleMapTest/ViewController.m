//
//  ViewController.m
//  GoogleMapTest
//
//  Created by Aseem 1 on 11/12/15.
//  Copyright (c) 2015 codeBrew. All rights reserved.
//

#import "ViewController.h"
@import GoogleMaps;


@interface ViewController ()

@end

@implementation ViewController{
    GMSMapView *mapView_;
}

/*
 
 29D, Sector 29
 Chandigarh
 30.709194, 76.789042
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.712216
                                                            longitude:-74.22655
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
   // mapView_.mapType = kGMSTypeHybrid;
    mapView_.indoorEnabled = YES;
    mapView_.myLocationEnabled = YES;
    NSLog(@"My location %@",mapView_.myLocation);
   // UIEdgeInsets mapInsets = UIEdgeInsetsMake(100.0, 0.0, 0.0, 300.0);
    mapView_.delegate = self;
       
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.712216, -74.22655);
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.title = @"Hello";
    marker.snippet = @"there";
    marker.icon = [GMSMarker markerImageWithColor:[UIColor lightGrayColor]];
 //   marker.icon = [UIImage imageNamed:@"house"];
    marker.opacity = 0.6;
   // marker.infoWindowAnchor = CGPointMake(0.5, 0.5);
   // marker.icon = [UIImage imageNamed:@"newark_nj_1922.jpg"];

    marker.map = mapView_;
    
       GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(40.712216, -73.22655);
    marker2.appearAnimation = kGMSMarkerAnimationPop;
    marker2.title = @"Hello";
    marker2.snippet = @"there";
    marker2.icon = [GMSMarker markerImageWithColor:[UIColor lightGrayColor]];
    //   marker.icon = [UIImage imageNamed:@"house"];
    marker2.opacity = 0.6;
    // marker.infoWindowAnchor = CGPointMake(0.5, 0.5);
    // marker.icon = [UIImage imageNamed:@"newark_nj_1922.jpg"];
    
    marker2.map = mapView_;

    //Ground Overlay
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(40.712216,-74.22655);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(40.773941,-74.12544);
    GMSCoordinateBounds *overlayBounds = [[GMSCoordinateBounds alloc] initWithCoordinate:southWest
                                                                              coordinate:northEast];
    
    // Image from http://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg
    UIImage *icon = [UIImage imageNamed:@"newark_nj_1922.jpg"];
    GMSGroundOverlay *overlay =
    [GMSGroundOverlay groundOverlayWithBounds:overlayBounds icon:icon];
    overlay.bearing = 0;
    overlay.map = mapView_;
    UIEdgeInsets mapInsets = UIEdgeInsetsMake(60.0, 0.0, 0.0, 60.0);
    mapView_.padding = mapInsets;
    self.view = mapView_;

}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker
{
    CGPoint point = [mapView.projection pointForCoordinate:marker.position];
    point.y = point.y - 100;
    GMSCameraUpdate *camera =
    [GMSCameraUpdate setTarget:[mapView.projection coordinateForPoint:point]];
    [mapView animateWithCameraUpdate:camera];
    
    mapView.selectedMarker = marker;
    return YES;
}

-(void) mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.position = coordinate;
    marker3.title = @"170 Asbury Anderson Rd";
    marker3.snippet = @"US";
    marker3.map = mapView_;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

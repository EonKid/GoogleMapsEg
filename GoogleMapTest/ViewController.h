//
//  ViewController.h
//  GoogleMapTest
//
//  Created by Aseem 1 on 11/12/15.
//  Copyright (c) 2015 codeBrew. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface ViewController : UIViewController<GMSMapViewDelegate>


@property (strong, nonatomic) IBOutlet UIView *viewMap;


@end


//
//  MapInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MapInterface.h"

@implementation MapInterface

@synthesize delegate;
@synthesize map;
@synthesize locationManager;
@synthesize found;
@synthesize isService;
@synthesize alertView;
@synthesize anno;

- (void)dealloc
{
    NSLog(@"******| Map Interface |****** receive dealloc message!");
    delegate = nil;
    [map release];
    [anno release];
    [alertView release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
        CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40);
        map = [[MKMapView alloc] initWithFrame:rect];
        map.delegate = self;
        UIApplication* app = [UIApplication sharedApplication];
        app.applicationIconBadgeNumber = 10;
        app = nil;
        [self.view addSubview:map];
        isService = YES;
    }
    return self;
}

- (void)initInterface
{
    if(!map.showsUserLocation || map.showsUserLocation == NO){
//        NSLog(@"%@", map.showsUserLocation);
//        map.showsUserLocation = YES;
    }
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    if(!map.showsUserLocation || map.showsUserLocation == NO) return;
    NSLog(@"start locating user location");
    alertView = [[UIAlertView alloc] initWithTitle:@"正在定位您当前的位置..." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(alertView.bounds.size.width / 2 - 15, alertView.bounds.size.height - 50, 30, 30)];
    [indicator startAnimating];
    [alertView addSubview:indicator];
}

- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView
{
    NSLog(@"stop locating user location");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"did update user location!");
    
    if(alertView){
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        [alertView release];
        alertView = nil;
    }
//    found = YES;
//    anno = [[TestingAnnotation alloc] initWidthCoordinate:map.userLocation.coordinate];
//    [map addAnnotation:anno];
    [map setCenterCoordinate:userLocation.coordinate];
    [map setUserTrackingMode:MKUserTrackingModeFollow];
}

- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    NSLog(@"user tracking mode is:%d", mode);
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    if(alertView){
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        [alertView release];
        alertView = nil;
    }
    alertView = [[UIAlertView alloc] initWithTitle:@"定位失败通知" message:@"无法取得您当前位置，请确认是否已打开定位服务!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
    map.showsUserLocation = NO;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"did update to location!%f%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    if(found && anno){
        anno.coordinate = newLocation.coordinate;
        [map setCenterCoordinate:newLocation.coordinate animated:YES];
    }
//    NSLog(@"can user is apear: %@", map.userLocationVisible);
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* MewIndentifier = @"MewIndentifier";
    MKAnnotationView* ano = [mapView dequeueReusableAnnotationViewWithIdentifier:MewIndentifier];
    if(ano == nil){
        ano = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MewIndentifier];
        [ano autorelease];
    }
    ano.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"32" ofType:@"png"]];
    ano.canShowCallout = YES;
    
    return ano;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

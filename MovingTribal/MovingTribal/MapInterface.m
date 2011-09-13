//
//  MapInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MapInterface.h"
#import "TestingAnnotation.h"

@implementation MapInterface

@synthesize delegate;
@synthesize map;
@synthesize locationManager;

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initInterface];
}

- (void)initInterface
{
    CGRect mapRect = CGRectMake(0, 0, 320, 460);
    map = [[MKMapView alloc] initWithFrame:mapRect];
    map.mapType = MKMapTypeStandard;
    map.delegate = self;
    [self.view addSubview:map];
    
    TestingAnnotation* anno = [[TestingAnnotation alloc] init];
//    [map addAnnotation:anno];
    
    
    [map addAnnotation:anno];
    
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    locationManager.distanceFilter = 1000.0;
//    [locationManager startUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSLog(@"view for annotation");
    static NSString* MewIndentifier = @"MewImage";
    MKAnnotationView* annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:MewIndentifier];
    if(annoView == nil){
        annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MewIndentifier];
    }
    annoView.image = [UIImage imageNamed:@"32.png"];
    annoView.canShowCallout = YES;
    return annoView;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coordination = newLocation.coordinate;
    map.showsUserLocation = YES;
    [map setCenterCoordinate:coordination animated:YES];
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

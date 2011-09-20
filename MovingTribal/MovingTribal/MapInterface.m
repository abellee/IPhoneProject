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
@synthesize anno;

- (void)dealloc
{
    NSLog(@"******| Map Interface |****** receive dealloc message!");
    delegate = nil;
    [map release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
        [self initInterface];
    }
    return self;
}

- (void)initInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40);
    map = [[MKMapView alloc] initWithFrame:rect];
    map.delegate = self;
    map.showsUserLocation = YES;
    
    [self.view addSubview:map];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = 100;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    NSLog(@"location manager start updating location!");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"did update user location!");
    if(found){
        anno.coordinate = userLocation.coordinate;
    }else{
        anno = [[TestingAnnotation alloc] initWidthCoordinate:map.userLocation.coordinate];
    }
    found = YES;
    [map addAnnotation:anno];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(anno.coordinate, span);
    [map setRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"did update to location!%f%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
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

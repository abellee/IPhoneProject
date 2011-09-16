//
//  MapInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MapInterface.h"

#import "TestingAnnotation.h"

@implementation MapInterface

@synthesize delegate;
@synthesize map;

- (void)dealloc
{
    NSLog(@"map interface dealloc");
    delegate = nil;
    [map release];
    [super dealloc];
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initInterface];
}

- (void)initInterface
{
    CGRect rect = CGRectMake(0, 0, 320, 420);
    map = [[MKMapView alloc] initWithFrame:rect];
    map.delegate = self;
    
    TestingAnnotation* anno = [TestingAnnotation alloc];
    [map addAnnotation:anno];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(anno.coordinate, span);
    [map setRegion:region];
    
    [self.view addSubview:map];
    
    [anno release];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* MewIndentifier = @"MewIndentifier";
    MKAnnotationView* anno = [mapView dequeueReusableAnnotationViewWithIdentifier:MewIndentifier];
    if(anno == nil){
        anno = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MewIndentifier];
        [anno autorelease];
    }
    anno.image = [UIImage imageNamed:@"32.png"];
    anno.canShowCallout = YES;
    
    return anno;
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

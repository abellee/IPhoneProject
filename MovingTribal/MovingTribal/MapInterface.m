//
//  MapInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MapInterface.h"
#import "NetWork.h"
#import "Globals.h"

@implementation MapInterface

@synthesize delegate;
@synthesize map;
@synthesize locationManager;
@synthesize found;
@synthesize isService;
@synthesize alertView;
@synthesize anno;
@synthesize onlineUser;
@synthesize timer;

@synthesize la;

- (void)dealloc
{
    NSLog(@"******| Map Interface |****** receive dealloc message!");
    delegate = nil;
    [map release];
    [anno release];
    [alertView release];
	if(onlineUser) [onlineUser removeAllObjects];
	onlineUser = nil;
	map = nil;
	anno = nil;
	alertView = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
		[[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
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
	if(onlineUser){
		[onlineUser removeAllObjects];
	}
	onlineUser = [[NSMutableArray arrayWithCapacity:10] retain];
//	map.showsUserLocation = YES;
//	timer = nil;
//	
//    if(!map.showsUserLocation || map.showsUserLocation == NO){
////        NSLog(@"%@", map.showsUserLocation);
//        
//    }
	
	anno = [[TestingAnnotation alloc] init];
	map.showsUserLocation = NO;
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.distanceFilter = 500;
	[locationManager startUpdatingLocation];
	
	alertView = [[UIAlertView alloc] initWithTitle:@"正在定位您当前的位置..." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(alertView.bounds.size.width / 2 - 15, alertView.bounds.size.height - 50, 30, 30)];
    [indicator startAnimating];
    [alertView addSubview:indicator];
	[indicator release];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	NSLog(@"locating by location manager");
//	[locationManager stopUpdatingLocation];
	if(alertView){
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        [alertView release];
        alertView = nil;
    }
	
	anno.coordinate = newLocation.coordinate;
	[map addAnnotation:anno];
	
	[map setCenterCoordinate:newLocation.coordinate animated:YES];
	[map setRegion:MKCoordinateRegionMake(newLocation.coordinate, MKCoordinateSpanMake(0.01, 0.01)) animated:YES];
//    [map setUserTrackingMode:MKUserTrackingModeFollow];
	[[Globals getUserData] longitude:newLocation.coordinate.longitude];
	[[Globals getUserData] latitude:newLocation.coordinate.latitude];
	NSData* onlineUserData = [NetWork locate];
	[self performSelector:@selector(showOnlineUsers:) withObject:onlineUserData];
}

- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView
{
    NSLog(@"stop locating user location");
}

- (void)showOnlineUsers:(NSData *)onlineUsers
{
//	if(onlineUser){
//		for (UserData* oldUD in onlineUser) {
//			[map removeAnnotation:oldUD.annotation];
//		}
//		[onlineUser removeAllObjects];
//	}
//	NSLog(@"<<<<<<%d", [onlineUser count]);
	GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:onlineUsers options:0 error:nil];
	
	if(doc){
		NSArray* users = [doc.rootElement elementsForName:@"user"];
		for (GDataXMLElement* element in users) {
			NSLog(@"%@", [element description]);
			UserData* ud = [[UserData alloc] init];
			[ud parse:element];
			[onlineUser addObject:ud];
			NSLog(@"%f||||%f", ud.latitude, ud.longitude);
			CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(ud.latitude, ud.longitude);
			TestingAnnotation* ano = [[TestingAnnotation alloc] initWidthCoordinate:coor];
			[ano title:ud.nickname];
			[ano uid:ud.uid];
			[ano subtitle: [NSString stringWithFormat:@"年龄: %d 性别: %@", ud.age, ud.sex == 0 ? @"女" : @"男"]];
			[ud annotation:ano];
			[map addAnnotation:ano];
			[ano release];
		}
	}
}

- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    NSLog(@"user tracking mode is:%d", mode);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self performSelector:@selector(removeTimerAndAlertView)];
    alertView = [[UIAlertView alloc] initWithTitle:@"定位失败" message:@"无法取得您当前位置，请确认是否已打开定位服务!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
//    map.showsUserLocation = NO;
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
	ano.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	UIImageView* avatar = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"32" ofType:@"png"]]];
	ano.leftCalloutAccessoryView = avatar;
    
    return ano;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	TestingAnnotation* ano = (TestingAnnotation *)view.annotation;
	if(ano){
		for (UserData* ud in onlineUser) {
			if(ud.uid == ano.uid)
			{
				if(delegate && [delegate conformsToProtocol:@protocol(MainContainerDelegate)]){
					[delegate showProfileInterface:ud];
					return;
				}
			}
		}
	}else{
		// 是当前用户
	}
}

/*----------------------------------------------------------------------------*/

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

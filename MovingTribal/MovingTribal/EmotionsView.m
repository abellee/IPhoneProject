//
//  EmotionsView.m
//  MovingTribal
//
//  Created by Lee Abel on 9/23/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EmotionsView.h"

@implementation EmotionsView

@synthesize emotions;
@synthesize isPageControl;
@synthesize scrollView;
@synthesize pageControl;
@synthesize delegate;

- (id)init
{
	self = [super init];
	if(self){
		
	}
	return self;
}

- (void)setView:(UIView *)view
{
	[super setView:view];
	[self performSelector:@selector(initEmotions)];
}

- (void)dealloc
{
	NSLog(@"******| EmotionsView |****** receive dealloc message!");
	[scrollView release];
	[pageControl release];
	emotions = nil;
	scrollView = nil;
	pageControl = nil;
	[super dealloc];
}

- (void)initEmotions
{
	emotions = [NSArray arrayWithObjects:@"\ue415",@"\ue056",@"\ue057",@"\ue414",@"\ue405",@"\ue106",@"\ue418",@"\ue417",@"\ue40d",@"\ue40a",@"\ue404",@"\ue105",@"\ue409",@"\ue40e",@"\ue402",@"\ue108",@"\ue403",@"\ue058",@"\ue407",@"\ue401",@"\ue40f",@"\ue40b",@"\ue406",@"\ue413",@"\ue411",@"\ue412",@"\ue410",@"\ue107",@"\ue059",@"\ue416",@"\ue408",@"\ue40c",@"\ue11a",@"\ue10c",@"\ue32c",@"\ue32a",@"\ue32d",@"\ue328",@"\ue32b",@"\ue022",@"\ue023",@"\ue327",@"\ue329",@"\ue32e",@"\ue32f",@"\ue335",@"\ue334",@"\ue021",@"\ue337",@"\ue020",@"\ue336",@"\ue13c",@"\ue330",@"\ue331",@"\ue326",@"\ue03e",@"\ue11d",@"\ue05a",@"\ue00e",@"\ue421",@"\ue420",@"\ue00d",@"\ue010",@"\ue011",@"\ue41e",@"\ue012",@"\ue422",@"\ue22e",@"\ue22f",@"\ue231",@"\ue230",@"\ue427",@"\ue41d",@"\ue00f",@"\ue41f",@"\ue14c",@"\ue201",@"\ue115",@"\ue428",@"\ue51f",@"\ue429",@"\ue424",@"\ue423",@"\ue253",@"\ue426",@"\ue111",@"\ue425",@"\ue31e",@"\ue31f",@"\ue31d",@"\ue001",@"\ue002",@"\ue005",@"\ue004",@"\ue51a",@"\ue519",@"\ue518",@"\ue515",@"\ue516",@"\ue517",@"\ue51b",@"\ue152",@"\ue04e",@"\ue51c",@"\ue51e",@"\ue11c",@"\ue536",@"\ue003",@"\ue41c",@"\ue41b",@"\ue419",@"\ue41a",@"\ue04a",@"\ue04b",@"\ue049",@"\ue048",@"\ue04c",@"\ue13d",@"\ue443",@"\ue43e",@"\ue04f",@"\ue052",@"\ue053",@"\ue524",@"\ue52c",@"\ue52a",@"\ue531",@"\ue050",@"\ue527",@"\ue051",@"\ue10b",@"\ue52b",@"\ue52f",@"\ue528",@"\ue01a",@"\ue134",@"\ue530",@"\ue529",@"\ue526",@"\ue52d",@"\ue521",@"\ue523",@"\ue52e",@"\ue055",@"\ue525",@"\ue10a",@"\ue109",@"\ue522",@"\ue019",@"\ue054",@"\ue520",@"\ue306",@"\ue030",@"\ue304",@"\ue110",@"\ue032",@"\ue305",@"\ue303",@"\ue118",@"\ue447",@"\ue119",@"\ue307",@"\ue308",@"\ue444",@"\ue441",@"\ue436",@"\ue437",@"\ue438",@"\ue43a",@"\ue439",@"\ue43b",@"\ue117",@"\ue440",@"\ue442",@"\ue446",@"\ue445",@"\ue11b",@"\ue448",@"\ue033",@"\ue112",@"\ue325",@"\ue312",@"\ue310",@"\ue126",@"\ue127",@"\ue008",@"\ue03d",@"\ue00c",@"\ue12a",@"\ue00a",@"\ue00b",@"\ue009",@"\ue316",@"\ue129",@"\ue141",@"\ue142",@"\ue317",@"\ue128",@"\ue14b",@"\ue211",@"\ue114",@"\ue145",@"\ue144",@"\ue03f",@"\ue313",@"\ue116",@"\ue10f",@"\ue104",@"\ue103",@"\ue101",@"\ue102",@"\ue13f",@"\ue140",@"\ue11f",@"\ue12f",@"\ue031",@"\ue30e",@"\ue311",@"\ue113",@"\ue30f",@"\ue13b",@"\ue42b",@"\ue42a",@"\ue018",@"\ue016",@"\ue015",@"\ue014",@"\ue42c",@"\ue42d",@"\ue017",@"\ue013",@"\ue20e",@"\ue20c",@"\ue20f",@"\ue20d",@"\ue131",@"\ue12b",@"\ue130",@"\ue12d",@"\ue324",@"\ue301",@"\ue148",@"\ue502",@"\ue03c",@"\ue30a",@"\ue042",@"\ue040",@"\ue041",@"\ue12c",@"\ue007",@"\ue31a",@"\ue13e",@"\ue31b",@"\ue006",@"\ue302",@"\ue319",@"\ue321",@"\ue322",@"\ue314",@"\ue503",@"\ue10e",@"\ue318",@"\ue43c",@"\ue11e",@"\ue323",@"\ue31c",@"\ue034",@"\ue035",@"\ue045",@"\ue338",@"\ue047",@"\ue30c",@"\ue044",@"\ue30b",@"\ue043",@"\ue120",@"\ue33b",@"\ue33f",@"\ue341",@"\ue34c",@"\ue344",@"\ue342",@"\ue33d",@"\ue33e",@"\ue340",@"\ue34d",@"\ue339",@"\ue147",@"\ue343",@"\ue33c",@"\ue33a",@"\ue43f",@"\ue34b",@"\ue046",@"\ue345",@"\ue346",@"\ue348",@"\ue347",@"\ue34a",@"\ue349",@"\ue036",@"\ue157",@"\ue038",@"\ue153",@"\ue155",@"\ue14d",@"\ue156",@"\ue501",@"\ue158",@"\ue43d",@"\ue037",@"\ue504",@"\ue44a",@"\ue146",@"\ue50a",@"\ue505",@"\ue506",@"\ue122",@"\ue508",@"\ue509",@"\ue03b",@"\ue04d",@"\ue449",@"\ue44b",@"\ue51d",@"\ue44c",@"\ue124",@"\ue121",@"\ue433",@"\ue202",@"\ue135",@"\ue01c",@"\ue01d",@"\ue10d",@"\ue136",@"\ue42e",@"\ue01b",@"\ue15a",@"\ue159",@"\ue432",@"\ue430",@"\ue431",@"\ue42f",@"\ue01e",@"\ue039",@"\ue435",@"\ue01f",@"\ue125",@"\ue03a",@"\ue14e",@"\ue252",@"\ue137",@"\ue209",@"\ue154",@"\ue133",@"\ue150",@"\ue320",@"\ue123",@"\ue132",@"\ue143",@"\ue50b",@"\ue514",@"\ue513",@"\ue50c",@"\ue50d",@"\ue511",@"\ue50f",@"\ue512",@"\ue510",@"\ue50e",@"\ue21c",@"\ue21d",@"\ue21e",@"\ue21f",@"\ue220",@"\ue221",@"\ue222",@"\ue223",@"\ue224",@"\ue225",@"\ue210",@"\ue232",@"\ue233",@"\ue235",@"\ue234",@"\ue236",@"\ue237",@"\ue238",@"\ue239",@"\ue23b",@"\ue23a",@"\ue23d",@"\ue23c",@"\ue24d",@"\ue212",@"\ue24c",@"\ue213",@"\ue214",@"\ue507",@"\ue203",@"\ue20b",@"\ue22a",@"\ue22b",@"\ue226",@"\ue227",@"\ue22c",@"\ue22d",@"\ue215",@"\ue216",@"\ue217",@"\ue218",@"\ue228",@"\ue151",@"\ue138",@"\ue139",@"\ue13a",@"\ue208",@"\ue14f",@"\ue20a",@"\ue434",@"\ue309",@"\ue315",@"\ue30d",@"\ue207",@"\ue229",@"\ue206",@"\ue205",@"\ue204",@"\ue12e",@"\ue250",@"\ue251",@"\ue14a",@"\ue149",@"\ue23f",@"\ue240",@"\ue241",@"\ue242",@"\ue243",@"\ue244",@"\ue245",@"\ue246",@"\ue247",@"\ue248",@"\ue249",@"\ue24a",@"\ue24b",@"\ue23e",@"\ue532",@"\ue533",@"\ue534",@"\ue535",@"\ue21a",@"\ue219",@"\ue21b",@"\ue02f",@"\ue024",@"\ue025",@"\ue026",@"\ue027",@"\ue028",@"\ue029",@"\ue02a",@"\ue02b",@"\ue02c",@"\ue02d",@"\ue02e",@"\ue332",@"\ue333",@"\ue24e",@"\ue24f",@"\ue537", nil];

	isPageControl = false;
	NSUInteger totalPage = ceil([emotions count] / (NUM_PER_ROW * ROWS_PER_PAGE));
	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[scrollView setContentSize:CGSizeMake(self.view.frame.size.width * totalPage, self.view.frame.size.height)];
	scrollView.pagingEnabled = YES;
	scrollView.delegate = self;
	self.view.backgroundColor = [UIColor grayColor];
	pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 190, self.view.frame.size.width, 20)];
	pageControl.numberOfPages = totalPage;
	pageControl.currentPage = 0;
	pageControl.userInteractionEnabled = YES;
	pageControl.enabled = YES;
	[pageControl addTarget:self action:@selector(pageControlPressed:) forControlEvents:UIControlEventValueChanged];
	UIButton* emotionButton;
	for (NSUInteger j = 0; j < totalPage; j++) {
		NSUInteger startX = j * self.view.frame.size.width + 2;
		NSUInteger curStart = j * NUM_PER_ROW * ROWS_PER_PAGE;
		NSUInteger curEnd = curStart + NUM_PER_ROW * ROWS_PER_PAGE;
		for (NSUInteger i = curStart; i < curEnd; i++) {
			emotionButton = [UIButton buttonWithType:UIButtonTypeCustom];
			NSString* str = [emotions objectAtIndex:i];
			[emotionButton setTitle:str forState:UIControlStateNormal];
			CGRect rect = CGRectMake((i % NUM_PER_ROW) * (ITEM_SIZE + GAP) + GAP + startX, floorf((i - curStart) / NUM_PER_ROW) * (ITEM_SIZE + GAP) + GAP + 2, ITEM_SIZE, ITEM_SIZE);
			[emotionButton setFrame:rect];
			emotionButton.titleLabel.font = [UIFont systemFontOfSize:30];
			[[emotionButton layer] setBorderWidth:0.25];
			[emotionButton addTarget:self action:@selector(emotionsPressed:) forControlEvents:UIControlEventTouchUpInside];
			[scrollView addSubview:emotionButton];
		}
	}
	[self.view addSubview:scrollView];
	[self.view addSubview:pageControl];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)sv
{
	isPageControl = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sv
{
	if(isPageControl){
		return;
	}
	CGRect rect = sv.frame;
	NSUInteger page = floor(sv.contentOffset.x / rect.size.width);
	pageControl.currentPage = page;
}

- (void)pageControlPressed:(id)sender
{
	isPageControl = YES;
	NSUInteger page = pageControl.currentPage;
	NSLog(@"%d", pageControl.currentPage);
	[scrollView setContentOffset:CGPointMake(page * scrollView.frame.size.width, 0) animated:YES];
}

- (void)emotionsPressed:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(EmotionsDelegate)]){
		[delegate emotionInput:[sender titleForState:UIControlStateNormal]];
	}
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

//
//  Building.m
//  CanaClone
//
//  Created by Josh Click on 1/1/13.
//
//

#import "Building.h"

static NSString * ImgWall1Left = @"wall1-left.png";
static NSString * ImgWall2Left = @"wall2-left.png";
static NSString * ImgWall3Left = @"wall3-left.png";
static NSString * ImgWall4Left = @"wall4-left.png";
static NSString * ImgWall1Middle = @"wall1-middle.png";
static NSString * ImgWall2Middle = @"wall2-middle.png";
static NSString * ImgWall3Middle = @"wall3-middle.png";
static NSString * ImgWall4Middle = @"wall4-middle.png";
static NSString * ImgWall1Right = @"wall1-right.png";
static NSString * ImgWall2Right = @"wall2-right.png";
static NSString * ImgWall3Right = @"wall3-right.png";
static NSString * ImgWall4Right = @"wall4-right.png";


static NSString * ImgRoof1Left = @"roof1-left.png";
static NSString * ImgRoof2Left = @"roof2-left.png";
static NSString * ImgRoof3Left = @"roof3-left.png";
static NSString * ImgRoof4Left = @"roof4-left.png";
static NSString * ImgRoof5Left = @"roof6-left.png";
static NSString * ImgRoof6Left = @"roof5-left.png";
static NSString * ImgRoof1Middle = @"roof1-middle.png";
static NSString * ImgRoof2Middle = @"roof2-middle.png";
static NSString * ImgRoof3Middle = @"roof3-middle.png";
static NSString * ImgRoof4Middle = @"roof4-middle.png";
static NSString * ImgRoof5Middle = @"roof6-middle.png";
static NSString * ImgRoof6Middle = @"roof5-middle.png";
static NSString * ImgRoof1Right = @"roof1-right.png";
static NSString * ImgRoof2Right = @"roof2-right.png";
static NSString * ImgRoof3Right = @"roof3-right.png";
static NSString * ImgRoof4Right = @"roof4-right.png";
static NSString * ImgRoof5Right = @"roof6-right.png";
static NSString * ImgRoof6Right = @"roof5-right.png";

static NSString * ImgWall1LeftCracked = @"wall1-left-cracked.png";
static NSString * ImgWall2LeftCracked = @"wall2-left-cracked.png";
static NSString * ImgWall3LeftCracked = @"wall3-left-cracked.png";
static NSString * ImgWall4LeftCracked = @"wall4-left-cracked.png";
static NSString * ImgWall1MiddleCracked = @"wall1-middle-cracked.png";
static NSString * ImgWall2MiddleCracked = @"wall2-middle-cracked.png";
static NSString * ImgWall3MiddleCracked = @"wall3-middle-cracked.png";
static NSString * ImgWall4MiddleCracked = @"wall4-middle-cracked.png";
static NSString * ImgWall1RightCracked = @"wall1-right-cracked.png";
static NSString * ImgWall2RightCracked = @"wall2-right-cracked.png";
static NSString * ImgWall3RightCracked = @"wall3-right-cracked.png";
static NSString * ImgWall4RightCracked = @"wall4-right-cracked.png";

static NSString * ImgRoof1LeftCracked = @"roof1-left-cracked.png";
static NSString * ImgRoof2LeftCracked = @"roof2-left-cracked.png";
static NSString * ImgRoof3LeftCracked = @"roof3-left-cracked.png";
static NSString * ImgRoof4LeftCracked = @"roof4-left-cracked.png";
static NSString * ImgRoof5LeftCracked = @"roof6-left-cracked.png";
static NSString * ImgRoof6LeftCracked = @"roof5-left-cracked.png";
static NSString * ImgRoof1MiddleCracked = @"roof1-middle-cracked.png";
static NSString * ImgRoof2MiddleCracked = @"roof2-middle-cracked.png";
static NSString * ImgRoof3MiddleCracked = @"roof3-middle-cracked.png";
static NSString * ImgRoof4MiddleCracked = @"roof4-middle-cracked.png";
static NSString * ImgRoof5MiddleCracked = @"roof6-middle-cracked.png";
static NSString * ImgRoof6MiddleCracked = @"roof5-middle-cracked.png";
static NSString * ImgRoof1RightCracked = @"roof1-right-cracked.png";
static NSString * ImgRoof2RightCracked = @"roof2-right-cracked.png";
static NSString * ImgRoof3RightCracked = @"roof3-right-cracked.png";
static NSString * ImgRoof4RightCracked = @"roof4-right-cracked.png";
static NSString * ImgRoof5RightCracked = @"roof6-right-cracked.png";
static NSString * ImgRoof6RightCracked = @"roof5-right-cracked.png";


static NSString * ImgFloor1Left = @"floor1-left.png";
static NSString * ImgFloor2Left = @"floor2-left.png";
static NSString * ImgFloor1Middle = @"floor1-middle.png";
static NSString * ImgFloor2Middle = @"floor2-middle.png";
static NSString * ImgFloor1Right = @"floor1-right.png";
static NSString * ImgFloor2Right = @"floor2-right.png";


static NSString * ImgWindow1 = @"window1.png";
static NSString * ImgWindow2 = @"window2.png";
static NSString * ImgWindow3 = @"window3.png";
static NSString * ImgWindow4 = @"window4.png";

static NSArray * leftWalls;
static NSArray * rightWalls;
static NSArray * middleWalls;
static NSArray * leftWallsCracked;
static NSArray * rightWallsCracked;
static NSArray * middleWallsCracked;


static NSArray * leftFloors;
static NSArray * middleFloors;
static NSArray * rightFloors;

static NSArray * leftRoofs;
static NSArray * middleRoofs;
static NSArray * rightRoofs;

static NSArray * leftRoofsCracked;
static NSArray * middleRoofsCracked;
static NSArray * rightRoofsCracked;

static NSArray * windowImages;

@implementation Building



- (void)createBuildings
{
	//CCNode *parent = [self getChildByTag:kTagParentNode];
	
	CCSprite *sprite = [CCSprite spriteWithTexture:spriteTexture_ rect:CGRectMake(0,0,128,128)];
	[parent addChild:sprite z:300];
	
	sprite.position = ccp( 200, 200);

	
	return;
	
}


-(void) updatePos:(ccTime)delta
{
    for (CCSprite* sprite in parent.children)
    {
		CGPoint pos=sprite.position;
		
		sprite.position = pos;
	}
}

- (id)init
{
	if (self = [super init]) {
		
		leftWalls = @[ImgWall1Left,
					 ImgWall2Left,
					 ImgWall3Left,
					 ImgWall4Left];
		rightWalls = @[ImgWall1Right,
					  ImgWall2Right,
					  ImgWall3Right,
					  ImgWall4Right];
		middleWalls = @[ImgWall1Middle,
					   ImgWall2Middle,
					   ImgWall3Middle,
					   ImgWall4Middle];
		leftWallsCracked = @[ImgWall1LeftCracked,
							ImgWall2LeftCracked,
							ImgWall3LeftCracked,
							ImgWall4LeftCracked];
		rightWallsCracked = @[ImgWall1RightCracked,
							 ImgWall2RightCracked,
							 ImgWall3RightCracked,
							 ImgWall4RightCracked];
		middleWallsCracked = @[ImgWall1MiddleCracked,
							  ImgWall2MiddleCracked,
							  ImgWall3MiddleCracked,
							  ImgWall4MiddleCracked];
		
		leftFloors = @[ImgFloor1Left,
					  ImgFloor2Left];
		middleFloors = @[ImgFloor1Middle,
						ImgFloor2Middle];
		rightFloors = @[ImgFloor1Right,
					   ImgFloor2Right];
		
		leftRoofs = @[ImgRoof1Left,
					 ImgRoof2Left,
					 ImgRoof3Left,
					 ImgRoof4Left,
					 ImgRoof5Left,
					 ImgRoof6Left];
		middleRoofs = @[ImgRoof1Middle,
					   ImgRoof2Middle,
					   ImgRoof3Middle,
					   ImgRoof4Middle,
					   ImgRoof5Middle,
					   ImgRoof6Middle];
		rightRoofs = @[ImgRoof1Right,
					  ImgRoof2Right,
					  ImgRoof3Right,
					  ImgRoof4Right,
					  ImgRoof5Right,
					  ImgRoof6Right];
		
		leftRoofsCracked = @[ImgRoof1LeftCracked,
							ImgRoof2LeftCracked,
							ImgRoof3LeftCracked,
							ImgRoof4LeftCracked,
							ImgRoof5LeftCracked,
							ImgRoof6LeftCracked];
		middleRoofsCracked = @[ImgRoof1MiddleCracked,
							  ImgRoof2MiddleCracked,
							  ImgRoof3MiddleCracked,
							  ImgRoof4MiddleCracked,
							  ImgRoof5MiddleCracked,
							  ImgRoof6MiddleCracked];
		rightRoofsCracked = @[ImgRoof1RightCracked,
							 ImgRoof2RightCracked,
							 ImgRoof3RightCracked,
							 ImgRoof4RightCracked,
							 ImgRoof5RightCracked,
							 ImgRoof6RightCracked];
		
		windowImages = @[ImgWindow1,
						ImgWindow2,
						ImgWindow3,
						ImgWindow4];
		
		//buildings = [[NSMutableArray alloc] initWithCapacity:4];
		
		//[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlsas.plist"];
		parent = [CCSpriteBatchNode batchNodeWithFile:@"giant_leg_bottom.png"];
		spriteTexture_ = [parent texture];
		[self addChild:parent];
		
		[self createBuildings];
		[self scheduleUpdate];
	}
	return self;
}

@end

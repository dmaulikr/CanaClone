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

//----------------------

static NSString * ImgBillboardTopMiddle = @"billboard_top-middle.png";
static NSString * ImgBillboardTopLeft = @"billboard_top-left.png";
static NSString * ImgBillboardTopRight = @"billboard_top-right.png";

static NSString * ImgBillboardMiddleLeft = @"billboard_middle-left.png";
static NSString * ImgBillboardMiddleRight = @"billboard_middle-right.png";
static NSString * ImgBillboardMiddleMiddle = @"billboard_middle-middle.png";


static NSString * ImgBillboardBottomMiddle = @"billboard_bottom-middle.png";
static NSString * ImgBillboardBottomLeft = @"billboard_bottom-left.png";
static NSString * ImgBillboardBottomRight = @"billboard_bottom-right.png";

static NSString * ImgBillboardCatwalkMiddle = @"billboard_catwalk-middle.png";
static NSString * ImgBillboardCatwalkLeft = @"billboard_catwalk-left.png";
static NSString * ImgBillboardCatwalkRight = @"billboard_catwalk-right.png";
static NSString * ImgBillboardPost = @"billboard_post.png";
static NSString * ImgBillboardPost2 = @"billboard_post2.png";
static NSString * ImgBillboardDmg1 = @"billboard_dmg1.png";
static NSString * ImgBillboardDmg2 = @"billboard_dmg2.png";
static NSString * ImgBillboardDmg3 = @"billboard_dmg3.png";

//-----------------
static NSString * ImgAntenna5 = @"antenna5.png";

static NSString * ImgCrane1 = @"crane1.png"; //beam
static NSString * ImgCrane2 = @"crane2.png"; //post
static NSString * ImgCrane3 = @"crane3.png"; //counterweight
static NSString * ImgCrane4 = @"crane4.png"; //cabin
static NSString * ImgCrane5 = @"crane5.png"; //pulley
//------------

@implementation Building

@synthesize buildingWidth;
@synthesize platHeight;

- (void)initSpriteLists
{
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
}

- (void)createCrane
{
	tileSize = 32;
	
	int maxRow = pixelHeight/tileSize + 1;
	int maxCol = BUWidth*4;
	
	buildingWidth = maxCol*tileSize+tileSize;
	platHeight = pixelHeight;

	int postCol = maxCol/3;
	//in future, make crane be able to face both ways
	
	for (int row = 0; row <= maxRow; row++) {
		for (int col = 0; col < maxCol; col++) {
			CCSprite *sprite;
			if (row == 0) { //for the main post
				
				if (col == 0) {
					//this is for the weight on the crane
					sprite = [CCSprite spriteWithSpriteFrameName:ImgCrane3];
					sprite.anchorPoint = ccp(0.0f, 1.0f);
					[wallBatch addChild:sprite z:20];
					sprite.position = ccp(screenSize.width + col * tileSize+8, pixelHeight - row * tileSize-8);
					
					//this is for antenna
					sprite = [CCSprite spriteWithSpriteFrameName:ImgAntenna5];
					sprite.anchorPoint = ccp(0.0f, 0.0f);
					[wallBatch addChild:sprite z:20];
					sprite.position = ccp(screenSize.width + col * tileSize-4, pixelHeight - row * tileSize-1);
				}
				
				if (col == postCol) { //for crane controller
					sprite = [CCSprite spriteWithSpriteFrameName:ImgCrane4];
					sprite.anchorPoint = ccp(0.0f, 0.75f);
					[wallBatch addChild:sprite z:20];
					sprite.position = ccp(screenSize.width + col * tileSize-8, pixelHeight - row * tileSize);
				}
				
				
					sprite = [CCSprite spriteWithSpriteFrameName:ImgCrane2];
					sprite.rotation = 90;
				
			} else if (row > 0 && col == postCol) //for the support post to ground
				sprite = [CCSprite spriteWithSpriteFrameName:ImgCrane2];
			else
				continue;
				
			sprite.anchorPoint = ccp(0.0f, 1.0f);
			[wallBatch addChild:sprite z:10];
			sprite.position = ccp(screenSize.width + col * tileSize, pixelHeight - row * tileSize);
		}
	}
}



- (void)createBillboard
{
	tileSize = 16;

	int maxCol = BUWidth*2+4; //must be even number since some sprites are double sized
	if (maxCol<10) maxCol = 16; //set min and max width
	else if (maxCol > 24) maxCol = 24; 
	
	int maxRow = maxCol*2/5; //make height 2/3 the length

	buildingWidth = maxCol*tileSize + tileSize;
	platHeight = pixelHeight+tileSize;

	
	for (int row = 0; row <= maxRow; row++) { //draw billboard from bottom up instead
		for (int col = 0; col < maxCol; col++) {
			CCSprite *sprite;
			if (row == 0) { //for the bottom of billboard
				if (col == 0) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardCatwalkLeft];
				}
				else if (col == maxCol-1) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardCatwalkRight];
				}
				else {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardCatwalkMiddle]; //extra stuff since middle piece is 3px shorter
					sprite.anchorPoint = ccp(0.0f, 0.0f);
					[wallBatch addChild:sprite z:10];
					sprite.position = ccp(screenSize.width + col * tileSize, pixelHeight + row * tileSize + 3);
					continue;
				}
			}
			else if (row == 1) {
				if (col == 0) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardBottomLeft];
				}
				else if (col == maxCol-2) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardBottomRight];
				}
				else if (col%2==0){
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardBottomMiddle];
				}
				else
					continue;
			}
			else if (row == maxRow) {
				if (col == 0) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardTopLeft];
				}
				else if (col == maxCol-2) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardTopRight];
				}
				else if (col%2==0){
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardTopMiddle];
				}
				else
					continue;
			}
			else if ((row+1)%2 == 0) {
				if (col == 0) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardMiddleLeft];
				}
				else if (col == maxCol-2) {
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardMiddleRight];
				}
				else if (col%2==0){
					sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardMiddleMiddle];
				}
				else
					continue;
			}
			else
				continue;
			sprite.anchorPoint = ccp(0.0f, 0.0f);
			[wallBatch addChild:sprite z:10];
			sprite.position = ccp(screenSize.width + col * tileSize, pixelHeight + row * tileSize);
		}
	}
	
	//draw the post
	for (int i = 0; i <= platHeight/tileSize; i++) {
		CCSprite *sprite;
		if (i == 0) {
			sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardPost2];
		}
		else if ((i+1)%2 == 0) //this is double height sprite
			sprite = [CCSprite spriteWithSpriteFrameName:ImgBillboardPost];
		else
			continue;
		sprite.anchorPoint = ccp(0.5f,1.0f);
		[wallBatch addChild:sprite z:1];
		sprite.position = ccp(screenSize.width + maxCol/2 * tileSize, pixelHeight - i * tileSize + 8);
	}
}


- (void)createBuilding
{
	tileSize = 16;

	int maxRow = pixelHeight/tileSize + 1;
	int maxCol = BUWidth*4 +2; //windows + edges
	
	buildingWidth = maxCol*tileSize+tileSize;
	platHeight = pixelHeight;	
	
	int roof = arc4random()%6;
	int window = arc4random()%4;
	int wall = arc4random()%4;
	
	for (int row = 0; row <= maxRow; row++) {
		for (int col = 0; col < maxCol; col++) {
			CCSprite *sprite;
			if (row == 0) { //for the top of the building
				if (col == 0) {
					sprite = [CCSprite spriteWithSpriteFrameName:leftRoofs[roof]];
				}
				else if (col == maxCol-1) {
					sprite = [CCSprite spriteWithSpriteFrameName:rightRoofs[roof]];
				}
				else {
					sprite = [CCSprite spriteWithSpriteFrameName:middleRoofs[roof]];
				}
			}
			else if (row%2 == 0 && col > 0 && col < maxCol - 1) { //if in an even row, make it a window
				if ((col-1)%4 == 0) { //window tex are 4 tiles long
					sprite = [CCSprite spriteWithSpriteFrameName:windowImages[window]];
				}
				else
					continue;
			}
			else {
				if (col == 0) {
					sprite = [CCSprite spriteWithSpriteFrameName:leftWalls[wall]];
				}
				else if (col == maxCol-1) {
					sprite = [CCSprite spriteWithSpriteFrameName:rightWalls[wall]];
				}
				else {
					sprite = [CCSprite spriteWithSpriteFrameName:middleWalls[wall]];
				}
			}
			sprite.anchorPoint = ccp(0.0f, 1.0f);
			[wallBatch addChild:sprite z:10];
			sprite.position = ccp(screenSize.width + col * tileSize, pixelHeight - row * tileSize);
		}
	}
	
	//add props here
	BuildingProps *buildingProps = [[BuildingProps alloc] initWithWidth:buildingWidth height:platHeight];
	[self addChild:buildingProps];

}


- (id)initWithScrollSpeed:(float)scrollSpeed
{
	if (self = [super init]) {
		[self initSpriteLists];
		screenSize = [[CCDirector sharedDirector] winSize];
		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlas.plist"];
		wallBatch = [CCSpriteBatchNode batchNodeWithFile:@"Object_Atlas.png" capacity:750];
		[self addChild:wallBatch];
		wallBatch.anchorPoint = ccp(0.0f,0.0f);
		
		BUWidth = arc4random()%5 + 2 + (int)scrollSpeed/80;
		pixelHeight = arc4random()%70 + 70;
		
		float buildingType = arc4random();
		
		if (scrollSpeed == 150.0f) { //for the first building
			pixelHeight = 200;
			BUWidth = 15;
			buildingType = 1;
		}

		if (buildingType > 0.25)
			[self createBuilding];
		else if (buildingType < 0.25) {
			if (buildingType < 0.15) 
				[self createBillboard];
			else
				[self createCrane];
		}
		else
			CCLOG(@"dude problem with the building type");

		
	}
	return self;

}


@end

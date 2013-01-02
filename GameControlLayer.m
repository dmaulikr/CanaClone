//
//  GameControlLayer.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameControlLayer.h"
#import "Runner.h"
#import "Building.h"

@implementation GameControlLayer

- (void)initButtons {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
	CGRect jumpButtonDimensions = CGRectMake(0, 0, 64.0f, 64.0f);
    CGPoint jumpButtonPosition = ccp(screenSize.width*0.93f, screenSize.height*0.11f);
	
	SneakyButtonSkinnedBase *jumpButtonBase = [[SneakyButtonSkinnedBase alloc] init];
	jumpButtonBase.position = jumpButtonPosition;
	jumpButtonBase.defaultSprite =[CCSprite spriteWithFile:@"crane3.png"];
	jumpButtonBase.button = [[SneakyButton alloc] initWithRect:jumpButtonDimensions];

	jumpButton = jumpButtonBase.button;
	jumpButton.isHoldable = YES;
	jumpButton.isToggleable = NO;
	[self addChild:jumpButtonBase];
}

- (void)initRunner {
	CGSize screenSize = [CCDirector sharedDirector].winSize;

	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Runner_Atlas.plist"];
	CCSpriteBatchNode *sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"Runner_Atlas.png"];
	[self addChild:sceneSpriteBatchNode z:1];
	
	runner = [[Runner alloc] initWithSpriteFrame:[[CCSpriteFrameCache
														   sharedSpriteFrameCache]
														  spriteFrameByName:@"runner_1.png"]];
	
	[runner setJumpButton:jumpButton];
	[runner setPosition:ccp(screenSize.width * 0.35f,
							screenSize.height * 0.14f)];
	
	[sceneSpriteBatchNode addChild:runner z:100];
	
}

- (void)initBuildings
{
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlas.plist"];
	buildingBatch = [CCSpriteBatchNode batchNodeWithFile:@"Object_Atlas.png"];
	[self addChild:buildingBatch z:0];
	
	
}

	
-(void) update:(ccTime)deltaTime
{
	[runner updateStateWithDeltaTime:deltaTime];
	
	CCArray *buildingList = [buildingBatch children];
	
	for (Building *building in buildingList) {
		[building updatePos:deltaTime];
	}
}

-(id)init {

    if (self = [super init]) {
        // enable touches
        self.isTouchEnabled = YES;
		
		[self initButtons];
		
		[self initRunner];
		
		
		
		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlas.plist"];
		CCSpriteBatchNode *wallBatch = [CCSpriteBatchNode batchNodeWithFile:@"Object_Atlas.png"];
		[self addChild:wallBatch z:0];
		
		
		int maxRow = 20;
		for (int row = 0; row < maxRow; row++) {
			for (int col = 0; col < 10; col++) {
				CCSprite *sprite;
				if (col == 0) {
					if (row == 0) {
						sprite = [CCSprite spriteWithSpriteFrameName:@"roof2-left.png"];
					}
					else if (row == maxRow-1) {
						sprite = [CCSprite spriteWithSpriteFrameName:@"roof2-right.png"];
					}
					else {
						sprite = [CCSprite spriteWithSpriteFrameName:@"roof2-middle.png"];
					}
				}
				else {
					if (row == 0) {
						sprite = [CCSprite spriteWithSpriteFrameName:@"wall2-left.png"];
					}
					else if (row == maxRow-1) {
						sprite = [CCSprite spriteWithSpriteFrameName:@"wall2-right.png"];
					}
					else {
						sprite = [CCSprite spriteWithSpriteFrameName:@"wall2-middle.png"];
					}
				}
				
				[wallBatch addChild:sprite z:20];
				sprite.position = ccp( 200+ row * sprite.boundingBox.size.width, 300 - col * sprite.boundingBox.size.height);
			}
		}
		
		//Building *building = [[Building alloc] init];
		
		
		
		
		
		
		
		
		
		[self scheduleUpdate];
	}
	return self;
}

@end

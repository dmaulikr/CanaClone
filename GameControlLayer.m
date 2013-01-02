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
		CCSpriteBatchNode *blah = [CCSpriteBatchNode batchNodeWithFile:@"giant_leg_bottom.png"];
		CCTexture2D *spriteTexture_ = [blah texture];
		[self addChild:blah];
		
		CCSprite *sprite = [CCSprite spriteWithTexture:spriteTexture_ rect:CGRectMake(0,0,128,128)];
		[blah addChild:sprite z:300];
		
		sprite.position = ccp( 200, 200);
		
		//Building *building = [[Building alloc] init];
		
		
		
		
		
		
		
		
		
		[self scheduleUpdate];
	}
	return self;
}

@end

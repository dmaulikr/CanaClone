//
//  GameControlLayer.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameControlLayer.h"
#import "Runner.h"
//#import "Building.h"

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
	[self addChild:sceneSpriteBatchNode z:100];
	
	runner = [[Runner alloc] initWithSpriteFrame:[[CCSpriteFrameCache
														   sharedSpriteFrameCache]
														  spriteFrameByName:@"runner_1.png"]];
	
	[runner setJumpButton:jumpButton];
	runner.anchorPoint = ccp(0.5f, 0.0);
	[runner setPosition:ccp(100, 200)];
	
	[sceneSpriteBatchNode addChild:runner];
	
}

- (void)initBuildings
{
	buildingsLayer = [BuildingsLayer node];
	[self addChild:buildingsLayer z:90];
	
}


-(void) update:(ccTime)deltaTime
{
	
	int currentHeight = [buildingsLayer updatePos:deltaTime];
	
	if (currentHeight > 300) { //since initial building will be set to over 30k
		currentHeight = 20;
	}

	
	[runner updateStateWithDeltaTime:deltaTime currentPlatHeight:currentHeight];


}

-(id)init {

    if (self = [super init]) {
        // enable touches
        self.isTouchEnabled = YES;
		
		[self initButtons];
		
		[self initRunner];
		
		[self initBuildings];

		[self scheduleUpdate];
	}
	return self;
}

@end

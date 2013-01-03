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

- (void)initRunner {

	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Runner_Atlas.plist"];
	CCSpriteBatchNode *sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"Runner_Atlas.png"];
	[self addChild:sceneSpriteBatchNode z:100];
	
	runner = [[Runner alloc] initWithSpriteFrame:[[CCSpriteFrameCache
														   sharedSpriteFrameCache]
														  spriteFrameByName:@"runner_1.png"]];
	
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

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	runner.isTouched = YES;
}

- (void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if(!runner.isTouched) return;
	runner.isTouched = NO;
}

-(id)init {

    if (self = [super init]) {
        // enable touches
        self.isTouchEnabled = YES;
				
		[self initRunner];
		
		[self initBuildings];

		[self scheduleUpdate];
	}
	return self;
}

@end

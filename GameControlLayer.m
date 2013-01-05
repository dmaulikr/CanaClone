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
	CCSpriteBatchNode *runnerBatch = [CCSpriteBatchNode batchNodeWithFile:@"Runner_Atlas.png"];
	[self addChild:runnerBatch z:10];
	
	runner = [[Runner alloc] initWithSpriteFrame:[[CCSpriteFrameCache
														   sharedSpriteFrameCache]
														  spriteFrameByName:@"runner_1.png"]];
	
	runner.anchorPoint = ccp(1.0f, 0.0);
	[runner setPosition:ccp(runnerXPos, 200)];
	
	[runnerBatch addChild:runner];
}

- (void)initPauseLayer
{
	pauseLayer = [PauseLayer node];
	[self addChild:pauseLayer z:200];

}

- (void)initBuildings
{
	buildingsLayer = [[BuildingsLayer alloc] initWithRunnerXPos:runnerXPos];
	[self addChild:buildingsLayer z:5];
}

- (void)initBG
{
	// BG Layer
	scrollingLayer = [GameBGLayer node];
	[self addChild:scrollingLayer z:1 tag:1];
}

- (void)initDeathScreen
{
	DeathLayer *deathLayer = [DeathLayer node];
	[self addChild:deathLayer z:20];
}

-(void) update:(ccTime)deltaTime
{
	//fall
	if (runner.position.y < -20) {
		[self removeChild:pauseLayer cleanup:YES];
		[self initDeathScreen];
	}
	
	//slowly increases speed
	int xVel = buildingsLayer.scrollSpeed;
	
	if (xVel < 150) acceleration.x = 11;
	else if (xVel < 375) acceleration.x = 7;
	else if	(xVel < 600) acceleration.x = 5;
	else if (xVel < 900) acceleration.x = 3;
	else acceleration.x = 1.5;
	
	buildingsLayer.scrollSpeed += acceleration.x * deltaTime;
	if (buildingsLayer.scrollSpeed > 1500) buildingsLayer.scrollSpeed = 1500;
	
	int currentHeight = [buildingsLayer updatePos:deltaTime];
	
	//walldeath
	if (currentHeight > runner.position.y) {
		buildingsLayer.scrollSpeed = 0;
		currentHeight = -100;
	}
	
	//if (buildingsLayer.scrollSpeed > 150)
		[scrollingLayer update:deltaTime withSpeed:buildingsLayer.scrollSpeed];

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
				
		runnerXPos = 200;
		
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"run.mp3"];
		
		
		[self initBG];
		[self initPauseLayer];
		[self initRunner];
		[self initBuildings];
		[self scheduleUpdate];
	}
	return self;
}

@end

//
//  GameControlLayer.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameControlLayer.h"
#import "Runner.h"

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
	
	
/*- (void)registerWithTouchDispatcher {
	[[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self
															priority:INT_MIN+1
													 swallowsTouches:YES];
}*/


/*- (void)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	[Runner changeState:kStateJumping];
}*/
	
-(void) update:(ccTime)deltaTime
{
	CCArray *listOfGameObjects = [sceneSpriteBatchNode children];
	
	for (GameObject *tempChar in listOfGameObjects) {
		[tempChar updateStateWithDeltaTime:deltaTime];
	}

}

-(id)init {

    if (self = [super init]) {
        CGSize screenSize = [CCDirector sharedDirector].winSize;  
        // enable touches
        self.isTouchEnabled = YES;
		
		[self initButtons];
		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Runner_Atlas.plist"];
        sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"Runner_Atlas.png"];
		[self addChild:sceneSpriteBatchNode z:0];
		
		Runner *runner = [[Runner alloc] initWithSpriteFrame:[[CCSpriteFrameCache
															   sharedSpriteFrameCache]
															  spriteFrameByName:@"runner_1.png"]];
		[runner setJumpButton:jumpButton];
		[runner setPosition:ccp(screenSize.width * 0.35f,
								screenSize.height * 0.14f)];
		
		[sceneSpriteBatchNode addChild:runner
									 z:100];
		[self scheduleUpdate];
	}
	return self;
}

@end

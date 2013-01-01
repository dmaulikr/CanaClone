//
//  Runner.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Runner.h"

@implementation Runner

@synthesize characterState;

@synthesize jumpButton;

@synthesize runningAnim;
@synthesize jumpingAnim;
@synthesize rollingAnim;
@synthesize fallingAnim;


-(void)checkAndClampSpritePosition
{
    if (self.characterState != kStateJumping) {
        if ([self position].y > 110.0f)
            [self setPosition:ccp([self position].x,110.0f)];
	}
}

#pragma mark -
-(void)changeState:(CharacterStates)newState
{
    [self stopAllActions];
    id action = nil;
    //id movementAction = nil;
    //CGPoint newPosition;
    [self setCharacterState:newState];
	
    switch (newState) {
        case kStateRunning:
			action = [CCAnimate actionWithAnimation:runningAnim];
			break;
		case kStateJumping:
			/*newPosition = ccp([super screenSize].width * 0.2f, 0.0f);

			movementAction = [CCJumpBy actionWithDuration:0.9f
												 position:newPosition
												   height:100.0f
													jumps:1];
			action = [CCSequence actions: [CCSpawn actions: [CCAnimate actionWithAnimation:jumpingAnim],
											 movementAction,
											 nil],
					  [CCAnimate actionWithAnimation:fallingAnim],
					  [CCAnimate actionWithAnimation:rollingAnim],nil];*/
			action = [CCAnimate actionWithAnimation:jumpingAnim];
			break;
		case kStateFalling:
			action = [CCAnimate actionWithAnimation:fallingAnim];
			break;
		case kStateRolling:
			action = [CCAnimate actionWithAnimation:rollingAnim];
			break;
	}
	
	if (action) {
		if (newState == kStateRunning)
			//[self runAction:[CCRepeatForever actionWithAction:action]];
			[self runAction:action];

		else
			[self runAction:action];
	}
	
}

#pragma mark -
-(void)updateStateWithDeltaTime:(ccTime)deltaTime
		   //andListOfGameObjects:(CCArray*)listOfGameObjects
{
	if ((self.characterState == kStateRunning) ||
		(self.characterState == kStateRolling)) {
		
		if (jumpButton.active) {
			[self changeState:kStateJumping];
			if (velocity.y == 0) velocity.y = 9.0f; //initial jump speed
			//CCLOG(@"start jump");
		}
	}


	if (velocity.y > 5 && jumpButton.active) { //if in process of jumping but below max speed
		velocity.y += 0.35f;
	}
	
	if (self.position.y > minPos) {  //if above platform level
		velocity.y += gravity; //apply gravity
		
		
		if ([self numberOfRunningActions] == 0) //fall action if no action running
			[self changeState:kStateFalling];
	}

	[self addYPosition:velocity.y];

	
	if (velocity.y < 0) {
		if ([self numberOfRunningActions] == 0)
			[self changeState:kStateFalling];
	}
	
	
	if (self.position.y < minPos) { //if below platform level
		
		[self setPosition:ccp(self.position.x, minPos)];
		
		if (velocity.y < -12) //if downward speed fast enough, roll animation
			[self changeState:kStateRolling];
		
		velocity.y = 0;
	}
	
	CCLOG(@"vel:%f", velocity.y);
	
	if ([self numberOfRunningActions] == 0) {
		if (self.position.y == minPos)
			[self changeState:kStateRunning];
	}

}

- (void)addYPosition:(CGFloat)yDelta
{
	//CGPoint *newPos = ccp(self.position.y + yPosition, self.position.x)];

	//CCMoveBy *moveAction = [CCMoveBy actionWithDuration:1.16f  position:ccp(0, yDelta)];
	//[self runAction:moveAction];
	[self setPosition:ccp(self.position.x, self.position.y + yDelta)];
}
	
- (void)initAnimations {
	[self setRunningAnim:[self loadPlistForAnimationWithName:@"runningAnim"
												andClassName:NSStringFromClass([self class])]];
	[self setJumpingAnim:[self loadPlistForAnimationWithName:@"jumpingAnim"
												andClassName:NSStringFromClass([self class])]];
	[self setFallingAnim:[self loadPlistForAnimationWithName:@"fallingAnim"
												andClassName:NSStringFromClass([self class])]];
    [self setRollingAnim:[self loadPlistForAnimationWithName:@"rollingAnim"
												andClassName:NSStringFromClass([self class])]];
}
	
- (id)initWithSpriteFrame:(CCSpriteFrame*)spriteFrame
{
	if (self = [super initWithSpriteFrame:(CCSpriteFrame *)spriteFrame])
	{
		gravity = -0.55f;
		maxVelocity.x = 1000;
		maxVelocity.y = 360;
		velocity = ccp(0,0);
		minPos = 20;
		
		jumpLimit = velocity.x / (maxVelocity.x * 2.5);
		if (jumpLimit > 0.35) jumpLimit = 0.35;

		
		
		
		
		jumpButton = nil;
		self.gameObjectType = kRunnerType;
		[self initAnimations];
		
		[self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:runningAnim]]];
	}
	return self;
}

	
@end

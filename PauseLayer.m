//
//  PauseLayer.m
//  CanaClone
//
//  Created by Josh Click on 1/4/13.
//
//

#import "PauseLayer.h"

@implementation PauseLayer

@synthesize pauseButton;

- (void)initPauseScreen
{
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
	//set to paused button
	[self removeChild:pauseButton cleanup:YES];
	pauseButton = [CCSprite spriteWithSpriteFrameName:@"pause-button.png"];
	pauseButton.anchorPoint = ccp(1.0f, 1.0f);
	pauseButton.position = ccp(screenSize.width-4, screenSize.height-4);
	[self addChild:pauseButton  z:10];
	
	CCLayerColor* colorLayer = [CCLayerColor layerWithColor:ccc4(176, 176, 191, 150)];
	[self addChild:colorLayer z:0];

	CCSprite *pausedSprite = [CCSprite spriteWithSpriteFrameName:@"paused.png"];
	pausedSprite.position = ccp(screenSize.width/2, screenSize.height/2);
	[self addChild:pausedSprite z:5];
}

- (void)clearPauseScreen
{
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
	[self removeAllChildrenWithCleanup:YES];
	pauseButton = [CCSprite spriteWithSpriteFrameName:@"pause.png"];
	pauseButton.anchorPoint = ccp(1.0f, 1.0f);
	pauseButton.position = ccp(screenSize.width-5, screenSize.height-5);
	
	[self addChild:pauseButton z:10];
}


-(BOOL) checkPause
{
	return isPaused;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
		
		if (CGRectContainsPoint(pauseButton.boundingBox, location)){
			if (isPaused) {
				isPaused = NO;
				[self clearPauseScreen];
				[[CCDirector sharedDirector] resume];
			}
			else {
				isPaused = YES;
				[[CCDirector sharedDirector] pause];
				[self initPauseScreen];
			}
		}
		
	}
}


- (id)init
{
	if (self = [super init]) {
		
		self.isTouchEnabled = YES;
		
		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlas.plist"];
		[self clearPauseScreen];
		
	}
	return self;
}

@end
//
//  DeathLayer.m
//  CanaClone
//
//  Created by Josh Click on 1/4/13.
//
//

#import "DeathLayer.h"

@implementation DeathLayer

- (void)initDeathScreen
{
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
	[[CCDirector sharedDirector] pause];
	
	CCLayerColor* colorLayer = [CCLayerColor layerWithColor:ccc4(176, 176, 191, 150)];
	[self addChild:colorLayer z:0];
	
	CCSprite *pausedSprite = [CCSprite spriteWithSpriteFrameName:@"gameover.png"];
	pausedSprite.position = ccp(screenSize.width/2, screenSize.height/2);
	[self addChild:pausedSprite z:5];
}


-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[[GameManager sharedGameManager] runSceneWithID:kMainMenuScene];
}

- (id)init
{
	if (self = [super init]) {
		
		self.isTouchEnabled = YES;

		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlas.plist"];
		[self initDeathScreen];

	}
	return self;
}

@end

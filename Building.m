//
//  Building.m
//  CanaClone
//
//  Created by Josh Click on 1/1/13.
//
//

#import "Building.h"

@implementation Building



- (void)createBuildings
{
	//CCNode *parent = [self getChildByTag:kTagParentNode];
	
	CCSprite *sprite = [CCSprite spriteWithTexture:spriteTexture_ rect:CGRectMake(0,0,128,128)];
	[parent addChild:sprite z:300];
	
	sprite.position = ccp( 200, 200);

	
	return;
	
}


-(void) updatePos:(ccTime)delta
{
    for (CCSprite* sprite in parent.children)
    {
		CGPoint pos=sprite.position;
		
		sprite.position = pos;
	}
}

- (id)init
{
	if (self = [super init]) {
		//buildings = [[NSMutableArray alloc] initWithCapacity:4];
		
		//[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Object_Atlsas.plist"];
		parent = [CCSpriteBatchNode batchNodeWithFile:@"giant_leg_bottom.png"];
		spriteTexture_ = [parent texture];
		[self addChild:parent];
		
		[self createBuildings];
		[self scheduleUpdate];
	}
	return self;
}

@end

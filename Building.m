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
	
	CCTexture2D *wallTex = [[CCTextureCache sharedTextureCache] addImage:@"wall1-left.png"];

	
	///CCTexture2D *texture = CCTextureCache::sharedTextureCache()->addImage("pic.png");

	ccTexParams *params = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
	[wallTex setTexParameters:params];
	
	//Then use spriteWithTexture instead of spriteWithFile like this:
	CCSprite *wall = [CCSprite spriteWithTexture:wallTex rect:CGRectMake(0, 0, 90, 90)];
	[self addChild:wall];
	//CCSprite *sprite = CCSprite::spriteWithTexture(texture, CCRectMake(0, 0, 90, 90));
	
	
	return;
	
}

-(void)updateStateWithDeltaTime:(ccTime)deltaTime
{
	return;
}


- (id)init
{
	if (self = [super init]) {
		buildings = [[NSMutableArray alloc] initWithCapacity:4];
		
		
		[self createBuildings];
	}
	return self;
}

@end

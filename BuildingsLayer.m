//
//  BuildingsLayer.m
//  CanaClone
//
//  Created by Josh Click on 1/2/13.
//
//

#import "BuildingsLayer.h"

@implementation BuildingsLayer

- (void)createFirstBuilding
{
	
	Building *firstBuilding = [Building node];

	[self addChild:firstBuilding];
	
}

- (int)createBuilding
{
	int pixelHeight = arc4random()%120 + 40; //random height between 50 and 150
	Building *building = [[Building alloc] initWithBUWidth:4 pixelHeight:pixelHeight];
	[building setZOrder:pixelHeight];
	[self addChild:building];
	return pixelHeight;
}


- (int)updatePos:(ccTime)delta
{
	int lastPlatHeight;
	
	for (CCLayer *building in self.children)
    {
		//CCLOG(@"%f",building.position.x);
		if ((building.position.x + 18*16) < -screenSize.width) { //if off the screen
			[self removeChild:building cleanup:YES];
			lastPlatHeight = [self createBuilding];
			continue;
		}
		else {
			building.position = ccp(building.position.x - 160*delta, building.position.y);
			lastPlatHeight = building.zOrder;
			//CCLOG(@"%f,%f",building.position.x, building.position.y);
		}
	}
	//[building updatePos:delta];
	return lastPlatHeight;
	
	//self.position = ccp(building.position.x -1 * delta, building.position.y);

}

- (int)BUWidthToPix:(int)BUWidth
{
	return ((BUWidth*4)+2)*16;
}

- (id)init
{
	if (self = [super init]) {
		
		screenSize = [[CCDirector sharedDirector] winSize];

		[self createFirstBuilding];
		
	}
	return self;
}

@end

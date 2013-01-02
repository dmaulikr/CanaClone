//
//  BuildingsLayer.m
//  CanaClone
//
//  Created by Josh Click on 1/2/13.
//
//

#import "BuildingsLayer.h"
#import "Building.h"

@implementation BuildingsLayer

- (void)createBuildings
{
	int gap = 50;
	int height = 150;
	int BUWidth = 4;
	
	Building *building = [Building node];
	
	[self addChild:building];
	
}

- (void)updatePos:(ccTime)delta
{
	for (CCLayer *building in self.children)
    {
		//CCLOG(@"%f",building.position.x);
		if ((building.position.x + 18*16) < -screenSize.width) { //if off the screen
			[self removeChild:building cleanup:YES];
			[self createBuildings];
			continue;
		}
		else
			building.position = ccp(building.position.x - 160*delta, building.position.y);
	}
	//[building updatePos:delta];
	
	
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

		[self createBuildings];
		
	}
	return self;
}

@end

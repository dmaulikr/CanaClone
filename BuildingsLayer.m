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

@synthesize scrollSpeed;


- (void)createFirstBuilding
{
	Building *firstBuilding = [[Building alloc] initWithScrollSpeed:scrollSpeed];

	firstBuilding.position = ccp(firstBuilding.position.x-600,firstBuilding.position.y);
	[self addChild:firstBuilding];
}

- (void)createBuilding
{	
	Building *building = [[Building alloc] initWithScrollSpeed:scrollSpeed];
	[self addChild:building];
}


- (int)updatePos:(ccTime)delta
{
	int lastPlatHeight = -100;
	gap = arc4random_uniform((int)scrollSpeed) * .5 + 40;
	
	
	int smallestGap = 1500;

	for (Building *building in self.children)
    {
		if ((building.position.x + building.buildingWidth) < -screenSize.width) { //if off the screen
			[self removeChild:building cleanup:YES];
			continue;
		} else {
			building.position = ccp(building.position.x - delta * scrollSpeed, building.position.y);

			if ( (building.position.x + screenSize.width) < refXPos &&
				(building.position.x + screenSize.width + building.buildingWidth) >  refXPos ) //if building is under the dude
					lastPlatHeight = building.platHeight;
		}
		
		if (-(building.position.x + building.buildingWidth) < smallestGap) { //sets smallest gap to smallest gap duh
			smallestGap = -(building.position.x + building.buildingWidth);
		}
		
	}
	
	if (smallestGap > gap)
		[self createBuilding];

	return lastPlatHeight-1;
}

- (id)initWithRunnerXPos:(int)runnerXPos
{
	if (self = [super init]) {
		
		screenSize = [[CCDirector sharedDirector] winSize];
		refXPos = runnerXPos;
		scrollSpeed = 150.0f;

		[self createFirstBuilding];
		
	}
	return self;
}

@end

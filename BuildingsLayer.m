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
	Building *firstBuilding = [Building node];
	firstBuilding.tag = 666;
	[self addChild:firstBuilding];
}

- (void)createBuilding
{
	int pixelHeight = arc4random()%100 + 50;
	int buildingUnitWidth = arc4random()%4 + 3 + (int)scrollSpeed/100;
	
	Building *building = [[Building alloc] initWithBUWidth:buildingUnitWidth pixelHeight:pixelHeight];
	[self addChild:building];
}


- (int)updatePos:(ccTime)delta
{
	int lastPlatHeight;
	gap = arc4random()%100 + scrollSpeed;
	
	for (Building *building in self.children)
    {
		if ((building.position.x + building.buildingWidth) < -screenSize.width) { //if off the screen
			//CCLOG(@"posx: %f, width: %i, screenw: %f",building.position.x, building.buildingWidth, screenSize.width);
			[self removeChild:building cleanup:YES];
			continue;
		} else {
			building.position = ccp(building.position.x - 2 * delta * scrollSpeed, building.position.y);

			if ( (building.position.x + screenSize.width) < runnerXPos && //100 is runner position
				(building.position.x + screenSize.width + building.buildingWidth) >  runnerXPos ) //if building is under the dude
					lastPlatHeight = building.platHeight;
		}
		
		if (building.tag == 666 ) {
			if (-building.position.x > gap) {
				[self createBuilding];
				building.tag = 555;
			}
			break;
		}
	}
	
	int smallestGap = 1500;
	for (Building *building in self.children) {
			if (-(building.position.x + building.buildingWidth) < smallestGap) { //sets smallest gap to smallest gap duh
				smallestGap = -(building.position.x + building.buildingWidth);
			}
	}
	if (smallestGap > gap)
		[self createBuilding];

	return lastPlatHeight-1;
}

- (id)init
{
	if (self = [super init]) {
		
		screenSize = [[CCDirector sharedDirector] winSize];
		runnerXPos = 100;
		scrollSpeed = 125.0f;

		[self createFirstBuilding];
		
	}
	return self;
}

@end

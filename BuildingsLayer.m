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

- (void)createFirstBuilding
{
	
	Building *firstBuilding = [Building node];
	firstBuilding.tag = 666;
	[self addChild:firstBuilding];
	
}

- (void)createBuilding
{
	int pixelHeight = arc4random()%120 + 40; //random height between 50 and 150
	int buildingUnitWidth = arc4random()%4 + 4;
	
	Building *building = [[Building alloc] initWithBUWidth:buildingUnitWidth pixelHeight:pixelHeight];
	[self addChild:building];
}


- (int)updatePos:(ccTime)delta
{
	int lastPlatHeight;
	int runnerXPos = 100;
	int gap = arc4random()%50 + 50;
	for (Building *building in self.children)
    {
		
		if ((building.position.x + building.buildingWidth) < -screenSize.width) { //if off the screen
			//CCLOG(@"posx: %f, width: %i, screenw: %f",building.position.x, building.buildingWidth, screenSize.width);
			[self removeChild:building cleanup:YES];
			continue;
		} else {
			building.position = ccp(building.position.x - 160*delta, building.position.y);

			
			if ( (building.position.x + screenSize.width) < runnerXPos && //100 is runner position
				(building.position.x + screenSize.width + building.buildingWidth) >  runnerXPos ) //if building is under the dude
			{
				lastPlatHeight = building.platHeight;
			}
		}
		if (building.tag == 666 ) {
			if (building.position.x < -gap) {
				[self createBuilding];
			}
			break;
		}
		
	}
	
	int smallestGap = 9999;
	for (Building *building in self.children) {
		//CCLOG(@"%f",(building.position.x + screenSize.width*2 + building.buildingWidth));
		//if (-building.position.x > building.buildingWidth + gap) { //if gap meets requierments
			if (-(building.position.x + building.buildingWidth) < smallestGap) { //sets smallest gap to smallest gap duh
				smallestGap = -(building.position.x + building.buildingWidth);
			}
		//}
	}
	if (smallestGap > gap  && smallestGap <1000)
		[self createBuilding];

	return lastPlatHeight;
	
}

- (int)BUWidthToPix:(int)BUWidth
{
	return ((BUWidth*4)+2)*16;
}

- (id)init
{
	if (self = [super init]) {
		
		screenSize = [[CCDirector sharedDirector] winSize];

		//[self createFirstBuilding]; commented out for simplicity's sake
		[self createBuilding];
		
	}
	return self;
}

@end

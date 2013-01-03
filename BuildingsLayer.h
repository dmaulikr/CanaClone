//
//  BuildingsLayer.h
//  CanaClone
//
//  Created by Josh Click on 1/2/13.
//
//

#import "CCLayer.h"
#import "Building.h"

@interface BuildingsLayer : CCLayer
{
	float scrollSpeed;
	
	//Building *building;
	CGSize screenSize;
	int runnerXPos;

}

- (int)updatePos:(ccTime)delta;

@end

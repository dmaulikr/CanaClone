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
	//Building *building;
	CGSize screenSize;
	int runnerXPos;
	float gap;

}

@property float scrollSpeed;

- (int)updatePos:(ccTime)delta;

@end

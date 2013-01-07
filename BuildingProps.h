//
//  BuildingProps.h
//  CanaClone
//
//  Created by Josh Click on 1/3/13.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface BuildingProps : CCLayer
{
	CCSpriteBatchNode *propBatch;
	CGSize screenSize;
	
	int areaWidth;
	int areaHeight;

}

- (id)initWithWidth:(int)width height:(int)height;

@end

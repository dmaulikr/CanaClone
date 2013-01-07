//
//  Building.h
//  CanaClone
//
//  Created by Josh Click on 1/1/13.
//
//

#import "cocos2d.h"
#import "BuildingProps.h"

@interface Building : CCLayer
{
	int tileSize;
	//float scrollSpeed;
	CCSpriteBatchNode *wallBatch;
	CGSize screenSize;
	
	int BUWidth;
	int pixelHeight;
	
}

@property int buildingWidth;
@property int platHeight;

- (id)initWithScrollSpeed:(float)scrollSpeed;

@end

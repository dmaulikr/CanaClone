//
//  Building.h
//  CanaClone
//
//  Created by Josh Click on 1/1/13.
//
//

#import "cocos2d.h"

@interface Building : CCLayer
{
	float gap;	
	int tileSize;
	//float scrollSpeed;
	CCSpriteBatchNode *wallBatch;
	CGSize screenSize;

}

@property int buildingWidth;
@property int platHeight;


- (id)initWithBUWidth:(int)BUWidth pixelHeight:(int)pixelHeight;

@end

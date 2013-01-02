//
//  Building.h
//  CanaClone
//
//  Created by Josh Click on 1/1/13.
//
//

#import "cocos2d.h"
#import "BuildingsLayer.h"

@interface Building : CCLayer
{
	float gap;
	
	int tileSize;
	//float scrollSpeed;
	CCSpriteBatchNode *wallBatch;
	CGSize screenSize;
}

- (id)initWithCorners:(CGPoint)corners height:(int)height;

@end

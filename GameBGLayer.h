//
//  GameBGLayer.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameBGLayer : CCLayer {
    CCSpriteBatchNode *objectSpriteBatchNode;
	CGSize screenSize;
	CGFloat bgWidth;
	
	NSMutableArray *speedFactors;
	float scrollSpeed;
	
	CCTMXTiledMap *tileMapNode;
    CCParallaxNode *parallaxNode;
}

@end

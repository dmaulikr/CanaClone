//
//  Building.h
//  CanaClone
//
//  Created by Josh Click on 1/1/13.
//
//

#import "cocos2d.h"

@interface Building : CCSprite
{
	float height;
	float width;
	float gap;
	
	CCSpriteBatchNode *parent;
	CCTexture2D *spriteTexture_;
}

- (void)updatePos:(ccTime)delta;

@end

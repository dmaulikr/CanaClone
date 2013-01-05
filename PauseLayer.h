//
//  PauseLayer.h
//  CanaClone
//
//  Created by Josh Click on 1/4/13.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface PauseLayer : CCLayer
{
	BOOL isPaused;
}

@property CCSprite *pauseButton;

@end

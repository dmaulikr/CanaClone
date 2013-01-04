//
//  PauseLayer.h
//  CanaClone
//
//  Created by Josh Click on 1/4/13.
//
//

#import "CCLayer.h"
#import "SneakyButton.h"

@interface PauseLayer : CCLayer
{
	BOOL isPaused;
}

@property CCSprite *pauseButton;

-(BOOL) checkPause;

@end

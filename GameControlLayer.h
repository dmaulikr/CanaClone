//
//  GameControlLayer.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "BuildingsLayer.h"
#import "GameBGLayer.h"
#import "Runner.h"
#import "PauseLayer.h"

#import "SimpleAudioEngine.h"

@interface GameControlLayer : CCLayer {
	CGPoint acceleration;

	Runner *runner;
	BuildingsLayer *buildingsLayer;
	GameBGLayer *scrollingLayer;
	
	BOOL isPaused;
	PauseLayer *pauseLayer;
	
}



@end

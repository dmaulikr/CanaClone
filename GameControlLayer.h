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
#import "DeathLayer.h"

#import "SimpleAudioEngine.h"

@interface GameControlLayer : CCLayer {
	CGPoint acceleration;
	int runnerXPos;

	Runner *runner;
	BuildingsLayer *buildingsLayer;
	GameBGLayer *scrollingLayer;
	PauseLayer *pauseLayer;

	
	BOOL isPaused;
	
}

@end

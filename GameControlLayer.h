//
//  GameControlLayer.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"

#import "Runner.h"

@interface GameControlLayer : CCLayer {
	Runner *runner;
	SneakyButton *jumpButton;
	
	CCSpriteBatchNode *buildingBatch;
}

@end

//
//  GameScene.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import "GameScene.h"

@implementation GameScene

- (id)init
{
	if (self = [super init]) {
		//gameLayer = [GameLayer node];
		//[self addChild:gameLayer];
		
		// Initialize the Control Layer
        controlLayer = [GameControlLayer node];
        [self addChild:controlLayer z:2 tag:2];
		
		// Gameplay Layer
        GameBGLayer *scrollingLayer = [GameBGLayer node];
       [self addChild:scrollingLayer z:1 tag:1];
	}
	return self;
}

@end

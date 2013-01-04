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
		// Initialize the Control Layer
        controlLayer = [GameControlLayer node];
        [self addChild:controlLayer z:2 tag:2];
		

	}
	return self;
}

@end

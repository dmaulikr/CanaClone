//
//  MainMenuScene.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import "MainMenuScene.h"

@implementation MainMenuScene

- (id)init
{
	if (self = [super init]) {
		mainMenuLayer = [MainMenuLayer node];
		[self addChild:mainMenuLayer];
	}
	return self;
}

@end

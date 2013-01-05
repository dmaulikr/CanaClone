//
//  Runner.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import <UIKit/UIKit.h>


@interface Runner : CCSprite {
	
	float gravity;
	CGPoint velocity;
	CGPoint acceleration;
	CGPoint maxVelocity;
	CGFloat minPos;
	
	CharacterStates characterState;
	
	CCAnimation *runningAnim;
	CCAnimation *jumpingAnim;
	CCAnimation *rollingAnim;
	CCAnimation *fallingAnim;
	
}

- (void)addYPosition:(CGFloat)yDelta;
- (void)updateStateWithDeltaTime:(ccTime)deltaTime currentPlatHeight:(int)platHeight;

@property BOOL isTouched;

@end

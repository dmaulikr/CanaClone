//
//  Runner.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"
#import "cocos2d.h"
#import "Constants.h"
#import "SneakyButton.h"

@interface Runner : GameObject {
	//from canabalt
	CGFloat jump;
	CGFloat jumpLimit;
	BOOL stumble;
	CGFloat my;
	CGFloat ft;
	CGFloat fc;
	NSArray *feet;
	NSArray *feetC;
	BOOL craneFeet;
	NSString *epitaph;
	BOOL pause;

	
	float gravity;
	CGPoint velocity;
	CGPoint maxVelocity;
	CGFloat minPos;
	
}

//from canabalt
@property CGFloat jumpLimit;
@property BOOL stumble;
@property BOOL craneFeet;
@property (copy) NSString * epitaph;
@property BOOL pause;

-(void)checkAndClampSpritePosition;
- (void)addYPosition:(CGFloat)yDelta;
@property (readwrite) CharacterStates characterState;


@property (nonatomic, retain) CCAnimation *runningAnim;
@property (nonatomic, retain) CCAnimation *jumpingAnim;
@property (nonatomic, retain) CCAnimation *rollingAnim;
@property (nonatomic, retain) CCAnimation *fallingAnim;

@property (nonatomic,assign) SneakyButton *jumpButton;

@end

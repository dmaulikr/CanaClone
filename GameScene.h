//
//  GameScene.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import "CCScene.h"
#import "cocos2d.h"
#import "GameBGLayer.h"
#import "GameControlLayer.h"

@interface GameScene : CCScene
{
	GameControlLayer *controlLayer;
}

@end

//
//  GameManager.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface GameManager : NSObject
{
	SceneTypes currentScene;
}



@property (readwrite) BOOL isMusicON;
@property (readwrite) BOOL isSoundEffectsON;
@property (readwrite) BOOL hasPlayerDied;

+ (GameManager *)sharedGameManager;
- (void)runSceneWithID:(SceneTypes)sceneID;

@end

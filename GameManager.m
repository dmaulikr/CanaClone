//
//  GameManager.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import "GameManager.h"
//#import "GameScene.h"
#import "MainMenuScene.h"
#import "GameScene.h"

@implementation GameManager

static GameManager* _sharedGameManager = nil;

@synthesize isMusicON;
@synthesize isSoundEffectsON;
@synthesize hasPlayerDied;

+ (GameManager *)sharedGameManager {
    @synchronized([GameManager class])
    {
        if(!_sharedGameManager)
            [[self alloc] init];
        return _sharedGameManager;
		return nil;
	}
}

+ (id)alloc {
    @synchronized ([GameManager class]) {
		NSAssert(_sharedGameManager == nil,
		@"Attempted to allocate a second instance of the Game Manager singleton");
		_sharedGameManager = [super alloc];
		return _sharedGameManager;
	}
	return nil;
}

 - (id)init {
	 if (self = [super init]) {
		 
		 CCLOG(@"Game Manager Singleton, init");
		 isMusicON = YES;
		 isSoundEffectsON = YES;
		 hasPlayerDied = NO;
		 currentScene = kNoSceneUninitialized;
	 }
	 return self;
 }

- (void)runSceneWithID:(SceneTypes)sceneID
{
	SceneTypes oldScene = currentScene;
    currentScene = sceneID;
    id sceneToRun = nil;
	
    switch (sceneID) {
        case kMainMenuScene:
			sceneToRun = [MainMenuScene node];
			break;
		case kGameScene:
			sceneToRun = [GameScene node];
			break;
		default:
			CCLOG(@"Unknown ID, can't switch scenes");
			return;
			break;
	}
	
	if (!sceneToRun) {
		currentScene = oldScene;
		return;
	}
	
	if (![[CCDirector sharedDirector] runningScene]) {
		[[CCDirector sharedDirector] runWithScene:sceneToRun];
	} else {
		[[CCDirector sharedDirector] replaceScene:sceneToRun];
	}
	
	
	
}


@end

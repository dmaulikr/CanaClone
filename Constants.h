//
//  Constants.h
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#define CanaClone_Constants_h

#define kMainMenuTagValue 10
#define kSceneMenuTagValue 20

typedef enum {
    kNoSceneUninitialized=0,
    kMainMenuScene=1,
    kAboutScene=2,
    kGameScene=4,
    kLevelCompleteScene=5,
    kCutSceneForLevel2=201
} SceneTypes;

typedef enum {
    kStateRunning,
    kStateJumping,
    kStateFalling,
    kStateRolling,
} CharacterStates;
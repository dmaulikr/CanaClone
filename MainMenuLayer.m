//
//  MainMenuLayer.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import "MainMenuLayer.h"

@implementation MainMenuLayer

- (void)showAbout
{
	CCLOG(@"Show About Page");
	[[GameManager sharedGameManager] runSceneWithID:kAboutScene];
}

- (void)playGame
{
	CCLOG(@"Playing Game Now");
	[[GameManager sharedGameManager] runSceneWithID:kGameScene];
}

- (void)displayMainMenu
{
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
	//setup sprite atlas
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"menu_atlas.plist"];
	CCSpriteBatchNode *menuSprites = [CCSpriteBatchNode batchNodeWithFile:@"menu_atlas.png"];
	
	//create bg sprite
	CCSprite *bgSprite = [CCSprite spriteWithFile:@"title.png"];
	[self addChild:bgSprite];
	bgSprite.position = ccp(screenSize.width/2, screenSize.height/2);

	[self addChild:menuSprites];
	
	//button sprite
	CCSprite *menuButtonSprite = [CCSprite spriteWithSpriteFrameName:@"button.png"];
	CCSprite *aboutButtonSprite = [CCSprite spriteWithSpriteFrameName:@"button.png"];
	
	CCLabelTTF *playGameLabel = [CCLabelTTF labelWithString:@"CANACLONE"
												   fontName:@"Nokia Cellphone FC"
												   fontSize:60];
	playGameLabel.position = ccp(screenSize.width/2, screenSize.height/2+20);
	[self addChild:playGameLabel];
	
	//create menu 
	CCMenuItemSprite *playGameButton = [CCMenuItemSprite itemWithNormalSprite:menuButtonSprite
															   selectedSprite:nil
																	   target:self
																	 selector:@selector(playGame)];

	CCMenuItemSprite *aboutButton = [CCMenuItemSprite itemWithNormalSprite:aboutButtonSprite
															selectedSprite:nil
																	target:self
																  selector:@selector(showAbout)];
	
	mainMenu = [CCMenu menuWithItems:aboutButton, playGameButton, nil];
	[mainMenu alignItemsHorizontallyWithPadding:30];
	mainMenu.position = ccp(screenSize.width/2, 40);
	
	[self addChild:mainMenu z:0 tag:kMainMenuTagValue];
	
}

-(id)init {
    if (self = [super init]) {
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"run-title.mp3"];

        [self displayMainMenu];
	}
    return self;
}

@end

//
//  MainMenuLayer.m
//  CanaClone
//
//  Created by Josh Click on 12/31/12.
//
//

#import "MainMenuLayer.h"

@interface MainMenuLayer()
- (void)displayMainMenu;
@end

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
	CCSprite *bgSprite = [CCSprite spriteWithSpriteFrameName:@"title.png"];
	[menuSprites addChild:bgSprite];
	bgSprite.position = ccp(screenSize.height/2, screenSize.width/2);

	[self addChild:menuSprites];
	
	
	//button sprite
	CCSprite *menuButtonSprite = [CCSprite spriteWithSpriteFrameName:@"button.png"];
	CCSprite *aboutButtonSprite = [CCSprite spriteWithSpriteFrameName:@"button.png"];

	
	CCLabelTTF *playGameLabel = [CCLabelTTF labelWithString:@"PLAY"
												   fontName:@"Nokia Cellphone FC"
												   fontSize:28];
	playGameLabel.position = ccp(screenSize.height/2, screenSize.width/2);
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
	[mainMenu alignItemsHorizontallyWithPadding:screenSize.height * 0.059f];
	mainMenu.position = ccp(screenSize.height/2, screenSize.width - 20);
	
	[self addChild:mainMenu z:0 tag:kMainMenuTagValue];

	
}

-(id)init {
    if (self = [super init]) {
        //CGSize screenSize = [CCDirector sharedDirector].winSize;
		
				
        [self displayMainMenu];
        
	}
    return self;
}

@end

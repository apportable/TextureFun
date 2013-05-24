//
//  HelloWorldLayer.m
//  TextureFun
//
//  Created by Tony Dahbura on 3/15/13.
//  Copyright Tony Dahbura 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    if( (self=[super init] )) {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCSpriteBatchNode *backgroundBgNode;
        backgroundBgNode = [CCSpriteBatchNode batchNodeWithFile:@"background.pvr.ccz"];
        [self addChild:backgroundBgNode];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"background.plist"];
        CCSprite *background = [CCSprite spriteWithSpriteFrameName:@"MuleDeer-ipadhd.png"];
        background.anchorPoint = ccp(0,0);
        [backgroundBgNode addChild:background];
        
        // More coming here soon...
        CCSpriteBatchNode *spritesBgNode;
        spritesBgNode = [CCSpriteBatchNode batchNodeWithFile:@"sprites.pvr.ccz"];
        [self addChild:spritesBgNode];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];
        
        NSArray *images = [NSArray arrayWithObjects:@"bird.png", @"cat.png", @"dog.png", @"turtle.png", nil];
        for(int i = 0; i < images.count; ++i) {
            NSString *image = [images objectAtIndex:i];
            float offsetFraction = ((float)(i+1))/(images.count+1);
            CGPoint spriteOffset = ccp(winSize.width*offsetFraction, winSize.height/2);
            CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:image];
            sprite.position = spriteOffset;
            [spritesBgNode addChild:sprite];
        }
        
        
    }
    return self;
}



@end

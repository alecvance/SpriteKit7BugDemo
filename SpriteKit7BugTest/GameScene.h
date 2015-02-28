//
//  GameScene.h
//  SpriteKit7BugTest
//

//  Copyright (c) 2015 Juggleware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Squadron;

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property int phase;
@property NSTimeInterval phaseStartTime;
@property CFTimeInterval lastUpdateTimeInterval;
@property Squadron *squadron;
@end

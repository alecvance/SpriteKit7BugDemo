//
//  GameScene.m
//  SpriteKit7BugTest
//
//  Created by Alec Vance on 2/25/15.
//  Copyright (c) 2015 Juggleware LLC. All rights reserved.
//

#import "GameScene.h"
#import "Squadron.h"
#import "Fighter.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    _phase = 0;
 
    [self createSceneContents];
    
}
- (void)createSceneContents {
    // NSLog(@"Building the world");
    
    
    // Configure physics for the world.
    self.physicsWorld.gravity = CGVectorMake(0, 0); // no gravity
    self.physicsWorld.contactDelegate = self;
    
    [self addSquadron];
    
}


-(void)addSquadron{
    Squadron *squad = [[Squadron alloc] initAtPosition:CGPointMake(500,600)];
    
    [self addChild: squad];
    
    //SKAction *action = [SKAction rotateByAngle:-M_PI duration:1];
    
    SKAction *action = [SKAction sequence: @[[SKAction moveToX:300 duration:2.0],[SKAction moveToX:700 duration:2.0]]];
    [squad runAction:[SKAction repeatActionForever:action]];

    self.phaseStartTime = [[NSDate date] timeIntervalSinceReferenceDate];
    
    self.squadron = squad;

}

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 
    CGPoint location = CGPointMake(400,400);
    
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    sprite.xScale = 0.5;
    sprite.yScale = 0.5;
    sprite.position = location;
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    
    [sprite runAction:[SKAction repeatActionForever:action]];
    
    [self addChild:sprite];
}
*/

#define kMinTimeInterval (1.0f / 60.0f)

#pragma mark - Loop Update
- (void)update:(NSTimeInterval)currentTime {
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = kMinTimeInterval;
        self.lastUpdateTimeInterval = currentTime;
        // self.worldMovedForUpdate = YES;
    }
    
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
    
}

#pragma mark - Loop Update
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    for( SKNode* node in self.children ) {
        if( [node.name isEqualToString:@"fighter"] ) {
            Fighter* fighter = (Fighter*)node;
            if( fighter.queueToAddBack ) [fighter rejoinSquadron];
        }
    }
    
    //moving to timer
    if([[NSDate date] timeIntervalSinceReferenceDate] - self.phaseStartTime > 4){
        self.phase ++;
        
        self.phaseStartTime = [[NSDate date] timeIntervalSinceReferenceDate];
        
        [self.squadron nextFighterAttacks];
    }
    
//    for (Fighter *ship in self.children) {
//        [ship updateWithTimeSinceLastUpdate:timeSinceLast];
//    }
    
}
@end

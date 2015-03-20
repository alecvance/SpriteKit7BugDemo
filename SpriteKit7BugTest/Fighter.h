//
//  Fighter.h
//  SpriteKit7BugTest
//
//  Created by Alec Vance on 2/26/15.
//  Copyright (c) 2015 Juggleware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@class Squadron;

typedef enum : uint32_t {
    ColliderTypePlayer           = 1,
    ColliderTypeEnemy            = 2,
    ColliderTypeProjectile       = 4,
    ColliderTypeEnemyProjectile  = 8,
    ColliderTypeEnemyShield      = 16,
    ColliderTypeAsteroid         = 32,
    ColliderTypeWall             = 64,
    ColliderTypePowerup          = 128
} ColliderType;


@interface Fighter : SKSpriteNode

@property CGPoint originalPosition;
@property (weak) Squadron *squadron;
@property BOOL queueToAddBack; 

-(id)initAtPosition:(CGPoint)position;
-(void)configurePhysicsBody;

-(void)rejoinSquadron;
@end

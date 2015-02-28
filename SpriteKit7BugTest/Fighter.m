//
//  Fighter.m
//  SpriteKit7BugTest
//
//  Created by Alec Vance on 2/26/15.
//  Copyright (c) 2015 Juggleware LLC. All rights reserved.
//

#import "Fighter.h"
#import "Squadron.h"

@implementation Fighter

-(id)initAtPosition:(CGPoint)position{
    self = [super initWithImageNamed:@"Spaceship"];
    
    if(self){
        self.position = position;
        self.xScale = 0.125;
        self.yScale = 0.125;
        self.zRotation = M_PI;
        
        self.originalPosition = position;
        
        [self configurePhysicsBody];

    }
    
    return self;
    
}

-(void)configurePhysicsBody{
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius: 33];
    
    self.physicsBody.allowsRotation = NO;
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = YES;
    
    
    // Our object type for collisions.
    self.physicsBody.categoryBitMask = ColliderTypeEnemy;
    
    // Collides with these objects.
    self.physicsBody.collisionBitMask = ColliderTypePlayer;
    
    // We want notifications for colliding with these objects.
    self.physicsBody.contactTestBitMask = ColliderTypeProjectile;
    
    self.physicsBody.mass = 1;
    //self.physicsBody.usesPreciseCollisionDetection = YES;
    
    // self.physicsBody.dynamic = NO; // turn off forces

}



-(void)rejoinSquadron{
    [self removeFromParent];
    [self.squadron addChild: self];
    self.position = self.originalPosition;
}

@end

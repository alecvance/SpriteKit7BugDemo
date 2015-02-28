//
//  Squadron.m
//  SpriteKit7BugTest
//
//  Created by Alec Vance on 2/25/15.
//  Copyright (c) 2015 Juggleware LLC. All rights reserved.
//

#import "Squadron.h"
#import "Fighter.h"

@implementation Squadron

-(id)initAtPosition:(CGPoint)position{
    self = [super init];
    
    if(self){
        self.position = position;
        
       [self addFighters];

    }
    
    return self;

}

-(CGPoint)positionInSceneForNode:(SKNode *)node{
    return [node.scene convertPoint:node.position fromNode:node.parent];
}

-(void)addFighters{
    for (int row=0; row<3; row++) {
        for (int col=0; col<5; col++) {
            CGPoint location = CGPointMake((col-2)*70, (row-2)*70);
            
            Fighter *fighter = [[Fighter alloc] initAtPosition: location];
            
            SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
            
            [fighter runAction:[SKAction repeatActionForever:action]];
            
            [self addChild:fighter];
            
            fighter.squadron = self; // weak ref
            
        }
    }

}

#pragma mark - Loop Update
- (void)nextFighterAttacks {
        Fighter *ship = [self.children objectAtIndex:0];
    
    CGPoint newPos = [self positionInSceneForNode: ship];
    
        [ship removeFromParent];
        [self.scene addChild:ship];
        ship.position = newPos;
    
    [ship runAction: [SKAction sequence:@[[SKAction moveToY:40.0 duration:10.0],
                                          [SKAction runBlock:^(void){
        [ship rejoinSquadron];
    }]]]];
  }


@end

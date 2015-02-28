//
//  Squadron.h
//  SpriteKit7BugTest
//
//  Created by Alec Vance on 2/25/15.
//  Copyright (c) 2015 Juggleware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Squadron : SKNode

-(id)initAtPosition:(CGPoint)position;
- (void)nextFighterAttacks;

@end

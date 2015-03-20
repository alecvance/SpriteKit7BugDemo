# SpriteKit7BugDemo
Demonstrates an issue with Sprite Kit on iOS 7, and illustrates a possible workaround.

IMPORTANT: The current source code has the workaround. You will need to revert to the original version to see the bug in action. Run this project in iOS 7.1, in either the simulator or a device. The problem does not exist in iOS 8.


I made the smallest project I could to demonstrate the problem. Here’s how it works, when you run the app (there is no interactivity):

1) the fighters belong to an invisible SKNode called a squadron.
2) the squadron has an SKAction to repeatedly move it left and right
3) the fighters are each rotating through their own SKActions.
4) every 10 seconds a new fighter will break from the squadron, which removes it from that node and adds it to the main scene node.
5) the fighter moves to the bottom of the screen.
6) the fighter is then added back to its place in the squadron, by removing it from the scene and then adding it to the squadron.

If you run this in 8.1 it will work as it should. Fighters will leave the squadron one by one, move to the bottom of the screen, then pop back to their spot as they should. 

However if you run this in 7.1, the physics bodies will disappear when the fighters are added back to the squadron the first time. The second time the fighters leave the squadron they disappear altogether (the position translation seems to be incorrect).

The fix is to set a "queue" flag for removing and adding the sprite to/from its parent/container SKNode, and waiting until the main update loop to execute [squadron removeFromParent] and subsequently [scene addChild:figher], and vice-versa.



NOTE: (SKView *).showsPhysics is set in order to show the physics bodies (SKPhysicsBody) of the sprites.

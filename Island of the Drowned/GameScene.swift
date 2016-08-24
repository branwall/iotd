//
//  GameScene.swift
//  Island of the Drowned
//
//  Created by Brandon Wallace on 8/12/16.
//  Copyright (c) 2016 Made On Planes. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let Header = SKLabelNode(fontNamed:"Times New Roman")
        Header.text = "Island of the Drowned!"
        Header.fontSize = 45
        Header.position = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame)+(CGRectGetMidY(self.frame)/3)*2))
        
        let menuOption1 = SKLabelNode(fontNamed:"Arial")
        menuOption1.text = "Menu Option 1"
        menuOption1.fontSize = 35
        menuOption1.position = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame)+(CGRectGetMidY(self.frame)/3)))
        
        let menuOption2 = SKLabelNode(fontNamed:"Arial")
        menuOption2.text = "Menu Option 2"
        menuOption2.fontSize = 35
        menuOption2.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        let menuOption3 = SKLabelNode(fontNamed:"Calibre")
        menuOption3.text = "Menu Option 3"
        menuOption3.fontSize = 35
        menuOption3.position = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame)-(CGRectGetMidY(self.frame)/3)))
        
        self.addChild(Header)
        self.addChild(menuOption1)
        self.addChild(menuOption2)
        self.addChild(menuOption3)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

//
//  GameScene2.swift
//  Island of the Drowned
//
//  Created by Brandon Wallace on 8/24/16.
//  Copyright © 2016 Made On Planes. All rights reserved.
//

import SpriteKit
var b1: SKSpriteNode? = nil
var b2: SKSpriteNode? = nil
class GameScene2: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = "You're in scene 2!"
        myLabel.fontSize = 15
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(myLabel)
        b1 = makeButtonOne()
        self.addChild(b1!)
        b2 = makeButtonTwo()
        self.addChild(b2!)
        
    }
    
    func makeButtonOne()->SKSpriteNode {
        let tenth: CGFloat = self.frame.size.width/10
        let btn = SKSpriteNode(color: UIColor.blueColor(), size: CGSize(width: tenth, height: tenth))
        btn.position = CGPoint(x: CGRectGetMinX(self.frame) + self.size.width/2 , y: CGRectGetMinY(self.frame) + self.size.height/2)
        return btn
    }
    func makeButtonTwo()->SKSpriteNode {
        let tenth: CGFloat = self.frame.size.width/10
        let btn = SKSpriteNode(color: UIColor.greenColor(), size: CGSize(width: tenth, height: tenth))
        btn.position = CGPoint(x: CGRectGetMaxX(self.frame) - self.size.width/2 , y: CGRectGetMinY(self.frame) + self.size.height/2)
        return btn
    }
    
    func popupText(str: String){
        let lbl2 = SKLabelNode(text: str)
        lbl2.fontSize = 20
        lbl2.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 25)
        self.addChild(lbl2)
        let a = SKAction.resizeToHeight(30, duration: 1)
        lbl2.runAction(a) { 
            lbl2.removeFromParent()
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            if (b1!.containsPoint(location)){
               popupText("pressed 1")
            }
            if (b2!.containsPoint(location)){
                popupText("pressed 2")
            }
           
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

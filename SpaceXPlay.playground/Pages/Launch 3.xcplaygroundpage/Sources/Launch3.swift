//
//  Launch3.swift
//  Rocket
//
//  Created by Bianca Itiroko on 20/03/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import SpriteKit
import GameplayKit

public class Launch3: SKScene {
    
    private var upRocket : SKSpriteNode?
    private var downRocket : SKSpriteNode?
    private var background : SKSpriteNode?
    private var text1:SKLabelNode?
    private var text2:SKLabelNode?
    private var textStart:SKLabelNode?
    
    public override func didMove(to view: SKView) {
        
        self.downRocket = self.childNode(withName: "downRocket") as? SKSpriteNode
        self.upRocket = self.downRocket?.childNode(withName: "upRocket") as? SKSpriteNode
        self.background = self.childNode(withName: "background") as? SKSpriteNode
        self.text1 = self.childNode(withName: "text") as? SKLabelNode
        self.text2 = self.childNode(withName: "text2") as? SKLabelNode
        self.textStart = self.childNode(withName: "start") as? SKLabelNode
        
        if let text1 = self.text1, let text2 = self.text2{
            text1.isHidden = true
            text2.isHidden = true
        }
    }
    
    public func touchDown(atPoint pos : CGPoint) {
        if let textStart = self.textStart{
            textStart.isHidden = true
        }
        
        let moveup = SKAction.moveTo(y: 500, duration: 4.0)
        
        let moveMore = SKAction.moveBy(x: 0, y: 50, duration: 1.0)
        let moveBack = SKAction.moveBy(x: 0, y: -55, duration: 0.5)
        
        let explode = SKAction.run {
            let explosion = SKEmitterNode(fileNamed: "Explosion")!
            self.upRocket?.addChild(explosion)
        }
        
        let wait = SKAction.wait(forDuration: 0.5)
        
        let remove = SKAction.run {
            
            self.upRocket?.removeFromParent()
            self.downRocket?.removeFromParent()
        }
        
        let textAppear = SKAction.run{
            self.text1!.isHidden = false
            self.text2!.isHidden = false
        }
        
        self.downRocket?.run(moveup, completion: {
            let sequence = SKAction.sequence([moveMore, moveBack, explode, wait, remove, textAppear])
            self.upRocket?.run(sequence)
        })
        
        let backgroundDown = SKAction.moveTo(y: -200, duration: 4.0)
        
        self.background?.run(backgroundDown)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}




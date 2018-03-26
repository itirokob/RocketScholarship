//
//  Launch4.swift
//  Rocket
//
//  Created by Bianca Itiroko on 20/03/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import SpriteKit
import GameplayKit

public class Launch4: SKScene {
    
    private var rocket : SKSpriteNode?
    private var background : SKSpriteNode?
    private var background2 : SKSpriteNode?
    private var text1:SKLabelNode?
    private var text2:SKLabelNode?
    private var textStart:SKLabelNode?
    private var stars:SKEmitterNode?
    private var arrow:SKSpriteNode?
    private var earth:SKSpriteNode?
    
    public override func didMove(to view: SKView) {
        
        self.rocket = self.childNode(withName: "rocket") as? SKSpriteNode
        self.background = self.childNode(withName: "background") as? SKSpriteNode
        self.background2 = self.childNode(withName: "background2") as? SKSpriteNode
        self.text1 = self.childNode(withName: "text") as? SKLabelNode
        self.text2 = self.childNode(withName: "text2") as? SKLabelNode
        self.textStart = self.childNode(withName: "start") as? SKLabelNode
        self.stars = self.childNode(withName: "stars") as? SKEmitterNode
        self.arrow = self.childNode(withName: "arrow") as? SKSpriteNode
        self.earth = self.childNode(withName: "earth") as? SKSpriteNode
        
        if let text1 = self.text1, let text2 = self.text2, let background2 = self.background2, let stars = self.stars, let arrow = self.arrow, let earth = self.earth{
            text1.isHidden = true
            text2.isHidden = true
            background2.isHidden = true
            earth.isHidden = true
            stars.isHidden = true
            arrow.isHidden = true
        }
    }
    
    public func touchDown(atPoint pos : CGPoint) {
        if let textStart = self.textStart{
            textStart.isHidden = true
        }
        
        let moveup = SKAction.moveTo(y: 800, duration: 4.0)
        
        let moveMiddle = SKAction.moveTo(y: 500, duration: 4.0)
        
        let remove = SKAction.run {
            self.rocket?.removeFromParent()
        }
        
        let textAppear = SKAction.run{
            self.text1!.isHidden = false
            self.text2!.isHidden = false
            self.arrow?.isHidden = false
        }
        
        let animation = SKAction.sequence([moveup])
        
        self.rocket?.run(animation, completion: {
            self.background2?.isHidden = false
            self.stars?.isHidden = false
            self.earth?.isHidden = false
            self.rocket?.position = CGPoint(x: 400, y: 0)
            self.rocket?.run(SKAction.sequence([moveMiddle, textAppear]))
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




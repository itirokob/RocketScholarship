//
//  GameScene.swift
//  Rocket
//
//  Created by Bianca Itiroko on 20/03/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import SpriteKit
import GameplayKit

public class GameScene: SKScene {
    
    private var rocket : SKSpriteNode?
    private var background : SKSpriteNode?
    private var text1:SKLabelNode?
    private var text2:SKLabelNode?
    private var textStart:SKLabelNode?
    private var arrow:SKSpriteNode?
    
    public override func didMove(to view: SKView) {
        self.rocket = self.childNode(withName: "rocket") as? SKSpriteNode
        self.background = self.childNode(withName: "background") as? SKSpriteNode
        self.text1 = self.childNode(withName: "text") as? SKLabelNode
        self.text2 = self.childNode(withName: "text2") as? SKLabelNode
        self.textStart = self.childNode(withName: "start") as? SKLabelNode
        self.arrow = self.childNode(withName: "arrow") as? SKSpriteNode

        if let text1 = self.text1, let text2 = self.text2,  let arrow = self.arrow{
            text1.isHidden = true
            text2.isHidden = true
            arrow.isHidden = true

        }
    }
    
    public func touchDown(atPoint pos : CGPoint) {
        if let textStart = self.textStart{
            textStart.isHidden = true
        }
        
        let moveup = SKAction.moveTo(y: 500, duration: 4.0)
        
        let textures = [SKTexture(imageNamed: "rocket"), SKTexture(imageNamed: "oxidized2"), SKTexture(imageNamed: "oxidized")]
        let oxidize = SKAction.animate(with: textures, timePerFrame: 1.0)
        //        let oxidize = SKAction.colorize(with: .gray, colorBlendFactor: 1.0, duration: 4.0)
        
        let moveAndOxidize = SKAction.group([moveup, oxidize])
        
        let explode = SKAction.run {
            let explosion = SKEmitterNode(fileNamed: "Explosion")!
            explosion.position = (self.rocket?.position)!
            self.addChild(explosion)
        }
        
        let wait = SKAction.wait(forDuration: 0.1)
        
        let remove = SKAction.run {
            self.rocket?.removeFromParent()
        }
        
        let textAppear = SKAction.run{
            self.text1!.isHidden = false
            self.text2!.isHidden = false
            self.arrow?.isHidden = false
        }
        
        let animation = SKAction.sequence([moveAndOxidize, explode,wait, remove,textAppear])
        
        self.rocket?.run(animation)

        
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

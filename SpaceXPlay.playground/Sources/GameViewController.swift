//
//  GameViewController.swift
//  Rocket
//
//  Created by Bianca Itiroko on 20/03/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

public class GameViewController: UIViewController {

    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 500, height: 500))
        self.view = SKView(frame: frame)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    
        print("handleTap")
        
        if let skView = self.view as! SKView? {
            
            let scene = skView.scene
            

            
        }
    
    }

    public override var shouldAutorotate: Bool {
        return true
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    public override var prefersStatusBarHidden: Bool {
        return true
    }
}

import Foundation
import UIKit
import SpriteKit

public class Crash2: UIViewController{
    
    override public func viewDidLoad() {
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 700, height: 700))
        self.view = SKView(frame: frame)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Crash2") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
}

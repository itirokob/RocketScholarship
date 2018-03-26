import Foundation
import UIKit
import SpriteKit

public class Final: UIViewController{
    
    override public func viewDidLoad() {
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 700, height: 700))
        self.view = SKView(frame: frame)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Final") {
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

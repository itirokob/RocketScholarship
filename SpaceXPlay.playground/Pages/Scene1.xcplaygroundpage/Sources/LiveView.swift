import PlaygroundSupport
import SpriteKit


public func launch()
{
    // Load the SKScene from 'GameScene.sks'
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 800))
    
    if let scene = GameScene(fileNamed: "GameScene") {
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFit
        
        // Present the scene
        sceneView.presentScene(scene)
    }
    
    sceneView.ignoresSiblingOrder = true
    
    PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
}

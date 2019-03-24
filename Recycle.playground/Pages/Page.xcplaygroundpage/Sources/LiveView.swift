import PlaygroundSupport
import SpriteKit

var audioPlayer = AudioPlayer()


public func loadLiveView()
{
    audioPlayer.play()
    // Load the SKScene from 'GameScene.sks'
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 600, height: 600))
    
    if let scene = GameScene0(fileNamed: "GameScene0"){
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFit
        
        // Present the scene
        sceneView.presentScene(scene)
    }
    
    sceneView.ignoresSiblingOrder = false
    
    PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
}

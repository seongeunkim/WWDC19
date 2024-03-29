import SpriteKit

class GameScene3: SKScene {
    
    func touchDown(atPoint pos : CGPoint) {
        
        let touchNode = self.atPoint(pos)
        
        if touchNode.name == "next" {
            
            if let scene = GameScene4(fileNamed: "GameScene4"){
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                self.view?.presentScene(scene)
            }
        } else if touchNode.name == "previous" {
            
            if let scene = GameScene1(fileNamed: "GameScene1"){
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                self.view?.presentScene(scene)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
}

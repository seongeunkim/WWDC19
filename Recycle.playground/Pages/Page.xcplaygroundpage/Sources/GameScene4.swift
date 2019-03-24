import SpriteKit

class GameScene4: SKScene {
    
    override func didMove(to view: SKView) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        let touchNode = self.atPoint(pos)
        
        if touchNode.name == "previous" {
            
            if let scene = GameScene3(fileNamed: "GameScene3"){
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                self.view?.presentScene(scene)
            }
        } else if touchNode.name == "next" {
            
            if let scene = GameScene(fileNamed: "GameScene"){
                
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

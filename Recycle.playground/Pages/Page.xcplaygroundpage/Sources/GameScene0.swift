import SpriteKit

class GameScene0: SKScene {
    
    private var nextButton : SKNode?

    override func didMove(to view: SKView) {
        self.nextButton = self.childNode(withName: "next")
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        let touchNode = self.atPoint(pos)
        
        if touchNode.name == "next" {
        
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


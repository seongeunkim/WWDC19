import SpriteKit
import GameplayKit

class RecycleAppleDevices: SKScene {

    private var nextButton: SKNode?
    private var firstMessage: SKLabelNode?
    private var secondMessage: SKLabelNode?
    private var balloon: SKNode?

    private var currentMessage = 0
    
    override func didMove(to view: SKView) {
        showMessages()
    }

    private func showMessages() {
        firstMessage = childNode(withName: "firstMessage") as? SKLabelNode
        secondMessage = childNode(withName: "secondMessage") as? SKLabelNode
        nextButton = childNode(withName: "next")
        balloon = childNode(withName: "balloon")

        if let nextButton = nextButton {
            nextButton.alpha = 1
        }

        let wait0 = SKAction.wait(forDuration: 0.5)
        let wait1 = SKAction.wait(forDuration: 5.5)
        let wait2 = SKAction.wait(forDuration: 6.5)
        let wait3 = SKAction.wait(forDuration: 9.5)
        let appear = SKAction.fadeAlpha(to: 1, duration: 0.3)
        let slowAppear = SKAction.fadeAlpha(to: 1, duration: 0.6)
        let fade = SKAction.fadeAlpha(to: 0, duration: 0.3)

        let firstTextSequence = SKAction.sequence([wait0, appear])
//            let secondTextSequence = SKAction.sequence([wait2, appear, wait1])
//            let nextSequence = SKAction.sequence([wait3, appear])
//            let balloonSequence = SKAction.sequence([slowAppear])

//            balloon.run(balloonSequence)
        firstMessage?.run(firstTextSequence)
//            secondMessage.run(secondTextSequence)
//            nextButton.run(nextSequence)
    }

    func touchDown(atPoint pos: CGPoint) {

        let touchNode = self.atPoint(pos)

        if touchNode.name == "next" {
            if currentMessage == 0 {
                currentMessage += 1
                let wait0 = SKAction.wait(forDuration: 0.5)
                let wait1 = SKAction.wait(forDuration: 5.5)
                let appear = SKAction.fadeAlpha(to: 1, duration: 0.3)
                let fade = SKAction.fadeAlpha(to: 0, duration: 0.3)
                firstMessage?.run(SKAction.sequence([fade]))
                secondMessage?.run(SKAction.sequence([wait0, appear, wait1]))
            } else {

                if let scene = GameScene2(fileNamed: "GameScene2") {

                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFit

                    // Present the scene
                    self.view?.presentScene(scene)
                }
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.map {
            self.touchDown(atPoint: $0.location(in: self))
        }
    }
}

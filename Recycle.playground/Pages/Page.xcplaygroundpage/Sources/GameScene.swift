import SpriteKit

class GameScene: SKScene {
    
    private var plasticBin : SKNode?
    private var metalBin : SKNode?
    private var paperBin : SKNode?
    private var glassBin : SKNode?
    private var nonRecyclableBin : SKNode?
    
    private var plasticBag : SKNode?
    private var plasticBottle : SKNode?
    private var metal : SKNode?
    private var paper : SKNode?
    private var glassBottle : SKNode?
    private var napkin : SKNode?
    private var iphone: SKNode?
    
    private var background : SKNode?
    
    private var currentObject : SKNode?
    
    private var objectsLeft = 7
    
    private var gameFinished : SKNode?
    
    private var text1: SKLabelNode?
    private var text2: SKLabelNode?
    private var text3: SKLabelNode?
    private var iPhoneText1: SKLabelNode?
    private var iPhoneText2: SKLabelNode?
    
    private var tip: SKLabelNode?
    private var tipsBalloon : SKNode?
    
    private var guideBalloon : SKNode?
    private var hasShownIPhoneScene: Bool = false
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.plasticBin = self.childNode(withName: "plasticBin")
        self.metalBin = self.childNode(withName: "metalBin")
        self.paperBin = self.childNode(withName: "paperBin")
        self.glassBin = self.childNode(withName: "glassBin")
        self.nonRecyclableBin = self.childNode(withName: "nonRecyclableBin")
        
        self.metal = self.childNode(withName: "metal")
        self.plasticBag = self.childNode(withName: "chipsBag")
        self.paper = self.childNode(withName: "paper")
        self.plasticBottle = self.childNode(withName: "plasticBottle")
        self.glassBottle = self.childNode(withName: "glassBottle")
        self.napkin = self.childNode(withName: "napkin")
        
        self.gameFinished = self.childNode(withName: "gameFinished")
        
        self.tip = self.childNode(withName: "tip") as? SKLabelNode
        self.tipsBalloon = self.childNode(withName: "tipsBalloon")
        
        self.guideBalloon = self.childNode(withName: "guideBalloon")

        self.text1 = self.childNode(withName: "text1") as? SKLabelNode
        self.text2 = self.childNode(withName: "text2") as? SKLabelNode
        self.text3 = self.childNode(withName: "text3") as? SKLabelNode
        
        let wait0 = SKAction.wait(forDuration: 0.8)
        let wait1 = SKAction.wait(forDuration: 3.1)
        let fade = SKAction.fadeAlpha(to: 0, duration: 0.3)
        let wait2 = SKAction.wait(forDuration: 4.4)
        let appear = SKAction.fadeAlpha(to: 1, duration: 0.3)
        let wait3 = SKAction.wait(forDuration: 7.7)
        let waitBalloon = SKAction.wait(forDuration: 11)
        
        let firstTextSequence = SKAction.sequence([wait0, appear, wait1, fade])
        let secondTextSequence = SKAction.sequence([wait2, appear, wait1, fade])
        let thirdTextSequence = SKAction.sequence([wait3, appear, wait1, fade])
        let balloonSequence = SKAction.sequence([waitBalloon, fade])
        
        self.guideBalloon?.run(balloonSequence)
        self.text1?.run(firstTextSequence)
        self.text2?.run(secondTextSequence)
        self.text3?.run(thirdTextSequence)
        
    }

    private func showIPhoneScene() {
        hasShownIPhoneScene = true

        self.iPhoneText1 = self.childNode(withName: "iPhoneText1") as? SKLabelNode
        self.iPhoneText2 = self.childNode(withName: "iPhoneText2") as? SKLabelNode
        self.iphone = self.childNode(withName: "iphone")

        let appearBalloon = SKAction.fadeAlpha(to: 0.8, duration: 0.3)
        let wait0 = SKAction.wait(forDuration: 0.8)
        let wait1 = SKAction.wait(forDuration: 3.2)
        let fade = SKAction.fadeAlpha(to: 0, duration: 0.3)
        let wait2 = SKAction.wait(forDuration: 4.6)
        let appear = SKAction.fadeAlpha(to: 1, duration: 0.3)
        let wait3 = SKAction.wait(forDuration: 8.2)

        let firstTextSequence = SKAction.sequence([wait0, appear, wait1, fade])
        let secondTextSequence = SKAction.sequence([wait2, appear, wait1, fade])
        let balloonSequence = SKAction.sequence([appearBalloon, wait3, fade])
        let iPhoneSequence = SKAction.sequence([wait0, appear])

        self.guideBalloon?.run(balloonSequence)
        self.iPhoneText1?.run(firstTextSequence)
        self.iPhoneText2?.run(secondTextSequence)
        self.iphone?.run(iPhoneSequence)
    }

    func touchDown(atPoint pos : CGPoint) {
        if(self.atPoint(pos).name == "metal" || self.atPoint(pos).name == "plasticBottle" || self.atPoint(pos).name == "chipsBag" || self.atPoint(pos).name == "paper" || self.atPoint(pos).name == "glassBottle" || self.atPoint(pos).name == "napkin" || self.atPoint(pos).name == "ok" || self.atPoint(pos).name == "iphone") {
            self.currentObject = self.atPoint(pos)
        }
        
        if self.currentObject?.name == "ok" {
            
            if let scene = RecycleAppleDevices(fileNamed: "RecycleAppleDevices") {
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                self.view?.presentScene(scene)
            }
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if(self.atPoint(pos).name == "metal" || self.atPoint(pos).name == "plasticBottle" || self.atPoint(pos).name == "chipsBag" || self.atPoint(pos).name == "paper" || self.atPoint(pos).name == "glassBottle" || self.atPoint(pos).name == "napkin" ||
            self.atPoint(pos).name == "iphone") {
            self.currentObject?.position = pos
        }
    }
    
    func checkIfThrownInRightBin(trash: SKNode, bin: SKNode) -> Bool {
        if (trash.position.x >= bin.position.x - bin.frame.width/2 && trash.position.x <= bin.position.x + bin.frame.width/2 && trash.position.y >= bin.position.y - bin.frame.height/2 && trash.position.y <= bin.position.y + bin.frame.height/2) {
            return true
        } else {
            let appearBalloon = SKAction.fadeAlpha(to: 0.8, duration: 0.3)
            let appearText = SKAction.fadeAlpha(to: 1, duration: 0.3)
            let wait = SKAction.wait(forDuration: 1.8)
            let fade = SKAction.fadeAlpha(to: 0, duration: 0.3)
            let sequenceText = SKAction.sequence([appearText, wait, fade])
            let sequenceBalloon = SKAction.sequence([appearBalloon, wait, fade])
            
            if(self.currentObject?.name == "metal") {
                self.tip?.text = "Uh oh! Cans are made of metal."
            } else if(self.currentObject?.name == "plasticBottle") {
                self.tip?.text = "Uh oh! That bottle is made of plastic."
            } else if(self.currentObject?.name == "chipsBag") {
                self.tip?.text = "Uh oh! That bag is made of plastic."
            } else if(self.currentObject?.name == "paper") {
                self.tip?.text = "Uh oh! That is paper."
            } else if(self.currentObject?.name == "glassBottle") {
                self.tip?.text = "Uh oh! That bottle is made of glass."
            } else if(self.currentObject?.name == "napkin") {
                self.tip?.text = "That napkin is dirty!"
            }
            self.tip?.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
            self.tipsBalloon?.run(sequenceBalloon)
            self.tip?.run(sequenceText)
            return false
        }
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        let touchNode = self.atPoint(pos)
        
        if touchNode.name == "metal" {
            if(checkIfThrownInRightBin(trash: self.metal!, bin: self.metalBin!) == true) {
                self.objectsLeft -= 1
                self.metal?.removeFromParent()
            }
        } else if touchNode.name == "chipsBag" {
            if(checkIfThrownInRightBin(trash: self.plasticBag!, bin: self.plasticBin!) == true) {
                self.objectsLeft -= 1
                self.plasticBag?.removeFromParent()
            }
        } else if touchNode.name == "plasticBottle" {
            if(checkIfThrownInRightBin(trash: self.plasticBottle!, bin: self.plasticBin!) == true) {
                self.objectsLeft -= 1
                self.plasticBottle?.removeFromParent()
            }
        } else if touchNode.name == "napkin" {
            if(checkIfThrownInRightBin(trash: self.napkin!, bin: self.nonRecyclableBin!) == true) {
                self.objectsLeft -= 1
                self.napkin?.removeFromParent()
            }
        } else if touchNode.name == "paper" {
            if(checkIfThrownInRightBin(trash: self.paper!, bin: self.paperBin!) == true) {
                self.objectsLeft -= 1
                self.paper?.removeFromParent()
            }
        } else if touchNode.name == "glassBottle" {
            if(checkIfThrownInRightBin(trash: self.glassBottle!, bin: self.glassBin!) == true) {
                self.objectsLeft -= 1
                self.glassBottle?.removeFromParent()
            }
        } else if touchNode.name == "iphone" || hasShownIPhoneScene == true {
            objectsLeft -= 1
            if let scene = RecycleAppleDevices(fileNamed: "RecycleAppleDevices") {

                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit

                // Present the scene
                self.view?.presentScene(scene)
            }
        }
        
        if objectsLeft == 1 {
            showIPhoneScene()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}


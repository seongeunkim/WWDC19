//
//  GameScene.swift
//  Recycle
//
//  Created by Seong Eun Kim on 23/03/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import SpriteKit

class GameScene2: SKScene {
    
    private var metalPipe : SKNode?
    private var plasticPipe : SKNode?
    private var glassPipe : SKNode?
    private var paperPipe : SKNode?
    
    private var book : SKNode?
    private var bike : SKNode?
    private var cup : SKNode?
    private var truck : SKNode?

    private var text1: SKLabelNode?
    private var text2: SKLabelNode?
    private var text3: SKLabelNode?
    private var theEnd: SKLabelNode?
    private var gameFinished : SKNode?
    
    private var background : SKNode?
    
    override func didMove(to view: SKView) {
        initialize()
        animateText()
    }

    private func animateText() {
        self.text1 = self.childNode(withName: "text1") as? SKLabelNode
        self.text2 = self.childNode(withName: "text2") as? SKLabelNode
        self.text3 = self.childNode(withName: "text3") as? SKLabelNode
        self.gameFinished = self.childNode(withName: "gameFinished")
        self.theEnd = self.childNode(withName: "theEnd") as? SKLabelNode

        let wait0 = SKAction.wait(forDuration: 0.8)
        let wait1 = SKAction.wait(forDuration: 3.3)
        let fade = SKAction.fadeAlpha(to: 0, duration: 0.3)
        let wait2 = SKAction.wait(forDuration: 4.7)
        let appear = SKAction.fadeAlpha(to: 1, duration: 0.3)
        let wait3 = SKAction.wait(forDuration: 8.4)
        let thirdMessagePeriod = SKAction.wait(forDuration: 3)
        let waitBalloon = SKAction.wait(forDuration: 11.8)

        let firstTextSequence = SKAction.sequence([wait0, appear, wait1, fade])
        let secondTextSequence = SKAction.sequence([wait2, appear, wait1, fade])
        let thirdTextSequence = SKAction.sequence([wait3, appear, thirdMessagePeriod, fade])
        let balloonSequence = SKAction.sequence([waitBalloon, fade])

        self.text1?.run(firstTextSequence)
        self.text2?.run(secondTextSequence)
        self.text3?.run(thirdTextSequence)
        self.gameFinished?.run(balloonSequence)
        self.theEnd?.run(SKAction.sequence([waitBalloon, appear]))
    }
    
    public func initialize() {
        self.metalPipe = self.childNode(withName: "metalPipe")
        self.plasticPipe = self.childNode(withName: "plasticPipe")
        self.glassPipe = self.childNode(withName: "glassPipe")
        self.paperPipe = self.childNode(withName: "paperPipe")
        
        self.background = self.childNode(withName: "background")
        
        self.book = self.childNode(withName: "book")
        self.bike = self.childNode(withName: "bike")
        self.cup = self.childNode(withName: "cup")
        self.truck = self.childNode(withName: "truck")
        
        
        let bikeWait = SKAction.wait(forDuration: 1.3)
        let bookWait = SKAction.wait(forDuration: 1.8)
        let move = SKAction.moveBy(x: 0, y: -175, duration: 1)
        let truckWait = SKAction.wait(forDuration: 2.2)
        let cupWait = SKAction.wait(forDuration: 2.7)
        
        let lineProductionWait = SKAction.wait(forDuration: 4.8)
        let moveRight = SKAction.moveBy(x: 600, y: 0, duration: 4)
        
        
        let bikeMoveSequence = SKAction.sequence([bikeWait, move])
        let bookMoveSequence = SKAction.sequence([bookWait, move])
        let truckMoveSequence = SKAction.sequence([truckWait, move])
        let cupMoveSequence = SKAction.sequence([cupWait, move])
        
        let lineProductionSequence = SKAction.sequence([lineProductionWait, moveRight])
        
        
        self.bike?.run(bikeMoveSequence)
        self.book?.run(bookMoveSequence)
        self.truck?.run(truckMoveSequence)
        self.cup?.run(cupMoveSequence)
        
        self.bike?.run(lineProductionSequence)
        self.book?.run(lineProductionSequence)
        self.truck?.run(lineProductionSequence)
        self.cup?.run(lineProductionSequence)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        
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
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


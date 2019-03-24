//
//  GameScene.swift
//  Recycle
//
//  Created by Seong Eun Kim on 23/03/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene2: SKScene {
    
    private var metalPipe : SKNode?
    private var plasticPipe : SKNode?
    private var glassPipe : SKNode?
    private var paperPipe : SKNode?
    
    private var book : SKNode?
    private var bike : SKNode?
    private var cup : SKNode?
    private var truck : SKNode?

    
    private var background : SKNode?
    
    override func didMove(to view: SKView) {
        initialize()
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


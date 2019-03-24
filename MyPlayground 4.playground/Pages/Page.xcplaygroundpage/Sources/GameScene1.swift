//
//  GameScene1.swift
//  Recycle
//
//  Created by Seong Eun Kim on 28/03/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene1: SKScene {
    
    private var nextButton : SKNode?
    private var previousButton : SKNode?
    
    
    override func didMove(to view: SKView) {
        self.nextButton = self.childNode(withName: "next")
        self.previousButton = self.childNode(withName: "previous")
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        let touchNode = self.atPoint(pos)
        
        if touchNode.name == "next" {
            
            if let scene = GameScene3(fileNamed: "GameScene3"){
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                self.view?.presentScene(scene)
            }
            
        } else if touchNode.name == "previous" {
            
            if let scene = GameScene0(fileNamed: "GameScene0"){
                
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

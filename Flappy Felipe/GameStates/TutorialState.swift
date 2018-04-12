//
//  TutorialState.swift
//  Flappy Felipe
//
//  Created by Banana Viking on 12/20/17.
//  Copyright © 2017 Banana Viking. All rights reserved.
//

import GameplayKit
import SpriteKit

class TutorialState: GKState {
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        setupTutorial()
        
    }
    
    override func willExit(to nextState: GKState) {
        // remove tutorial sprites
        scene.worldNode.enumerateChildNodes(withName: "Tutorial", using: { node, stop in
            node.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.5),
                SKAction.removeFromParent()
                ]))
        })
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is PlayingState.Type
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
    }
    
    func setupTutorial() {
        scene.setupBackground()
        scene.setupForeground()
        scene.setupPlayer()
        scene.setupScoreLabel()
        
        let tutorial = SKSpriteNode(imageNamed: "Tutorial")
        tutorial.position = CGPoint(x: scene.size.width * 0.5, y: scene.playableHeight * 0.4 + scene.playableStart)
        tutorial.name = "Tutorial"
        tutorial.zPosition = Layer.ui.rawValue
        scene.worldNode.addChild(tutorial)
        
        let ready = SKSpriteNode(imageNamed: "Ready")
        ready.position = CGPoint(x: scene.size.width * 0.5, y: scene.playableHeight * 0.7 + scene.playableStart)
        ready.name = "Tutorial"
        ready.zPosition = Layer.ui.rawValue
        scene.worldNode.addChild(ready)
    }
}























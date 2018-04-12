//
//  PlayingState.swift
//  Flappy Felipe
//
//  Created by Banana Viking on 12/20/17.
//  Copyright © 2017 Banana Viking. All rights reserved.
//

import GameplayKit
import SpriteKit

class PlayingState: GKState {
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        scene.startSpawning()
        scene.player.movementAllowed = true
        scene.player.animationComponent.startAnimation()
        scene.player.animationComponent.stopWobble()
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return (stateClass == FallingState.self) || (stateClass == GameOverState.self)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        scene.updateForeground()
        scene.updateScore()
    }
}


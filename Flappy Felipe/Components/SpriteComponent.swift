//
//  SpriteComponent.swift
//  Flappy Felipe
//
//  Created by Banana Viking on 12/19/17.
//  Copyright © 2017 Banana Viking. All rights reserved.
//

import GameplayKit
import SpriteKit

class EntityNode: SKSpriteNode {
    
}

class SpriteComponent: GKComponent {
    let node: EntityNode
    
    init(entity: GKEntity, texture: SKTexture, size: CGSize) {
        node = EntityNode(texture: texture, color: SKColor.white, size: size)
        node.entity = entity
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

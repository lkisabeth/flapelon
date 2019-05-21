//
//  GameScene.swift
//  FlapElon
//
//  Created by Lucas Kisabeth on 5/20/19.
//  Copyright © 2019 Lucas Kisabeth. All rights reserved.
//

import SpriteKit
import GameplayKit

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

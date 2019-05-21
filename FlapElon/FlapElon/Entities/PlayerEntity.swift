//
//  GameScene.swift
//  FlapElon
//
//  Created by Lucas Kisabeth on 5/20/19.
//  Copyright © 2019 Lucas Kisabeth. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayerEntity: GKEntity {
  var spriteComponent: SpriteComponent!
  var movementComponent: MovementComponent!
  var animationComponent: AnimationComponent!

  var movementAllowed = false
  var numberOfFrames = 3

  init (imageName: String) {
    super.init()

    let texture = SKTexture(imageNamed: imageName)
    spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
    addComponent(spriteComponent)

    movementComponent = MovementComponent(entity: self)
    addComponent(movementComponent)

    var textures: Array<SKTexture> = []
    for i in 0..<numberOfFrames {
      textures.append(SKTexture(imageNamed: "PixelElon-\(i+1)"))
    }

    for i in stride(from: numberOfFrames, through: 0, by: -1) {
      textures.append(SKTexture(imageNamed: "PixelElon-\(i+1)"))
    }

    animationComponent = AnimationComponent(entity: self, textures: textures)
    addComponent(animationComponent)

    movementComponent.applyInitialImpulse()

    // Add Physics
    let spriteNode = spriteComponent.node
    spriteNode.physicsBody = SKPhysicsBody(texture: spriteNode.texture!, size: spriteNode.frame.size)
    spriteNode.physicsBody?.categoryBitMask = PhysicsCategory.Player
    spriteNode.physicsBody?.collisionBitMask = 0
    spriteNode.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle | PhysicsCategory.Ground
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

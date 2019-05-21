//
//  GameScene.swift
//  FlapElon
//
//  Created by Lucas Kisabeth on 5/20/19.
//  Copyright © 2019 Lucas Kisabeth. All rights reserved.
//

import SpriteKit
import GameplayKit

class MovementComponent: GKComponent {
  let spriteComponent: SpriteComponent

  let flapAction = SKAction.playSoundFileNamed("flapping.wav", waitForCompletion: false)

  let impulse: CGFloat = 400
  var velocity = CGPoint.zero
  let gravity: CGFloat = -1500

  var velocityModifier: CGFloat = 1000.0
  var angularVelocity: CGFloat = 0.0
  let minDegrees: CGFloat = -90
  let maxDegrees: CGFloat = 25

  var lastTouchTime: TimeInterval = 0
  var lasyTouchY: CGFloat = 0.0

  var playableStart: CGFloat = 0

  init(entity: GKEntity) {
    self.spriteComponent = entity.component(ofType: SpriteComponent.self)!
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func applyInitialImpulse() {
    velocity = CGPoint(x: 0, y: impulse * 2)
  }

  func applyImpulse(_ lastUpdateTime: TimeInterval) {
    spriteComponent.node.run(flapAction)

    velocity = CGPoint(x: 0, y: impulse)

    angularVelocity = velocityModifier.degreesToRadians()
    lastTouchTime = lastUpdateTime
    lasyTouchY = spriteComponent.node.position.y
  }

  func applyMovement(_ seconds: TimeInterval) {
    let spriteNode = spriteComponent.node

    // Apply Gravity
    let gravityStep = CGPoint(x: 0, y: gravity) * CGFloat(seconds)
    velocity += gravityStep

    // Apply Velocity
    let velocityStep = velocity * CGFloat(seconds)
    spriteNode.position += velocityStep

    if spriteNode.position.y < lasyTouchY {
      angularVelocity = -velocityModifier.degreesToRadians()
    }

    // Rotation
    let angularStep = angularVelocity * CGFloat(seconds)
    spriteNode.zRotation += angularStep
    spriteNode.zRotation = min(max(spriteNode.zRotation, minDegrees.degreesToRadians()), maxDegrees.degreesToRadians())

    // Temporary Ground Hit
    if spriteNode.position.y - spriteNode.size.height / 2 < playableStart {
      spriteNode.position = CGPoint(x: spriteNode.position.x, y: playableStart + spriteNode.size.height / 2)
    }
  }

  override func update(deltaTime seconds: TimeInterval) {
    if let player = entity as? PlayerEntity {
      if player.movementAllowed {
        applyMovement(seconds)
      }
    }
  }
}

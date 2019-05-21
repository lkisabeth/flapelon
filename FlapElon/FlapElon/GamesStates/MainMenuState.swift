//
//  GameScene.swift
//  FlapElon
//
//  Created by Lucas Kisabeth on 5/20/19.
//  Copyright © 2019 Lucas Kisabeth. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuState: GKState {
  unowned let scene: GameScene

  init(scene: SKScene) {
    self.scene = scene as! GameScene
    super.init()
  }

  override func didEnter(from previousState: GKState?) {
    scene.setupBackground()
    scene.setupForeground()
    scene.setupPlayer()
    setupMainMenu()

    scene.player.movementAllowed = false
  }

  override func willExit(to nextState: GKState) {

  }

  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    return stateClass is TutorialState.Type
  }

  override func update(deltaTime seconds: TimeInterval) {

  }

  func setupMainMenu() {
    // Logo
    let logo = SKSpriteNode(imageNamed: "Logo")
    logo.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.8)
    logo.zPosition = Layer.ui.rawValue
    scene.worldNode.addChild(logo)
    
    // Background Music
    SKTAudio.sharedInstance().playBackgroundMusic("backgroundMusic.wav")

    // Play Button
    let playButton = SKSpriteNode(imageNamed: "Button")
    playButton.position = CGPoint(x: scene.size.width * 0.25, y: scene.size.height * 0.25)
    playButton.zPosition = Layer.ui.rawValue
    scene.worldNode.addChild(playButton)

    let playButtonText = SKSpriteNode(imageNamed: "Play")
    playButtonText.position = CGPoint.zero
    playButton.addChild(playButtonText)

    // Rate Button
    let rateButton = SKSpriteNode(imageNamed: "Button")
    rateButton.position = CGPoint(x: scene.size.width * 0.75, y: scene.size.height * 0.25)
    rateButton.zPosition = Layer.ui.rawValue
    scene.worldNode.addChild(rateButton)

    let rateButtonText = SKSpriteNode(imageNamed: "Rate")
    rateButtonText.position = CGPoint.zero
    rateButton.addChild(rateButtonText)
  }
}

//
//  GameScene.swift
//  FlapElon
//
//  Created by Lucas Kisabeth on 5/20/19.
//  Copyright © 2019 Lucas Kisabeth. All rights reserved.
//

import SpriteKit

public func SKColorWithRGB(_ r: Int, g: Int, b: Int) -> SKColor {
  return SKColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
}

public func SKColorWithRGBA(_ r: Int, g: Int, b: Int, a: Int) -> SKColor {
  return SKColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
}

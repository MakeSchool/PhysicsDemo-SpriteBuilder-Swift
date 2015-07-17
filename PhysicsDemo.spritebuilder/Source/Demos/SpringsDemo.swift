//
//  SpringsDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class SpringsDemo: PhysicsDemo {
  
  weak var node1: CCNodeColor!
  weak var node2: CCNodeColor!
  weak var node3: CCNodeColor!
  var demoPhysicsNode: CCPhysicsNode!
  
  override func onEnter() {
    super.onEnter()
    demoPhysicsNode = node1.physicsNode()
    demoPhysicsNode.paused = true
    demoPhysicsNode.debugDraw = true
  }
  
  override func startDemo() {
    demoPhysicsNode.paused = false
  }
}

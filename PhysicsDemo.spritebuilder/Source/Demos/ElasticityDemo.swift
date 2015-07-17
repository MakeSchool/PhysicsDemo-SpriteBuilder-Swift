//
//  ElasticityDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class ElasticityDemo: PhysicsDemo {
  weak var node1: CCNodeColor!
  weak var node2: CCNodeColor!
  weak var node3: CCNodeColor!
  
  override func startDemo() {
    // all have same impulse
    // node1 and node1Static both have elasticity of 0.0 (all energy lost)
    node1.physicsBody.applyImpulse(CGPoint(x: 100, y: 0))
    
    // node2 and node2Static both have elasticity of 0.5 (some energy lost)
    node2.physicsBody.applyImpulse(CGPoint(x: 100, y: 0))
    
    // node3 and node3Static both have elasticity of 1.0 (no energy lost)
    node3.physicsBody.applyImpulse(CGPoint(x: 100, y: 0))
  }
}

//
//  SurfaceVelocityDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class SurfaceVelocityDemo: PhysicsDemo {
  weak var ground1: CCNodeColor!
  weak var ground2: CCNodeColor!
  weak var ground3: CCNodeColor!
  
  weak var node1: CCNodeColor!
  weak var node1VelocityLabel: CCLabelBMFont!
  var velocity1: CGFloat = 0.0 {
    didSet {
      let velocityString = String(format: "%.0f", velocity1)
      node1VelocityLabel.setString("Velocity: \(velocityString)")
    }
  }
  
  weak var node2: CCNodeColor!
  weak var node2VelocityLabel: CCLabelBMFont!
  var velocity2: CGFloat = 0.0 {
    didSet {
      let velocityString = String(format: "%.0f", velocity2)
      node2VelocityLabel.setString("Velocity: \(velocityString)")
    }
  }
  
  weak var node3: CCNodeColor!
  weak var node3VelocityLabel: CCLabelBMFont!
  var velocity3: CGFloat = 0.0 {
    didSet {
      let velocityString = String(format: "%.0f", velocity3)
      node3VelocityLabel.setString("Velocity: \(velocityString)")
    }
  }
  
  var started = false
  
  override func startDemo() {
    started = true
    
    // hack needed to get surfaceVelocity recognized since collision starts
    // before surfaceVelocity applied (should be fine without in postSolve)
    node1.physicsBody.affectedByGravity = true
    node2.physicsBody.affectedByGravity = true
    node3.physicsBody.affectedByGravity = true
    
    // shows effect of friction on surface velocity
    // node1 and ground1 both have friction of 0.0 (no movement)
    ground1.physicsBody.surfaceVelocity = CGPoint(x: 50, y: 0)
    
    // node2 and ground2 both have friction of 0.3 (gradually reaches velocity)
    ground2.physicsBody.surfaceVelocity = CGPoint(x: 50, y: 0)
    
    // node3 and ground3 both have friction of 1.0 (quickly reaches velocity)
    ground3.physicsBody.surfaceVelocity = CGPoint(x: 50, y: 0)
  }
  
  override func update(delta: CCTime) {
    if started {
      velocity1 = node1.physicsBody.velocity.x
      velocity2 = node2.physicsBody.velocity.x
      velocity3 = node3.physicsBody.velocity.x
    }
  }
}

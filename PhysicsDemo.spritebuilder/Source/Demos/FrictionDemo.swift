//
//  FrictionDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class FrictionDemo: PhysicsDemo {
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
    
    // all have same impulse
    // node1 and ground1 both have friction of 0.0 (no slowing)
    node1.physicsBody.applyImpulse(CGPoint(x: 75, y: 0))
    
    // node2 and ground2 both have friction of 0.3 (some slowing)
    node2.physicsBody.applyImpulse(CGPoint(x: 75, y: 0))
    
    // node3 and ground3 both have friction of 1.0 (rapid slowing)
    node3.physicsBody.applyImpulse(CGPoint(x: 75, y: 0))
  }
  
  override func update(delta: CCTime) {
    if started {
      velocity1 = node1.physicsBody.velocity.x
      velocity2 = node2.physicsBody.velocity.x
      velocity3 = node3.physicsBody.velocity.x
    }
  }
}

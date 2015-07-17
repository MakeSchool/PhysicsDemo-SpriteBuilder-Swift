//
//  ForceDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class ForceDemo: PhysicsDemo {
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
  }
  
  override func update(delta: CCTime) {
    if started {
      // forces reset every frame so we call apply force in update
      //
      // shows effect of density, mass & area on force
      // all nodes same area, node1 & node2 same density
      // node3 5x density of node1, moves at same velocity with 5x force
      node1.physicsBody.applyForce(CGPoint(x: 25, y: 0))
      node2.physicsBody.applyForce(CGPoint(x: 125, y: 0))
      node3.physicsBody.applyForce(CGPoint(x: 125, y: 0))
      velocity1 = node1.physicsBody.velocity.x
      velocity2 = node2.physicsBody.velocity.x
      velocity3 = node3.physicsBody.velocity.x
    }
  }

}

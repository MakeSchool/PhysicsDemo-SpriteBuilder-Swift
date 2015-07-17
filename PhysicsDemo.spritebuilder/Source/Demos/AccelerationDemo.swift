//
//  AccelerationDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class AccelerationDemo: PhysicsDemo {
  weak var node1: CCNodeColor!
  var node1Start: CGPoint!
  weak var node1AccelerationLabel: CCLabelBMFont!
  weak var node1VelocityLabel: CCLabelBMFont!
  var velocity1: CGFloat = 0.0 {
    didSet {
      let velocityString = String(format: "%.0f", velocity1)
      node1VelocityLabel.setString("Velocity: \(velocityString)")
    }
  }
  weak var node1DistanceLabel: CCLabelBMFont!
  var distance1: CGFloat = 0.0 {
    didSet {
      let distanceString = String(format: "%.0f", distance1)
      node1DistanceLabel.setString("Distance: \(distanceString)")
    }
  }
  
  
  weak var node2: CCNodeColor!
  var node2Start: CGPoint!
  weak var node2AccelerationLabel: CCLabelBMFont!
  weak var node2VelocityLabel: CCLabelBMFont!
  var velocity2: CGFloat = 0.0 {
    didSet {
      let velocityString = String(format: "%.0f", velocity2)
      node2VelocityLabel.setString("Velocity: \(velocityString)")
    }
  }
  weak var node2DistanceLabel: CCLabelBMFont!
  var distance2: CGFloat = 0.0 {
    didSet {
      let distanceString = String(format: "%.0f", distance2)
      node2DistanceLabel.setString("Distance: \(distanceString)")
    }
  }
  
  var started = false
  
  func didLoadFromCCB() {
    node1Start = node1.positionInPoints
    node2Start = node2.positionInPoints
  }
  
  override func startDemo() {
    started = true
    
    node1AccelerationLabel.setString("Acceleration: 1")
    node2AccelerationLabel.setString("Acceleration: 4")
  }
  
  override func update(delta: CCTime) {
    if started {
      // acceleration calculated from F = m / a
      // forces reset every frame so we call apply force in update
      node1.physicsBody.applyForce(CGPoint(x: 25, y: 0))
      node2.physicsBody.applyForce(CGPoint(x: 100, y: 0))
      
      distance1 = ccpDistance(node1Start, node1.positionInPoints)
      distance2 = ccpDistance(node2Start, node2.positionInPoints)
      velocity1 = node1.physicsBody.velocity.x
      velocity2 = node2.physicsBody.velocity.x
    }
  }

}

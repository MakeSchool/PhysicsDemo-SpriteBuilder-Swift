//
//  VelocityDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class VelocityDemo: PhysicsDemo {
  weak var node1: CCNodeColor!
  var node1Start: CGPoint!
  weak var node1VelocityLabel: CCLabelBMFont!
  weak var node1DistanceLabel: CCLabelBMFont!
  var distance1: CGFloat = 0.0 {
    didSet {
      let distanceString = String(format: "%.0f", distance1)
      node1DistanceLabel.setString("Distance: \(distanceString)")
    }
  }
  
  
  weak var node2: CCNodeColor!
  var node2Start: CGPoint!
  weak var node2VelocityLabel: CCLabelBMFont!
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
    // set the velocity once and it will continue if no outside forces
    node1.physicsBody.velocity = CGPoint(x: 25, y: 0)
    node1VelocityLabel.setString("Velocity: 25")
    node2.physicsBody.velocity = CGPoint(x: 50, y: 0)
    node2VelocityLabel.setString("Velocity: 50")
  }
  
  override func update(delta: CCTime) {
    if started {
      // calculates distance between two points
      distance1 = ccpDistance(node1Start, node1.positionInPoints)
      distance2 = ccpDistance(node2Start, node2.positionInPoints)
    }
  }
}

//
//  DistanceDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class DistanceDemo: PhysicsDemo {
  weak var node1: CCNodeColor!
  weak var node2: CCNodeColor!
  weak var distanceLabel: CCLabelBMFont!
  var distance: CGFloat = 0.0 {
    didSet {
      let distanceString = String(format: "%.0f", distance)
      distanceLabel.setString("Distance: \(distanceString)")
    }
  }
  
  override func startDemo() {
    // set the velocity once and it will continue if no outside forces
    node2.physicsBody.velocity = CGPoint(x: 25, y: 0)
  }
  
  override func update(delta: CCTime) {
    // calculates distance between two points
    distance = ccpDistance(node1.positionInPoints, node2.positionInPoints)
  }
}

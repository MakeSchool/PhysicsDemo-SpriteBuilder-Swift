//
//  GrabbingDemo.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class GrabbingDemo: PhysicsDemo {
  
  var grab: ChipmunkMultiGrab!
  var demoPhysicsNode: CCPhysicsNode!
  
  // must have this in Bridging-Header.h:
  // #import "CCPhysics+ObjectiveChipmunk.h"
  
  override func onEnter() {
    super.onEnter()
    userInteractionEnabled = true
    multipleTouchEnabled = true
    demoPhysicsNode = parent as? CCPhysicsNode
    demoPhysicsNode.paused = true
    
    grab = ChipmunkMultiGrab(forSpace: demoPhysicsNode.space, withSmoothing: cpFloat(powf(0.1, 15)), withGrabForce: cpFloat(1e5))
  }
  
  override func startDemo() {
    demoPhysicsNode.paused = false
  }
  
  override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
    grab.beginLocation(touch.locationInNode(self))
  }
  
  override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
    grab.updateLocation(touch.locationInNode(self))
  }
  
  override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
    grab.endLocation(touch.locationInNode(self))
  }
  
  override func touchCancelled(touch: CCTouch!, withEvent event: CCTouchEvent!) {
    grab.endLocation(touch.locationInNode(self))
  }
}

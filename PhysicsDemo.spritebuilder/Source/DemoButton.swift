//
//  DemoButton.swift
//  PhysicsDemo
//
//  Created by Dion Larson on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class DemoButton: CCNode {
  weak var button: CCButton!
  
  // name of CCB file containing demo
  var demoToLoad: String = ""
  
  func didLoadFromCCB() {
    button.title = demoToLoad
  }
  
  func load() {
    var demo = CCBReader.load("Demos/\(demoToLoad)") as! PhysicsDemo
    // super hacky
    var mainScene = parent.parent.parent.parent as! MainScene
    mainScene.loadDemo(demo)
  }
}

import Foundation

class MainScene: CCNode {
  weak var buttonNode: CCNode!
  weak var demoNode: CCPhysicsNode!
  weak var title: CCLabelTTF!
  weak var controlsNode: CCNode!
  weak var startDemoButton: CCButton!
  var currentDemo: PhysicsDemo?
  
  func loadDemo(demo: PhysicsDemo) {
    demo.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
    demo.position = CGPoint(x: 0.0, y: 0.5)
    demoNode.addChild(demo)
    currentDemo = demo
    
    title.string = demo.name
    controlsNode.visible = true
    startDemoButton.visible = true
    buttonNode.visible = false
  }
  
  func start() {
    if let currentDemo = currentDemo {
      currentDemo.startDemo()
      startDemoButton.visible = false
    }
  }
  
  func back() {
    demoNode.removeAllChildren()
    demoNode.debugDraw = false
    startDemoButton.visible = true
    currentDemo = nil
    
    title.string = "Demos"
    controlsNode.visible = false
    buttonNode.visible = true
  }
}

import Foundation
import SceneKit
public class TwoForksScene: ForkScene {
    override internal func setUpScene() {
        super.setUpScene()
        let fork = self.scene.rootNode.childNodes[0].copy() as! SCNNode
        fork.position = SCNVector3(x: 1, y: 0, z: 0)
        self.scene.rootNode.addChildNode(fork)
    }
    override internal func setUpCamera() {
        super.setUpCamera()
        cameraNode.eulerAngles = SCNVector3(x: -8/180*Float.pi, y: 8/180*Float.pi, z: 0/180*Float.pi)
        cameraNode.position = SCNVector3(x: 1, y: 1, z: 3)
    }
}

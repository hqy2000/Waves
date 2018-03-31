import QuartzCore
import SceneKit
import SpriteKit
import ARKit
import UIKit

public class FixedForkScene: UIViewController {
    
    internal let cameraNode = SCNNode()
    internal let scene = SCNScene(named: "fork.obj")!
    internal let particle = SCNParticleSystem(named: "wave.scnp", inDirectory: nil)!
    internal var scaleFactor: CGFloat {
        get { return 1.0 }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        let size = view.frame
        self.setUpCamera()
        self.setUpLight()
        self.setUpNode()
        self.setUpScene()
        self.setUpRecognizer()
        self.setUpAdditionalView(size)
    }
    
    internal func setUpCamera() {
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x: 1, y: 1, z: 2)
        cameraNode.eulerAngles = SCNVector3(x: -15/180*Float.pi, y: 28/180*Float.pi, z: 0/180*Float.pi)
    }

    internal func setUpLight() {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .ambient
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
    }
    
    internal func setUpScene() {
        let scnView = SCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        self.view = scnView
    }
    
    internal func setUpNode() {
        let fork = scene.rootNode.childNode(withName: "mesh_1", recursively: true)!
        fork.runAction(SCNAction.scale(by: self.scaleFactor, duration: 0))
    }
    
    internal func setUpRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    internal func setUpAdditionalView(_ frame: CGRect) {}
    
    @objc internal func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        let scnView = self.view as! SCNView
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            
            node.removeAction(forKey: "audio")
            node.removeParticleSystem(particle)
            node.addParticleSystem(particle)
            let id = self.getWaveId(node.name)
            self.addWavesToOss(index: id)
            let audio = SCNAudioSource(fileNamed: "440.wav")!
            node.runAction(SCNAction.playAudio(audio, waitForCompletion: true), forKey: "audio", completionHandler: {
                node.removeParticleSystem(self.particle)
                self.removeWavesFromOss(index: id)
            })
   
            
            let material = result.node.geometry!.firstMaterial!
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                material.emission.contents = UIColor.black
                SCNTransaction.commit()
            }
            material.emission.contents = UIColor.red
            SCNTransaction.commit()
        }
    }
    internal func getWaveId(_ name: String?) -> Int {
        var id = Int(name ?? "0")
        if id == nil {
            id = 0
        }
        return id!
    }
    internal func addWavesToOss(index:Int = 0) {}
    internal func removeWavesFromOss(index:Int = 0) {}
    
    override public var prefersStatusBarHidden: Bool {
        return true
    }
}

import QuartzCore
import SceneKit
import SpriteKit
import ARKit

public class ForkScene: UIViewController {
    
    let cameraNode = SCNNode()
    let scene = SCNScene(named: "art.scnassets/fork.obj")!
    let particle = SCNParticleSystem(named: "art.scnassets/wave.scnp", inDirectory: nil)!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x: 1, y: 1, z: 2)
        cameraNode.eulerAngles = SCNVector3(x: -15/180*Float.pi, y: 28/180*Float.pi, z: 0/180*Float.pi)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .ambient
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let scnView = SCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        self.view = scnView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)

        //UIApplication.shared.isIdleTimerDisabled = true
    }

    @objc public func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        let scnView = self.view as! SCNView
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        if hitResults.count > 0 {
            cameraNode.removeAction(forKey: "audio")
            scene.rootNode.removeParticleSystem(particle)
            scene.rootNode.addParticleSystem(particle)
            self.addWavesToOss()
            let audio = SCNAudioSource(fileNamed: "art.scnassets/440.wav")!
            cameraNode.runAction(SCNAction.playAudio(audio, waitForCompletion: true), forKey: "audio", completionHandler: {
                self.scene.rootNode.removeParticleSystem(self.particle)
                self.removeWavesFromOss()
            })
   
            let result = hitResults[0]
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
    private func addWavesToOss() {
        //self.oss.waves = [Wave(amplitude: 30, waveLength: 5, frequency: 0.5)]
        //self.oss.waves[0].distanceFromObservor = 2.5
    }
    private func removeWavesFromOss() {
        //self.oss.waves = []
    }
    override public var prefersStatusBarHidden: Bool {
        return true
    }
}

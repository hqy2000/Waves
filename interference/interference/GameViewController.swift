//
//  GameViewController.swift
//  interference
//
//  Created by Qingyang Hu on 17/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit
import ARKit

class GameViewController: UIViewController, ARSCNViewDelegate {

    let cameraNode = SCNNode()
    let scene = SCNScene(named: "art.scnassets/fork.obj")!
    let particle = SCNParticleSystem(named: "art.scnassets/wave.scnp", inDirectory: nil)!
    let oss = GameScene<WaveFormDecreasing>(size: CGSize(width: 400, height: 400))
    
    override func viewDidLoad() {
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
        
        let scnView = self.view as! ARSCNView
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.overlaySKScene = oss
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        scnView.delegate = self
        
        let fork = scene.rootNode.childNode(withName: "mesh_1", recursively: true)!
        fork.runAction(SCNAction.scale(by: 0.01, duration: 0))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let scnView = self.view as! ARSCNView
        scnView.session.run(ARWorldTrackingConfiguration())
    }
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! ARSCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            cameraNode.removeAction(forKey: "audio")
            scene.rootNode.removeParticleSystem(particle)
            scene.rootNode.addParticleSystem(particle)
            self.oss.waves = [Wave(amplitude: 30, waveLength: 5, frequency: 0.5)]
            self.oss.waves[0].distanceFromObservor = 2.5
            let audio = SCNAudioSource(fileNamed: "art.scnassets/440.wav")!
            cameraNode.runAction(SCNAction.playAudio(audio, waitForCompletion: true), forKey: "audio", completionHandler: {
                self.scene.rootNode.removeParticleSystem(self.particle)
                self.oss.waves = []
            })
            
            
            let result = hitResults[0]
            
            // get its material
            let material = result.node.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
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
    
  
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        print(camera.trackingState)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}

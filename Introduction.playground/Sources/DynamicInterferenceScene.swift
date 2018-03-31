//
//  File.swift
//  wwdc
//
//  Created by Qingyang Hu on 25/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit
import ARKit
import UIKit

public class DynamicInterferenceScene: FixedInterferenceScene, ARSCNViewDelegate, ARSessionDelegate {
    override internal var scaleFactor: CGFloat {
        get { return 0.02 }
    }
    override internal func setUpNode() {
        super.setUpNode()
        //scene.rootNode.childNodes[0].addParticleSystem(self.particle)
        //scene.rootNode.childNodes[3].addParticleSystem(self.particle)
    }
    override internal func setUpScene() {
        let scnView = ARSCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = false
        //scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        scnView.delegate = self
        scnView.session.delegate = self
        //scnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin,.showPhysicsShapes]
        self.view = scnView
    }
    override internal func setUpAdditionalView(_ frame: CGRect) {
        super.setUpAdditionalView(frame)
        self.addWavesToOss(index: 0)
        self.addWavesToOss(index: 1)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        (self.view as! ARSCNView).session.run(configuration)
    }
    
    @objc override func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        return
    }
    
    public func session(_ session: ARSession, didUpdate frame: ARFrame) {
        
        let matrix = frame.camera.transform
        self.waves[0].distanceFromObservor = matrix.getDistance(from: scene.rootNode.childNodes[0].position, withFactor: Float(self.scaleFactor))
        self.waves[1].distanceFromObservor = matrix.getDistance(from: scene.rootNode.childNodes[3].position, withFactor: Float(self.scaleFactor))
    }
}

extension matrix_float4x4 {
    var position: double3 {
        get {
            return double3(Double(columns.3.x), Double(columns.3.y), Double(columns.3.z))
        }
    }
    public func getDistance(from origin: SCNVector3, withFactor factor: Float) -> Double {
        let x = columns.3.x - origin.x
        let y = columns.3.y - origin.y
        let z = columns.3.z - origin.z
        let distance = sqrt(pow(Double(x), 2.0) + pow(Double(y), 2.0) + pow(Double(z), 2.0)) / Double(factor)
        return distance
    }
}

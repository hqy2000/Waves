//
//  DynamicDopplerScene.swift
//  wwdc
//
//  Created by Qingyang Hu on 27/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit
import ARKit
import UIKit

public class DynamicDopplerScene: FixedDopplerScene, ARSessionDelegate {
    override internal var scaleFactor: CGFloat {
        get { return 0.02 }
    }
    var lastPosition = double3(0, 0, 0)
    var lastReport = Date()
    override internal func setUpScene() {
        let scnView = ARSCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = false
        //scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        scnView.session.delegate = self
        scnView.preferredFramesPerSecond = 30
        self.view = scnView
    }
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        (self.view as! ARSCNView).session.run(configuration)
    }
    public func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let position = frame.camera.transform.position
        self.observorDirection = (position - self.lastPosition).scaleBy(1.0 / Date().timeIntervalSince(self.lastReport))
        self.lastPosition = position
        self.lastReport = Date()
    }
}

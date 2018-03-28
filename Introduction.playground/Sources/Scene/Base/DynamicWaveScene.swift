//
//  DynamicForkScene.swift
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

public class DynamicWaveScene: FixedWaveScene, ARSCNViewDelegate {
    override internal var scaleFactor: CGFloat {
        get { return 0.02 }
    }
    override internal func setUpScene() {
        let scnView = ARSCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        scnView.delegate = self
        self.view = scnView
    }
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        (self.view as! ARSCNView).session.run(configuration)
    }
}

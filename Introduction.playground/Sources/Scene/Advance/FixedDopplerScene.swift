//
//  FixDopplerScene.swift
//  wwdc
//
//  Created by Qingyang Hu on 27/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

class FixedDopplerScene: FixedForkScene {
    public var wave = [Wave(amplitude: 50, waveLength: 5, frequency: 0.4)]
    public var emmiterDirection = double3(0, 0, 0)
    public var observorDirection = double3(0, 0, 2)
    public var refreshInterval: TimeInterval = 0.1
    internal override func setUpCamera() {
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 2)
        cameraNode.eulerAngles = SCNVector3(x: 0/180*Float.pi, y: 0, z: 0)
    }
    //public var observorSpeed = double3(0, 0, 0)
    internal var oss: Oscilloscope<WaveFormDoppler>? = nil
    
    override internal func setUpAdditionalView(_ frame: CGRect) {
        oss = Oscilloscope<WaveFormDoppler>(size: CGSize(width: frame.width, height: frame.height))
        oss?.waveform.addWave(wave[0])
        let view = self.view as! SCNView
        view.overlaySKScene = oss
        let forkNode = scene.rootNode.childNodes[0]
        forkNode.addParticleSystem(particle)
        self.move()
    }
    
    override internal func setUpScene() {
        super.setUpScene()
        (self.view as! SCNView).allowsCameraControl = true
    }
    
    
    internal func move() {
        let forkNode = scene.rootNode.childNodes[0]
        let forkPosition = double3(forkNode.position)
        let cameraPosition = double3(cameraNode.position)
        forkNode.runAction(SCNAction.move(by: SCNVector3(emmiterDirection).scaleBy(Float(refreshInterval)).scaleBy(Float(self.scaleFactor)), duration: self.refreshInterval))
        cameraNode.runAction(SCNAction.move(by: SCNVector3(observorDirection).scaleBy(Float(refreshInterval)).scaleBy(Float(self.scaleFactor)), duration: self.refreshInterval))
        oss?.waveform.emmiterSpeed = emmiterDirection.magnitude * emmiterDirection.getCosValue((cameraPosition - forkPosition).scaleBy(Double(1.0 / self.scaleFactor)))
        oss?.waveform.observorSpeed = observorDirection.magnitude * observorDirection.getCosValue((forkPosition - cameraPosition).scaleBy(Double(1.0 / self.scaleFactor)))
        DispatchQueue.global().asyncAfter(deadline: .now() + self.refreshInterval) {
            self.move()
        }
    }
    
    
}

extension double3 {
    var magnitude: Double {
        get {
            return sqrt(pow(x, 2.0) + pow(y, 2.0) + pow(z, 2.0))
        }
    }
    static func ~> (_ left: double3, _ right: double3) -> Double {
        return left.x * right.x + left.y * right.y + left.z * right.z
    }
    func getCosValue (_ vector: double3) -> Double {
        if(self.magnitude == 0 || vector.magnitude == 0) {
            return 0.0
        }
        return (self ~> vector)/(self.magnitude * vector.magnitude)
    }
    func scaleBy(_ scale: Double) -> double3 {
        return double3(x * scale, y * scale, z * scale)
    }
}

extension SCNVector3 {
    func scaleBy(_ scale: Float) -> SCNVector3 {
        return SCNVector3(x * scale, y * scale, z * scale)
    }
}

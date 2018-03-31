//
//  FixedOscilloscopeScene.swift
//  wwdc
//
//  Created by Qingyang Hu on 29/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import SpriteKit

public class FixedOscilloscopeScene: UIViewController {
    public var wave = Wave(amplitude: 50, waveLength: 5, frequency: 0.5)
    
    override public func viewDidLoad() {
        let view = SKView()
        let scene = Oscilloscope<WaveFormSimple>(size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
        scene.height = self.view.frame.height / 2
        scene.backgroundColor = .white
        self.view = view
        view.showsFPS = true
        view.showsNodeCount = true
        self.view.backgroundColor = .black
        scene.waveform.addWave(wave)
        view.presentScene(scene)
    }
}

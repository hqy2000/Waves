//
//  WaveFormDoppler.swift
//  wwdc
//
//  Created by Qingyang Hu on 20/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

class WaveFormDoppler: WaveForm {
    var emmiterSpeed: Double = 0
    var observorSpeed: Double = 0
    override func calc() {
        if self.running {
            let waveBefore = waves[0]
            let waveAfter = waveBefore.mutableCopy() as! Wave
            waveAfter.frequency = waveBefore.frequency * (330.0 + observorSpeed) / (330.0 - emmiterSpeed)
            let amplitudes = [self.getAmplitude(wave: waveBefore),self.getAmplitude(wave: waveAfter)]
            self.callback?(amplitudes)
            super.calc()
        }
    }
}

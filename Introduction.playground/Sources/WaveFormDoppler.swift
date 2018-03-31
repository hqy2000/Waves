//
//  WaveFormDoppler.swift
//  wwdc
//
//  Created by Qingyang Hu on 20/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

public class WaveFormDoppler: WaveForm {
    var emmiterSpeed: Double = 0
    var observorSpeed: Double = 0
    override func calc() {
        if self.running {
            let waveBefore = waves[0]
            let waveAfter = waveBefore.mutableCopy() as! WaveBehavior
            if(waveAfter.properties.speed <= emmiterSpeed - observorSpeed || waveAfter.properties.speed <= observorSpeed - emmiterSpeed) {
                let amplitudes = [self.getAmplitude(wave: waveBefore),0]
                self.callback?(amplitudes)
            } else {
                waveAfter.properties.frequency = waveBefore.properties.frequency * (waveBefore.properties.speed + observorSpeed) / (waveBefore.properties.speed - emmiterSpeed)
                let amplitudes = [self.getAmplitude(wave: waveBefore),self.getAmplitude(wave: waveAfter)]
                self.callback?(amplitudes)
            }
            
            super.calc()
        }
    }
}

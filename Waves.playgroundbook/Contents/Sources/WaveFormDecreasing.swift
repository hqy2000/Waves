//
//  WaveFormDecreasing.swift
//  wwdc
//
//  Created by Qingyang Hu on 19/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

public class WaveFormDecreasing: WaveForm {
    public var decreasingConstant: Double = 0.9
    override func calc() {
        if self.running {
            if waves.count > 0 {
                let wave = waves[0]
                var amplitudes = [self.getAmplitude(wave: wave)]
                let parameter: Double = pow(self.decreasingConstant, Date().timeIntervalSince(wave.startTime))
                amplitudes.append(amplitudes[0] * parameter)
                callback?(amplitudes)
            } else {
                callback?([0])
            }
            super.calc()
        }
    }
}

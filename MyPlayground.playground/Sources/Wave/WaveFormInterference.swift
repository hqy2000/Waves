//
//  WaveInterference.swift
//  wwdc
//
//  Created by Qingyang Hu on 19/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

class WaveFormInterference: WaveForm {
    //TODO: Distance calc
    override internal func calc(){
        if self.running {
            var amplitudes:[Double] = []
            for wave in waves {
                amplitudes.append(self.getAmplitude(wave: wave))
            }
            amplitudes.append(amplitudes.reduce(0.0, { (result, value) -> Double in
                return result + value
            }))
            callback?(amplitudes)
            super.calc()
        }
    }
    
}

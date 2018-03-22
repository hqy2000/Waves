//
//  WaveFormSimple.swift
//  interference
//
//  Created by Qingyang Hu on 22/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

class WaveFormSimple: WaveForm {
    override internal func calc(){
        if self.running {
            var amplitudes:[Double] = []
            for wave in waves {
                amplitudes.append(self.getAmplitude(wave: wave))
            }
            callback?(amplitudes)
            super.calc()
        }
    }
    
}

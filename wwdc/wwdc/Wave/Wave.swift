//
//  File.swift
//  wwdc
//
//  Created by Qingyang Hu on 18/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

class Wave: NSMutableCopying {
    func mutableCopy(with zone: NSZone? = nil) -> Any {
        return Wave(amplitude: self.amplitude, waveLength: self.waveLength, frequency: self.frequency)
    }
    
    public var phaseDiffrenrce:Double = 0.0
    public var distanceFromObservor:Double {
        get {
            fatalError("This is a write-only variable!")
            //return 0.0
        }
        set {
            let difference = newValue.remainder(dividingBy: self.waveLength) / self.waveLength
            self.phaseDiffrenrce = difference * 2 * Double.pi
        }
    }
    public var amplitude:Double // the height of the wave, measured in meters.
    public var waveLength:Double // the distance between adjacent crests, measured in meters.
    public var frequency:Double // the number of complete waves that pass a point in one second, measured in inverse seconds, or Hertz (Hz).
    public var period:Double {
        get {
            return 1.0 / frequency
        }
        set {
            frequency = 1.0 / newValue
        }
    } // the time it takes for one complete wave to pass a given point, measured in seconds.
    
    public var speed:Double {
        get {
            return waveLength / period
        }
    } // the horizontal speed of a point on a wave as it propagates, measured in meters / second.
    
    init(amplitude: Double, waveLength: Double, frequency: Double) {
        self.amplitude = amplitude
        self.waveLength = waveLength
        self.frequency = frequency
    }
}

extension Double {
    static let speedOfSoundInAir:Double = 330
}

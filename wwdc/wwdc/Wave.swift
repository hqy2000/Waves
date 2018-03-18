//
//  File.swift
//  wwdc
//
//  Created by Qingyang Hu on 18/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

class Wave {
    public var amplitude:Double // the height of the wave, measured in meters.
    public var waveLength:Double // the distance between adjacent crests, measured in meters.
    public var frequency:Double // the number of complete waves that pass a point in one second, measured in inverse seconds, or Hertz (Hz)
    public var period:Double {
        get {
            return 1.0 / frequency
        }
        set {
            frequency = 1.0 / newValue
        }
    } // the time it takes for one complete wave to pass a given point, measured in seconds
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

class WaveForm {
    public var waves:[Wave]
    public var interval:TimeInterval
    internal var startTime:Date? = nil
    internal var running:Bool = false
    internal var callback:(([Double]) -> Void)? = nil
    
    init(waves: [Wave], reportInterval interval: TimeInterval) {
        self.waves = waves
        self.interval = interval
    }
    
    public func start(callback: @escaping ([Double]) -> Void) {
        self.running = true
        self.startTime = Date()
        self.callback = callback
        self.calc()
    }
    
    public func stop() {
        self.running = false
        self.startTime = nil
        self.callback = nil
    }
    
    internal func getAmplitude(wave:Wave) -> Double {
        let time = Date().timeIntervalSince(self.startTime!)
        let current = time.remainder(dividingBy: wave.period)
        let rawAmplitude = sin(current / wave.period * 2.0 * Double.pi)
        let amplitude = rawAmplitude * wave.amplitude
        return amplitude
    }
    
    internal func calc() {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.calc()
        }
    }
}

class SimpleWaveForm: WaveForm {
    override internal func calc(){
        if(self.running) {
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

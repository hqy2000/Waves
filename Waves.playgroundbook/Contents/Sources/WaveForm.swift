//
//  WaveForm.swift
//  wwdc
//
//  Created by Qingyang Hu on 19/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

public class WaveForm: WaveFormProtocol {
    public var waves:[WaveBehavior]
    public var interval:TimeInterval
    internal var running:Bool = false

    internal var callback:(([Double]) -> Void)? = nil
    
    required public init(waves: [Wave], reportInterval interval: TimeInterval) {
        self.waves = waves.map { wave -> WaveBehavior in
            return WaveBehavior(wave)
        }
        self.interval = interval
    }
    
   
    
    public func start(callback: @escaping ([Double]) -> Void) {
        self.running = true
        self.callback = callback
        self.calc()
    }
    
    public func stop() {
        self.running = false
    }
    
    internal func getAmplitude(wave:WaveBehavior) -> Double {
        let time = Date().timeIntervalSince(wave.startTime) + wave.properties.period * wave.properties.phaseDifferenrce
        let current = time.remainder(dividingBy: wave.properties.period)
        let rawAmplitude = sin(current / wave.properties.period * 2.0 * Double.pi)
        let amplitude = rawAmplitude * wave.properties.amplitude
        return amplitude
    }
    
    internal func calc() {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.calc()
        }
    }
}

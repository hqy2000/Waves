//
//  WaveForm.swift
//  wwdc
//
//  Created by Qingyang Hu on 19/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

class WaveForm {
    public var waves:[Wave]
    public var interval:TimeInterval
    public var distance:Double = 0
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

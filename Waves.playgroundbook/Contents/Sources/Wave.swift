//
//  File.swift
//  wwdc
//
//  Created by Qingyang Hu on 18/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

public class Wave: NSMutableCopying, Equatable {
    public static func == (lhs: Wave, rhs: Wave) -> Bool {
        return lhs.amplitude == rhs.amplitude && lhs.waveLength == rhs.waveLength && lhs.frequency == rhs.frequency
    }
    
    public func mutableCopy(with zone: NSZone? = nil) -> Any {
        return Wave(amplitude: self.amplitude, waveLength: self.waveLength, frequency: self.frequency)
    }
    
    public var phaseDifferenrce:Double = 0.0 {
        willSet {
            if newValue > 1.0 || newValue < 0.0 {
                fatalError("Phase difference should be greater than 0 and less than 1!")
            }
        }
    }
    public var distanceFromObservor:Double {
        get {
            fatalError("This is a write-only variable!")
            //return 0.0
        }
        set {
            self.phaseDifferenrce = abs(newValue.remainder(dividingBy: self.waveLength) / self.waveLength)
        }
    }
    public var amplitude:Double {
        willSet {
            if newValue < 0 {
                fatalError("The amplitude must be bigger than 0!")
            }
        }
    } // the height of the wave, measured in meters.
    public var waveLength:Double {
        willSet {
            if newValue < 0 {
                fatalError("The wavelength must be bigger than 0!")
            }
        }
    } // the distance between adjacent crests, measured in meters.
    public var frequency:Double {
        willSet {
            if newValue < 0 {
                fatalError("The frequency must be bigger than 0!")
            }
        }
    } // the number of complete waves that pass a point in one second, measured in inverse seconds, or Hertz (Hz).
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
    
    public let id: String
    
    public init(amplitude: Double, waveLength: Double, frequency: Double) {
        self.amplitude = amplitude
        self.waveLength = waveLength
        self.frequency = frequency
        self.id = String(describing: amplitude) + String(describing: waveLength) + String(describing: frequency) + String(describing: arc4random_uniform(1000000))
    }
    
    public init(amplitude: Double, waveLength: Double, frequency: Double, phaseDifference: Double) {
        self.amplitude = amplitude
        self.waveLength = waveLength
        self.frequency = frequency
        self.phaseDifferenrce = phaseDifference
        self.id = String(describing: amplitude) + String(describing: waveLength) + String(describing: frequency) + String(describing: arc4random_uniform(1000000))
    }
}

extension Double {
    static let speedOfSoundInAir:Double = 330
}

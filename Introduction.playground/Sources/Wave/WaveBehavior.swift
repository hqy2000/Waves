//
//  WaveBehavior.swift
//  wwdc
//
//  Created by Qingyang Hu on 25/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//
import Foundation

public class WaveBehavior: NSMutableCopying {
    public func mutableCopy(with zone: NSZone? = nil) -> Any {
        return WaveBehavior(properties.mutableCopy() as! Wave, startTime: startTime)
    }
    init(_ wave: Wave, startTime: Date = Date()) {
        self.properties = wave
        self.startTime = startTime
    }
    let properties: Wave
    let startTime: Date
}

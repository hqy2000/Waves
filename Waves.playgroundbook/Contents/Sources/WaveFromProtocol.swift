//
//  WaveFromProtocol.swift
//  interference
//
//  Created by Qingyang Hu on 22/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

public protocol WaveFormProtocol {
    var waves:[WaveBehavior] {get set}
    var interval:TimeInterval {get set}
    
    init(waves: [Wave], reportInterval interval: TimeInterval)
    
    func start(callback: @escaping ([Double]) -> Void)
    func stop()
    
}

extension WaveFormProtocol {
    public mutating func addWave(_ wave: Wave) {
        self.waves.append(WaveBehavior(wave))
    }
    
    public mutating func removeWave(_ id: String) {
        if let id = self.waves.index(where: { $0.properties.id == id }) {
            self.waves.remove(at: id)
        } else {
            debugPrint("Wave not found" + id)
        }
        
    }
}

//
//  WaveFromProtocol.swift
//  interference
//
//  Created by Qingyang Hu on 22/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

public protocol WaveFormProtocol {
    var waves:[Wave] {get set}
    var interval:TimeInterval {get set}
    
    init(waves: [Wave], reportInterval interval: TimeInterval)
    
    func start(callback: @escaping ([Double]) -> Void)
    func stop()
}

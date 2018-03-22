//
//  WaveFromProtocol.swift
//  interference
//
//  Created by Qingyang Hu on 22/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import Foundation

protocol WaveFormProtocol {
    var waves:[Wave] {get set}
    var interval:TimeInterval {get set}
    var startTime:Date? {get set}
    var running:Bool {get set}
    var callback:(([Double]) -> Void)? {get set}
    
    init(waves: [Wave], reportInterval interval: TimeInterval)
    
    func start(callback: @escaping ([Double]) -> Void)
    func stop()
}

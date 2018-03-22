//
//  GameScene.swift
//  wwdc
//
//  Created by Qingyang Hu on 17/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene<T: WaveFormProtocol>: SKScene {
    
    private var previous:[CGPoint?] = [nil]
    private var waveform: T?
    private var node: SKNode = SKNode()
    public var waves:[Wave] = [] {
        didSet {
            waveform?.stop()
            self.previous.removeAll()
            while previous.count <= waves.count {
                previous.append(nil)
            }
            self.draw()
        }
    }
    public var height:CGFloat = 30
    override func didMove(to view: SKView) {
        self.drawAxis()
        self.initialize()
        self.draw()
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.garbageCollection()
    }
    
    private func initialize() {
        self.addChild(node)
        node.position = CGPoint(x: frame.width, y: height)
        self.backgroundColor = .black
        //node.position = CGPoint(x: frame.width / 2 , y:0)
    }
    
    private func draw() {
        //let waves = [Wave(amplitude: 50, waveLength: 5, frequency: 0.5),Wave(amplitude: 50, waveLength: 5, frequency: 0.5)]
        //waves[1].distanceFromObservor = 2.5
        let waveform = T(waves: waves, reportInterval: 0.05)
        waveform.start { (amplitudes) in
            for (index,amplitude) in amplitudes.enumerated() {
                var color = UIColor.green
                if(index >= self.waves.count){
                    color = UIColor.red
                }
                self.drawWave(index: index, amplitude: amplitude, color: color)
            }
            self.shift()
        }
        self.waveform = waveform
    }
    private func drawWave(index:Int, amplitude:Double, color:UIColor = UIColor.green) {
        if let previous = previous[index] {
            var points = [
                previous,
                CGPoint(x: Double(previous.x) + 1.0, y: amplitude)
            ]
            self.previous[index] = CGPoint(x: Double(previous.x) + 1.0, y: amplitude)
            let shape = SKShapeNode(splinePoints: &points, count: points.count)
            shape.strokeColor = color
            node.addChild(shape)
        } else {
            self.previous[index] = CGPoint(x: Double(-self.node.position.x + self.frame.width), y: amplitude)
        }
        
    }
    
    private func drawAxis() {
        var axis = [
            CGPoint(x: -self.frame.width, y: height),
            CGPoint(x: +self.frame.width, y: height)
        ]
        let line = SKShapeNode(points: &axis, count: axis.count)
        self.addChild(line)
    }
    
    private func shift() {
        self.node.position = CGPoint(x: self.node.position.x - 1, y: self.node.position.y)
    }
    
    private func garbageCollection() {
        for shape in node.children {
            let line = shape as! SKShapeNode
            let points = line.path?.getPathElementsPoints()
            
            if points![0].x + node.position.x < -frame.width / 2 {
                shape.removeFromParent()
            } else {
                break
            }
        }
    }

}

extension CGPath {
    func forEach( body: @convention(block) (CGPathElement) -> Void) {
        typealias Body = @convention(block) (CGPathElement) -> Void
        let callback: @convention(c) (UnsafeMutableRawPointer, UnsafePointer<CGPathElement>) -> Void = { (info, element) in
            let body = unsafeBitCast(info, to: Body.self)
            body(element.pointee)
        }
        //print(MemoryLayout.size(ofValue: body))
        let unsafeBody = unsafeBitCast(body, to: UnsafeMutableRawPointer.self)
        self.apply(info: unsafeBody, function: unsafeBitCast(callback, to: CGPathApplierFunction.self))
    }
    
    
    func getPathElementsPoints() -> [CGPoint] {
        var arrayPoints : [CGPoint]! = [CGPoint]()
        self.forEach { element in
            switch (element.type) {
            case CGPathElementType.moveToPoint:
                arrayPoints.append(element.points[0])
            case .addLineToPoint:
                arrayPoints.append(element.points[0])
            case .addQuadCurveToPoint:
                arrayPoints.append(element.points[0])
                arrayPoints.append(element.points[1])
            case .addCurveToPoint:
                arrayPoints.append(element.points[0])
                arrayPoints.append(element.points[1])
                arrayPoints.append(element.points[2])
            default: break
            }
        }
        return arrayPoints
    }
    
    func getPathElementsPointsAndTypes() -> ([CGPoint],[CGPathElementType]) {
        var arrayPoints : [CGPoint]! = [CGPoint]()
        var arrayTypes : [CGPathElementType]! = [CGPathElementType]()
        self.forEach { element in
            switch (element.type) {
            case CGPathElementType.moveToPoint:
                arrayPoints.append(element.points[0])
                arrayTypes.append(element.type)
            case .addLineToPoint:
                arrayPoints.append(element.points[0])
                arrayTypes.append(element.type)
            case .addQuadCurveToPoint:
                arrayPoints.append(element.points[0])
                arrayPoints.append(element.points[1])
                arrayTypes.append(element.type)
                arrayTypes.append(element.type)
            case .addCurveToPoint:
                arrayPoints.append(element.points[0])
                arrayPoints.append(element.points[1])
                arrayPoints.append(element.points[2])
                arrayTypes.append(element.type)
                arrayTypes.append(element.type)
                arrayTypes.append(element.type)
            default: break
            }
        }
        return (arrayPoints,arrayTypes)
    }
}

//
//  GameScene.swift
//  wwdc
//
//  Created by Qingyang Hu on 17/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var previous:[CGPoint?] = [nil,nil,nil,nil]
    private var node = SKNode()
    
    override func didMove(to view: SKView) {
        self.addChild(node)
        node.position = CGPoint(x: frame.width / 2 , y:0)
        let waves = [Wave(amplitude: 100, waveLength: 5, frequency: 0.3),Wave(amplitude: 78, waveLength: 5, frequency: 0.7),Wave(amplitude: 20, waveLength: 5, frequency: 0.5)]
        let waveform = SimpleWaveForm(waves: waves, reportInterval: 0.05)
        waveform.start { (amplitudes) in
            var interference:Double = 0.0
            for (index,amplitude) in amplitudes.enumerated() {
                interference += amplitude
                var color = UIColor.green
                if(index >= waves.count){
                    color = UIColor.red
                }
                if self.previous[index] != nil {
                    self.drawWave(index: index, amplitude: amplitude, color: color)
                } else {
                    self.previous[index] = CGPoint(x: 0.0, y: amplitude)
                }
            }
            self.drawAxis()
            self.node.position = CGPoint(x: self.node.position.x - 1, y: self.node.position.y)
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
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
    
    private func drawWave(index:Int, amplitude:Double, color:UIColor = UIColor.green){
        var points = [
            previous[index]!,
            CGPoint(x: Double(previous[index]!.x) + 1.0, y: amplitude)
        ]
        previous[index] = CGPoint(x: Double(previous[index]!.x) + 1.0, y: amplitude)
        let shape = SKShapeNode(splinePoints: &points, count: points.count)
        shape.strokeColor = color
        node.addChild(shape)
    }
    
    private func drawAxis(){
        var axis = [
            CGPoint(x: Double(previous[0]!.x), y: 0),
            CGPoint(x: Double(previous[0]!.x) + 1.0, y: 0)
        ]
        let line = SKShapeNode(points: &axis, count: axis.count)
        self.node.addChild(line)
    }

}

extension CGPath {
    
    func forEach( body: @convention(block) (CGPathElement) -> Void) {
        typealias Body = @convention(block) (CGPathElement) -> Void
        let callback: @convention(c) (UnsafeMutableRawPointer, UnsafePointer<CGPathElement>) -> Void = { (info, element) in
            let body = unsafeBitCast(info, to: Body.self)
            body(element.pointee)
        }
        print(MemoryLayout.size(ofValue: body))
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

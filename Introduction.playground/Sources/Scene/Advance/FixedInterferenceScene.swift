import Foundation
import SceneKit
public class FiexedInterferenceScene: FixedForkScene {
    internal var oss:Oscilloscope<WaveFormInterference>? = nil
    public var waves = [Wave(amplitude: 50, waveLength: 5, frequency: 0.5),Wave(amplitude: 50, waveLength: 5, frequency: 0.5)] {
        willSet {
            if newValue.count != 2 {
                fatalError("You should specify exactly 2 waves!")
            }
        }
    }
    public var newPosition = SCNVector3(x: 1.0, y: 0, z: 0)
    
    override internal func addWavesToOss(index:Int = 0) {
        self.removeWavesFromOss(index: index)
        let wave = self.waves[index].mutableCopy() as! Wave
        self.waves[index] = wave
        oss!.waveform.addWave(wave)
    }
    
    override internal func removeWavesFromOss(index:Int = 0) {
        oss!.waveform.removeWave(self.waves[index].id)
    }
    
    override internal func setUpAdditionalView(_ frame: CGRect) {
        oss = Oscilloscope<WaveFormInterference>(size: CGSize(width: frame.width, height: frame.height))
        let view = self.view as! SCNView
        view.overlaySKScene = oss
    }
    
    override internal func setUpNode() {
        super.setUpNode()
        let scene = SCNScene(named: "art.scnassets/fork.obj")!
        let fork = scene.rootNode.childNodes[0]
        newPosition.x = newPosition.x * Float(self.scaleFactor)
        fork.position = newPosition
        fork.name = "1"
        fork.runAction(SCNAction.scale(by: self.scaleFactor, duration: 0))
        fork.isHidden = false
        //fork.isFocused = true
        self.scene.rootNode.addChildNode(fork)
        
    }
    
    
    override internal func setUpCamera() {
        super.setUpCamera()
        cameraNode.eulerAngles = SCNVector3(x: -8/180*Float.pi, y: 8/180*Float.pi, z: 0/180*Float.pi)
        cameraNode.position = SCNVector3(x: 1, y: 1, z: 3)
    }
}

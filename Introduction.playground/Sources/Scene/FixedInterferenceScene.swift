import Foundation
import SceneKit
public class FiexedInterferenceScene: FixedForkScene {
    internal var oss:Oscilloscope<WaveFormInterference>? = nil
    internal var waves = [Wave(amplitude: 50, waveLength: 5, frequency: 0.5),Wave(amplitude: 50, waveLength: 5, frequency: 0.5)]
    
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
        let fork = self.scene.rootNode.childNodes[0].copy() as! SCNNode
        fork.position = SCNVector3(x: 1, y: 0, z: 0)
        fork.name = "1"
        fork.runAction(SCNAction.scale(by: self.scaleFactor, duration: 0))
        self.scene.rootNode.addChildNode(fork)
    }
    
    override internal func setUpCamera() {
        super.setUpCamera()
        cameraNode.eulerAngles = SCNVector3(x: -8/180*Float.pi, y: 8/180*Float.pi, z: 0/180*Float.pi)
        cameraNode.position = SCNVector3(x: 1, y: 1, z: 3)
    }
}

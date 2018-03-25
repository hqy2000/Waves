import Foundation
import SceneKit
import UIKit

public class WaveScene: ForkScene {
    
    let waves = [Wave(amplitude: 50, waveLength: 2, frequency: 0.4)]
    var oss: Oscilloscope<WaveFormSimple>? = nil
    
    override internal func addWavesToOss(index:Int = 0) {
        oss!.waves.append(waves[index])
    }
    
    override internal func removeWavesFromOss(index:Int = 0) {
        oss!.removeWave(waves[index])
    }
    
    override internal func setUpAdditionalView(_ frame: CGRect) {
        oss = Oscilloscope<WaveFormSimple>(size: CGSize(width: frame.width, height: frame.height))
        oss!.waves = waves
        let view = self.view as! SCNView
        view.overlaySKScene = oss
    }
}

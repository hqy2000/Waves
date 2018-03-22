import PlaygroundSupport
import SceneKit
import SpriteKit
import ARKit

class IntroductionWaveController: UIViewController {
    override func viewDidLoad() {
        let view = SKView()
        let scene = Oscilloscope<WaveFormSimple>(size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
        self.view = view
        self.view.backgroundColor = .black
        scene.waves = [Wave(amplitude: 30, waveLength: 5, frequency: 1)]
        view.presentScene(scene)
    }
}

PlaygroundPage.current.liveView = IntroductionWaveController()

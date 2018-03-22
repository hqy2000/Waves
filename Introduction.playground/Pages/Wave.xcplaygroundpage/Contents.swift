//#-hidden-code
import PlaygroundSupport
import SceneKit
import SpriteKit
import ARKit
//#-end-hidden-code
/*:
 # Wave
 
 **Welcome to the world of waves!**
 
 Wave is a common physical phenomenon in the world, made by vibrations. Common things like sound and light are transmitted in the form of waves. Therefore it is an essential way to make communications.
 
 In this playground book, you will be guided through the fanstaic world of waves and explore many interesting characteristics about waves in an interactive way.
 
 Now please click on 'Run My Code' button. It will turn on an oscilloscope, a machine to display how much the wave vibrates. You can explore a little bit by changing the paramters below.
 */
let amplitude: Double = /*#-editable-code*/80/*#-end-editable-code*/
let frequency: Double = /*#-editable-code*/0.1/*#-end-editable-code*/
//#-hidden-code
class IntroductionWaveController: UIViewController {
    override func viewDidLoad() {
        let view = SKView()
        let scene = Oscilloscope<WaveFormSimple>(size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
        scene.height = self.view.frame.height / 2
        scene.backgroundColor = .white
        self.view = view
        view.showsFPS = true
        view.showsNodeCount = true
        self.view.backgroundColor = .black
        
        let wave = Wave(
            amplitude: amplitude,
            waveLength: 5,
            frequency: frequency
        )
        scene.waves = [wave]
        view.presentScene(scene)
    }
}

PlaygroundPage.current.liveView = IntroductionWaveController()
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

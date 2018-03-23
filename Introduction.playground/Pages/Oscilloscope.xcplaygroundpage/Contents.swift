//#-hidden-code
import PlaygroundSupport
import SceneKit
import SpriteKit
import ARKit
//#-end-hidden-code
/*:
 # Oscilloscope
 
 To obeserve a wave, we can use our hearing for sound waves and eyes for light waves. But what if we want to observe in a scientific wave? In this situation, we will use an oscilloscope.
 
 Now please click on 'Run My Code' button. It will turn on an oscilloscope, a machine to display how much the wave vibrates. You can explore a little bit by changing the paramters of the wave being displayed below.
 */
let amplitude: Double = /*#-editable-code*/80/*#-end-editable-code*/
let frequency: Double = /*#-editable-code*/0.1/*#-end-editable-code*/
//: [Next](@next)
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

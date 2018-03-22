import UIKit
import SpriteKit
import PlaygroundSupport

class WelcomeController: UIViewController {
    override func viewDidLoad() {
        let scene = Oscilloscope<WaveFormDecreasing>()
    }
}

//#-hidden-code
import PlaygroundSupport
import SceneKit
import SpriteKit
import ARKit
//#-end-hidden-code
/*:
 # Augment Reality
 Now let us combine the tunning fork and the oscilloscope together. Clicking on the fork will result in a wave being produced, and the wave will be shown on the oscilloscope as a result.
 */
let scene = DynamicWaveScene()
//#-hidden-code
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

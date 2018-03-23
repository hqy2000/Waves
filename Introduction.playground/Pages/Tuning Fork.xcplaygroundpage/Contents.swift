//#-hidden-code
import PlaygroundSupport
import SceneKit
import SpriteKit
import ARKit
//#-end-hidden-code
/*:
 # Tuning Fork
 Our everyday sounds are too complicated to observe, so we will use a tuning fork for the experiment. Tuning fork is a physical device to generate a sound at a certain frequency when hit. Scientifically, it can generate a certain wave.
 
 Try run the code and tap on the small tunning fork. You will be able to hear a standard sine wave sound. Remember to use a headphone or turn of the mute mode.
 */
let scene = ForkScene()
//#-hidden-code
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

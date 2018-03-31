//#-hidden-code
import UIKit
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
import SceneKit
//#-end-hidden-code
/*:
 # Doppler Effect
 
 Now here comes more fun. Tap 'Run My Code', and control the speed of the camera by your hands. Off you go!
 
 */
let wave = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
let emmiterDirection = double3(/*#-editable-code*/0/*#-end-editable-code*/, /*#-editable-code*/0/*#-end-editable-code*/, /*#-editable-code*/0/*#-end-editable-code*/)
//#-hidden-code
let scene = DynamicDopplerScene()
scene.wave = [wave]
scene.emmiterDirection = emmiterDirection
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)
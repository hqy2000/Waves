//#-hidden-code
import PlaygroundSupport
import SceneKit
import SpriteKit
import ARKit
//#-end-hidden-code
/*:
 # Oscilloscope
 
 To obeserve a wave, we can use our hearing for sound waves and eyes for light waves. But what if we want to observe in a scientific wave? In this situation, we will use an oscilloscope. An image of the wave will be produced on the screen of it. The trace on the screen will show the regular up-and-down pattern of the vibrations that produce the sound, which is also called *waveform*.
 
 Now please click on 'Run My Code' button. It will turn on an oscilloscope. You can explore a little bit by changing the paramters of the wave being displayed below.
 */
let wave = Wave(amplitude: /*#-editable-code*/100/*#-end-editable-code*/, waveLength: /*#-editable-code*/20/*#-end-editable-code*/, frequency: /*#-editable-code*/0.2/*#-end-editable-code*/)
//: [Next](@next)
//#-hidden-code
let controller = FixedOscilloscopeScene()
controller.wave = wave
PlaygroundPage.current.liveView = controller
//#-end-hidden-code

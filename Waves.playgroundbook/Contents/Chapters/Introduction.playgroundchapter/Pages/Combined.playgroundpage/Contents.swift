//#-hidden-code
import UIKit
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Combined
 Now let us combine the tunning fork and the oscilloscope together. Clicking on the fork will result in a wave being produced, and the wave will be shown on the oscilloscope as a result.
 
 This time, two waves will be displayed on the oscilloscope. The red one represents the actual wave that you hear, while the blue one represents the original wave.
 
 You may wonder why the amplitude of the actual wave is constantly decreasing. That is due to the viration of the fork is decreasing as a result of air resistance and many other effects.
 */
let wave = Wave(amplitude: /*#-editable-code*/100/*#-end-editable-code*/, waveLength: /*#-editable-code*/20/*#-end-editable-code*/, frequency: /*#-editable-code*/0.2/*#-end-editable-code*/)
/*#-editable-code*/// wave.period = 5/*#-end-editable-code*/
//#-hidden-code
let controller = FixedWaveScene()
controller.waves = [wave]
PlaygroundPage.current.liveView = controller
//#-end-hidden-code
//: [Next](@next)
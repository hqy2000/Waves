//#-hidden-code
import UIKit
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Wave
 
 As perviously shown, a wave is caused by a substance vibrating. Here are some foundamental properties of waves: [amplitude](glossary://amplitude), [wavelength](glossary://wavelength), [frequency](glossary://frequency), [period](glossary://period) and [phase](glossary://phase).
 
 Now please click on 'Run My Code' button. Explore how the properties of the waves will affect its waveform. There might be some properties that do not affect the waveform.
 */
let wave = Wave(amplitude: /*#-editable-code*/100/*#-end-editable-code*/, waveLength: /*#-editable-code*/20/*#-end-editable-code*/, frequency: /*#-editable-code*/0.2/*#-end-editable-code*/)
wave.phaseDifferenrce = /*#-editable-code*/0/*#-end-editable-code*/
/*#-editable-code*/// wave.period = 5/*#-end-editable-code*/ // If you want to change the period of the wave, which will affect the frequency set above, you can remove the comment and change the value.
//: [Next](@next)
//#-hidden-code
let controller = FixedOscilloscopeScene()
controller.wave = wave
PlaygroundPage.current.liveView = controller
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Wave
 
 As perviously shown, a wave is caused by a substance vibrating. To extend
 
 Here are some foundamental properties of waves that is neccessary for you to know:
 
 - **ampltude(A)**: the distance from the maximum point to the undisturbed level, or, the height of the crest.
 
 - **wavelength(λ)**: the distance from one crest of the wave to the next.
 
 - **frequency(f)**: the number of waves send out each second.
 
 - **period(T)**: the time taken for one complete wave to pass a point. This can be calculated through *1/f*.
 
 Now please click on 'Run My Code' button. Explore how the properties of the waves will affect its waveform. There might be some properties that do not affect the waveform.
 */
let wave = Wave(amplitude: /*#-editable-code*/100/*#-end-editable-code*/, waveLength: /*#-editable-code*/20/*#-end-editable-code*/, frequency: /*#-editable-code*/0.2/*#-end-editable-code*/)
/*#-editable-code*/// wave.period = 5/*#-end-editable-code*/ // If you want to change the period of the wave, which will affect the frequency set above, you can remove the comment and change the value.
//: [Next](@next)
//#-hidden-code
let controller = FixedOscilloscopeScene()
controller.wave = wave
PlaygroundPage.current.liveView = controller
//#-end-hidden-code

//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Interference
 
 When two waves meet together, what do you think will happen? Is it going to increase, decrease, or remain constant? In physics, this is called *wave interference*.
 
 In this experiment, you are going to explore the wave before and after the interference. Click on 'Run My Code', and tap each tuning fork. Observe the changes in the final wave.
 */
let wave_1 = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
let wave_2 = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
//#-hidden-code
let scene = FixedInterferenceScene()
scene.waves = [wave_1,wave_2]
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

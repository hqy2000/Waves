//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Interference
 
 Now you are going to empl
 */
let wave_1 = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
let wave_2 = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
//#-hidden-code
let scene = DynamicInterferenceScene()
scene.waves = [wave_1,wave_2]
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

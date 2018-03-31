//#-hidden-code
import UIKit
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Interference
 
 You have just explored about some basics in wave interference. However, in the last experiment, the observor is fixed in one position. Now, you are going to explore the situation with free observor. Click on 'Run My Code', and try to get a [constructive](glossary://constructive%20interference) and [destructive](glossary://destructive%20interference) [wave interference](glossary://interference).
 */
let waves = [
    Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/),
    Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
]
//#-hidden-code
let scene = DynamicInterferenceScene()
scene.waves = waves
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)
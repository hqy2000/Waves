//#-hidden-code
import UIKit
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Augment Reality

 Doing an experiment by clicking a fixed object is very boring, so let us do it in an interactive way. Find a clean table, hold your iPad, and click on 'Run My Code', you will see the whole set of equipment coming lively.
 
 If you cannot find your equipment, try restarting your code.
 */
let wave = Wave(amplitude: /*#-editable-code*/100/*#-end-editable-code*/, waveLength: /*#-editable-code*/20/*#-end-editable-code*/, frequency: /*#-editable-code*/0.2/*#-end-editable-code*/)
/*#-editable-code*/// wave.period = 5/*#-end-editable-code*/
//#-hidden-code
let controller = DynamicWaveScene()
controller.waves = [wave]
PlaygroundPage.current.liveView = controller
//#-end-hidden-code
//: [Next](@next)
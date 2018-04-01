//#-hidden-code
import UIKit
//#-end-hidden-code
//#-hidden-code
import PlaygroundSupport
import SceneKit
//#-end-hidden-code
/*:
 # Doppler Effect
 
 Have you ever experienced that the tone(frequency) of the alert coming from an ambulance increasing and decreasing as it passes by? This is called [doppler effect](glossary://doppler%20effect).
 
 In this experiment, you will explore how the speed will influence the final frequency of the wave. Change the speed and click on 'Run My Code' and observe the changes in frequency.
 
 */
let wave = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
let speed = /*#-editable-code*/2.0/*#-end-editable-code*/
//#-hidden-code
let emmiterDirection = double3(0, 0, 0)
let observorDirection = double3(0, 0, speed)
let scene = FixedDopplerScene()
scene.wave = [wave]
scene.emmiterDirection = emmiterDirection
scene.observorDirection = observorDirection
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

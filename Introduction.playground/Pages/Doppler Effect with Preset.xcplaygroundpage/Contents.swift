//#-hidden-code
import PlaygroundSupport
import SceneKit
//#-end-hidden-code
/*:
 # Doppler Effect
 
 Have you ever experienced that the alert comming from an ambulence increasing and decreasing as it passes by? This is called [doppler effect](glossary://doppler effect).
 
 In this experiment, you will explore how the speed will influence the final frequency of the wave. Change the direction and click on 'Run My Code'. Observe the changes in frequency.
 
 If the fork runs away, you can move the camera by dragging on the screen. You can also restart your code.
 
 *Note: the speed is presented in a vector of the change in direction per second. (0,0,2) means it will move 2 units on z-axis every second.*
 
 */
let wave = Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
let emmiterDirection = double3(/*#-editable-code*/0/*#-end-editable-code*/, /*#-editable-code*/0/*#-end-editable-code*/, /*#-editable-code*/0/*#-end-editable-code*/)
let observorDirection = double3(/*#-editable-code*/0/*#-end-editable-code*/, /*#-editable-code*/0/*#-end-editable-code*/, /*#-editable-code*/2/*#-end-editable-code*/)
//#-hidden-code
let scene = FixedDopplerScene()
scene.wave = [wave]
scene.emmiterDirection = emmiterDirection
scene.observorDirection = observorDirection
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

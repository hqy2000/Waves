//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Interference
 
 When two waves meet together, what do you think will happen? Is it going to increase, decrease, or remain constant? In physics, this is called [wave interference](glossary://interference).
 
 In this experiment, you are going to explore the wave before and after the interference. Click on 'Run My Code', and tap each tuning fork. Observe the changes in the final wave. Remember both codes and your taps influence the [phase difference](glossary://phase difference).
 
 The amplitude of the final wave should be the total ampltude of the two waves at that time.
 
 When two waves are in [phase](glossary://phase), a [constructive interference](glossary://constructive interference) will happen, while when two waves are completely out of [phase](glossary://phase), a [destructive interference](glossary://destructive interference) will happen.
 */
let waves = [
    Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/),
    Wave(amplitude: /*#-editable-code*/50/*#-end-editable-code*/, waveLength: /*#-editable-code*/5/*#-end-editable-code*/, frequency: /*#-editable-code*/0.5/*#-end-editable-code*/)
]
waves[0].phaseDifferenrce = /*#-editable-code*/0/*#-end-editable-code*/
waves[1].phaseDifferenrce = /*#-editable-code*/0/*#-end-editable-code*/
//#-hidden-code
let scene = FixedInterferenceScene()
scene.waves = waves
PlaygroundPage.current.liveView = scene
//#-end-hidden-code
//: [Next](@next)

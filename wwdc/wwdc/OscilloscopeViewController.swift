//
//  GameViewController.swift
//  wwdc
//
//  Created by Qingyang Hu on 17/03/2018.
//  Copyright © 2018 Qingyang Hu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class OscilloscopeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    /*
        if let view = self.view as! SKView? {
            let scene = GameScene(size: CGSize(width: 200, height: 100))
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
 */
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

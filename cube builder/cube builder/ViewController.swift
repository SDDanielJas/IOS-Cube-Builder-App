//
//  ViewController.swift
//  World Tracking 5
//
//  Created by Daniel Jasinski on 9/15/20.
//  Copyright © 2020 Daniel Jasinski. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view.
    }

    @IBAction func addRight(_ Sender:Any){
        
        let node = SCNNode() //node is not visalbe on its own
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node.position = SCNVector3(0,0,-0.3)
        
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }
    
    @IBAction func addLeft(_ Sender: Any){
        let antherBox = SCNNode()
        antherBox.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        antherBox.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        antherBox.position = SCNVector3(-0.1, 0 ,-0.3)
        self.sceneView.scene.rootNode.addChildNode(antherBox)
    }
    @IBAction func addtop (_ Sender: Any) {
        let antherBox = SCNNode()
        antherBox.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        antherBox.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        antherBox.position = SCNVector3(-0.05, 0.1 ,-0.3)
        self.sceneView.scene.rootNode.addChildNode(antherBox)
    }
    
    
    @IBAction func reset(_ sender: Any){
        self.restartSession()
    }
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes {(node, _ ) in node.removeFromParentNode()}
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
}



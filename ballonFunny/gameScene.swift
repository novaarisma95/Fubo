//
//  gameScene.swift
//  ballonFunny
//
//  Created by Nova Arisma on 26/05/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class gameScene: SKScene {
   
    override func didMove(to view: SKView) {
        addEmitter()}
   
    func addEmitter() {
        let emitter = SKEmitterNode(fileNamed: Emitter.smile)!
        emitter.zPosition = Layers.emitter
        emitter.position = CGPoint(x: size.width / 2, y: size.height)
        emitter.advanceSimulationTime(30)
        addChild(emitter)
        
    }}


//    func addEmitter(){
//        let emitter = SKEmitterNode(fileNamed: "smile")
//        emitter.zPosition = Layers.emitter
//        emitter.position = CGPoint(x: size.width/2, y: size.)
//
//    }
//
//    override func touchesEnded(_touches:Set<UITouch>,with event:UIEvent?){
//        guard let touch = touches.first else {return}
//        let touchLocation = touch.location(in:self)
//    }
//}

//class gameScene: SKScene{
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let touchLocation = touch.location(in: self)
//            let particlePath = Bundle.main.path(forResource: "smile", ofType: "sks")!
//            let particle = NSKeyedUnarchiver.unarchivedObject(withFile : particlePath) as! SKEmitterNode
//
//            particle.name = "smiling"
//            particle.position = touchLocation
//            particle.targetNode = self
//
//            addChild(particle)
//
//
//
//        }
//    }
//}

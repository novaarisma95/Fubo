//
//  emitter.swift
//  ballonFunny
//
//  Created by Nova Arisma on 20/05/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit

class Emitter {
    
//    func circle() {
//        let emitter = CAEmitterLayer()
//        emitter.emitterPosition = CGPoint(x:balloon.frame.width/2,y:0)
//        emitter.emitterSize = CGSize(width: balloon.frame.width, height: 2)
//        balloon.layer.addSublayer(emitter)
        
        func circleEmiter() -> SKEmitterNode? {
        return SKEmitterNode(fileNamed: "circle.sks")
    }
        
}
}

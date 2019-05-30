//
//  smile.swift
//  ballonFunny
//
//  Created by Nova Arisma on 26/05/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene{
    
    var smile:SKEmitterNode!
  
    override func didMove(to view: SKView) {
        
        smile = SKEmitterNode(fileNamed: "smile.sks")
       smile.position = CGPoint(x: 0, y: 1472)
        smile.advanceSimulationTime(10)
        self.addChild(smile)
        
        smile.zPosition = -1

}
}

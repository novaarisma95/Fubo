import UIKit
import SpriteKit
import GameplayKit

class circle: SKScene {
    
    var circleFrame:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.white
        var frames:[SKTexture] = []
        
        let circleAtlas = SKTextureAtlas(named: "circle")
        
        for index in 1 ... 6 {
            let textureName = "circle\(index)"
            let texture = circleAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.circleFrame = frames
        
    }
    
    
    func cicleFly() {
        let texture = self.circleFrame![0]
        let circle = SKSpriteNode(texture: texture)
        
        circle.size = CGSize(width: 140, height: 140)
        
        let randomCircleYPositionGenerator = GKRandomDistribution(lowestValue: 50, highestValue: Int(self.frame.size.height))
        let yPosition = CGFloat(randomCircleYPositionGenerator.nextInt())
        
        let rightToLeft = arc4random() % 2 == 0
        
        let xPosition = rightToLeft ? self.frame.size.width + circle.size.width / 2 : -circle.size.width / 2
        
        circle.position = CGPoint(x: xPosition, y: yPosition)
        
        if rightToLeft {
            circle.xScale = -1
        }
        
        self.addChild(circle)
        
        circle.run(SKAction.repeatForever(SKAction.animate(with: self.circleFrame!, timePerFrame: 0.05, resize: false, restore: true)))
        
        var distanceToCover = self.frame.size.width + circle.size.width
        
        if rightToLeft {
            distanceToCover *= -1
        }
        
        let time = TimeInterval(abs(distanceToCover / 140))
        
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)
        
        let removeAction = SKAction.run {
            circle.removeAllActions()
            circle.removeFromParent()
        }
        
        let allActions = SKAction.sequence([moveAction, removeAction])
        
        circle.run(allActions)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}







////
////  circle.swift
////  ballonFunny
////
////  Created by Nova Arisma on 20/05/19.
////  Copyright © 2019 Nova Arisma. All rights reserved.
////
//
//import UIKit
//
//class circle: UIButton {
//
//    func createParticles() {
//        let particleEmitter = CAEmitterLayer()
//
//        particleEmitter.emitterPosition = CGPoint(x: circle.center.x, y: -96)
//        particleEmitter.emitterShape = .circle
//        particleEmitter.emitterSize = CGSize(width: circle.frame.size.width, height: 1)
//
//        let red = makeEmitterCell(color: UIColor.red)
//        let green = makeEmitterCell(color: UIColor.green)
//        let blue = makeEmitterCell(color: UIColor.blue)
//
//        particleEmitter.emitterCells = [red, green, blue]
//
//            circle.layer.addSublayer(particleEmitter)
//    }
//
//    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
//        let cell = CAEmitterCell()
//        cell.birthRate = 3
//        cell.lifetime = 7.0
//        cell.lifetimeRange = 0
//        cell.color = color.cgColor
//        cell.velocity = 200
//        cell.velocityRange = 50
//        cell.emissionLongitude = CGFloat.pi
//        cell.emissionRange = CGFloat.pi / 4
//        cell.spin = 2
//        cell.spinRange = 3
//        cell.scaleRange = 0.5
//        cell.scaleSpeed = -0.05
//
//        cell.contents = UIImage(named: "particle_confetti")?.cgImage
//        return cell
//}
//}

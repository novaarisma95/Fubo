//
//  ViewController.swift
//  ballonFunny
//
//  Created by Nova Arisma on 19/05/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation


class ViewController: UIViewController{
let emitterLayer = CAEmitterLayer()

    
    @IBOutlet weak var balloon: UIImageView!

    var imageView : UIImageView!
    var currentAnimation = 0
    var status = 1
    var timer = Timer()
    var skView: SKView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView (image: UIImage(named: "ballon"))
        imageView.center = CGPoint(x: 119.43, y: 366.67)
    }
    
    func setupgameScene(){
        let spriteView = SKView()
        spriteView.frame = view.frame
        spriteView.allowsTransparency = true
        spriteView.backgroundColor = UIColor.clear
        
        let spriteScene = SKScene(size: view.frame.size)
        spriteScene.scaleMode = .aspectFill;
        spriteScene.backgroundColor = UIColor.clear
        
        
        let spriteParticle = SKSpriteNode(fileNamed: "smile.sks")
        spriteParticle?.position = CGPoint(x: view.frame.width/2, y: view.frame.height)
        
        spriteScene.addChild(spriteParticle!)
        spriteView.presentScene(spriteScene)
        view.addSubview(spriteView)
        
        
        
    }
//    func launchSmile(){
//        let smile:SKEmitterNode = SKEmitterNode(fileNamed: "smile.sks")!
//
//    }
    func setupBaseLayer()
    {
        // Add a layer that emits, animates, and renders a particle system.
        let size = view.bounds.size
        emitterLayer.emitterPosition = CGPoint(x: size.width / 2, y: size.height - 500)
        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive
        view.layer.addSublayer(emitterLayer)
    }
    
    func launchFireworks(){
        // Get particle image
        let particleImage = UIImage(named: "circle")?.cgImage
        
        // The definition of a particle (launch point of the firework)
        
        let baseCell = CAEmitterCell()
        baseCell.color = UIColor.white.withAlphaComponent(0.8).cgColor
        baseCell.emissionLongitude = -CGFloat.pi / 2
        baseCell.emissionRange = CGFloat.pi / 5
        baseCell.emissionLatitude = 0
        baseCell.lifetime = 2.0
        baseCell.birthRate = 1
        baseCell.velocity = 400
        baseCell.velocityRange = 50
        baseCell.yAcceleration = 300
        baseCell.redRange   = 0.5
        baseCell.greenRange = 0.5
        baseCell.blueRange  = 0.5
        baseCell.alphaRange = 0.5
        
        // The definition of a particle (rising animation)
        let risingCell = CAEmitterCell()
        risingCell.contents = particleImage
        risingCell.emissionLongitude = (4 * CGFloat.pi) / 2
        risingCell.emissionRange = CGFloat.pi / 7
        risingCell.scale = 0.4
        risingCell.velocity = 100
        risingCell.birthRate = 50
        risingCell.lifetime = 1.5
        risingCell.yAcceleration = 350
        risingCell.alphaSpeed = -0.7
        risingCell.scaleSpeed = -0.1
        risingCell.scaleRange = 0.1
        risingCell.beginTime = 0.01
        risingCell.duration = 0.7
        
        // The definition of a particle (spark animation)
        let cell = CAEmitterCell()
        cell.contents = particleImage
        cell.birthRate = 10000
        cell.velocity = 130
        cell.lifetime = 1.0
        cell.emissionRange = (2 * .pi)
        /* determines size of explosion */
        cell.scale = 0.1
        cell.alphaSpeed = -0.2
        cell.yAcceleration = 20
        cell.beginTime = 0
        cell.duration = 0.1
        cell.scaleSpeed = -0.015
        cell.spin = 2
        cell.name = "firework"
        
        baseCell.emitterCells = [cell]
        timer.invalidate()
        UIView.animate(withDuration: 1.4, animations: {
            self.emitterLayer.emitterCells = [baseCell]
            self.timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.removeEmitter), userInfo: nil, repeats: true)
        }, completion: { (true) in
            
        })
}

    @objc func removeEmitter() {
        self.emitterLayer.emitterCells?.removeAll()
        self.setupgameScene()
    }

    
    
    @IBAction func button(_ sender:
        UIButton) {
        sender.isHidden = true
        UIView.animate(withDuration: 0.25, delay: 0, options: [], animations:{
            
            if(self.status == 1){
            self.balloon.transform = CGAffineTransform(scaleX: 2, y: 2)
            }
            else if(self.status == 2){
            self.balloon.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            }
            else if(self.status == 3){
            self.balloon.transform = CGAffineTransform(scaleX: 3, y: 3)
            }
            else if(self.status == 4){
                self.balloon.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
            }
            else if(self.status == 5){
                self.balloon.transform = CGAffineTransform(scaleX: 4, y: 4)
            }
            else if(self.status == 6){
                self.balloon.transform = CGAffineTransform(scaleX: 4.5, y: 4.5)
            }
            else if(self.status == 7){
                self.balloon.transform = CGAffineTransform(scaleX: 5, y: 5)
                self.setupBaseLayer()
                self.launchFireworks()
                self.balloon.alpha = 0
                
        }
            self.status += 1
        }

            
        ){ finished in
            sender.isHidden = false
        }
        
//        audio.play()
    
        
            
//        currentAnimation += 1
//
//        if currentAnimation > 7 { {
//            currentAnimation = 0
        
    
    
        }
    //      UIView.animate(withDuration: 1, animations:{
//            self.balloon.frame = CGRect (x: 119.43, y: 366.67, width: 180, height: 190)
//
//        })
//        UIView.animate(withDuration: 1,delay: 0.25, animations:{
//                self.balloon.frame = CGRect (x: 119.43, y: 366.67, width: 250, height: 200)
//            self.balloon.frame = CGRect (x: 119.43, y: 366.67, width: 300, height: 250)
//            self.balloon.frame = CGRect (x: 119.43, y: 366.67, width: 600, height: 500)
//}
//        )}


}

